# encoding: utf-8

require 'json'
require 'pp'


# our own code
require 'jasony/version'   # note: let version always go first
require 'jasony/parser/hanson'




# say hello
puts Jasony.banner    if defined?( $RUBYLIBS_DEBUG )
