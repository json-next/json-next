# encoding: utf-8

###
#  based on github.com/timjansen/hanson
#   Thanks to Tim Jansen


class HANSON

  UNESCAPE_MAP = {
    %(\\") => %("),     ## "\\\"" => "\"",
    %(\\`) => %(`),     ## "\\`"  => "`",
    %(\\') => %(')      ## "\\'"  => "'"
  }

  ML_ESCAPE_MAP = {
    %(\n) => %(\\n),    ## "\n" => "\\n",
    %(\r) => %(\\r),    ## "\r" => "\\r",
    %(\t) => %(\\t),    ## "\t" => "\\t",
    %(")  => %(\\")     ## "\"" => "\\\""
  }


  ## note: regex pattern \\ needs to get escaped twice, thus, \\.
  ##  and for literal \\ use \\\\\.

  ## todo: check for newlines   [^] incl. newline ?


  ## note: add named captures for "inner" unquotes string values


  ML_QUOTE      = %{`(?<ml_quote>(?:\\\\.|[^`])*)`}    ## todo:check if [^`] includes/matches newline?
  SINGLE_QUOTE  = %{'(?<single_quote>(?:\\\\.|[^'])*)'}
  DOUBLE_QUOTE  = %{"(?:\\\\.|[^"])*"}


  ML_COMMENT     = "/\\*.*?\\*/"        ## use . instead of [^] - why? why not?
  COMMENT        = "//.*\\n?"           ## todo/check: why is newline optional (use and incl $ marker) -why? why not?


  KEYWORDS       = "(?:true|false|null)(?=[^\\w_$]|$)"

  IDENTIFIER     = "(?<identifier>[a-zA-Z_$][\\w_$]*)"

  TRAILING_COMMA = "(?<trailing_comma>,)(?=\\s*[}\\]])"


  def self.convert( text )

    # text is the HanSON string to convert.

    # todo: add keep_line_numbers options - why? why not?
    #  see github.com/timjansen/hanson


    ## pass 1: remove comments
     text = text.gsub( /#{ML_QUOTE}|#{SINGLE_QUOTE}|#{DOUBLE_QUOTE}|#{ML_COMMENT}|#{COMMENT}/ ) do |match|
       ## puts "match: >>#{match}<< : #{match.class.name}"
       if match[0] == ?/    ## comments start with // or /*
         ## puts "!!! removing comments"
         ''    ## remove / strip comments
       else
         match
       end
     end


     ## pass 2: requote
     text = text.gsub( /#{KEYWORDS}|#{IDENTIFIER}|#{ML_QUOTE}|#{SINGLE_QUOTE}|#{DOUBLE_QUOTE}|#{TRAILING_COMMA}/ ) do |match|
       ## puts "match: >>#{match}<< : #{match.class.name}"

       m = Regexp.last_match
       if m[:ml_quote]
         ## puts "!!! ml_quote -- convert to double quotes"
         str = m[:ml_quote]
         str = str.gsub( /\\./ ) {|r| UNESCAPE_MAP[r] || r }
         str = str.gsub( /[\n\r\t"]/ ) { |r| ML_ESCAPE_MAP[r] }
         '"' + str + '"'
       elsif m[:single_quote]
         ## puts "!!! single_quote -- convert to double quotes"
         str = m[:single_quote]
         str = str.gsub( /\\./ ) {|r| UNESCAPE_MAP[r] || r }
         str = str.gsub( /"/, %{\\"} )
         '"' + str + '"'
       elsif m[:identifier]
         ## puts "!!! identfier -- wrap in double quotes"
         '"' + m[:identifier] + '"'
       elsif m[:trailing_comma]
         ## puts "!!! trailing comma -- remove"
         ''
       else
         match
       end
    end

     text
  end

  def self.parse( text )
    JSON.parse( self.convert( text ) )
  end

end # class HANSON
