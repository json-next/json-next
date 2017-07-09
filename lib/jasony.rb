# encoding: utf-8

require 'json'
require 'strscan'   ## StringScanner
require 'pp'


# our own code
require 'jasony/version'   # note: let version always go first
require 'jasony/pattern'    #  shared utils for "custom" parser
require 'jasony/commata'

require 'jasony/parser/hanson'
require 'jasony/parser/son'



# say hello
puts Jasony.banner    if defined?( $RUBYLIBS_DEBUG )
