# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_version.rb


require 'helper'


class TestVersion < MiniTest::Test


  def test_version

    pp HANSON::UNESCAPE_MAP
    pp HANSON::ML_ESCAPE_MAP

    pp HANSON::ML_QUOTE
    puts HANSON::ML_QUOTE
    pp HANSON::SINGLE_QUOTE
    puts HANSON::SINGLE_QUOTE
    pp HANSON::DOUBLE_QUOTE
    puts HANSON::DOUBLE_QUOTE

    pp HANSON::ML_COMMENT
    puts HANSON::ML_COMMENT
    pp HANSON::COMMENT
    puts HANSON::COMMENT


    puts Jasony::VERSION
    assert true
    ## assume everything ok if get here
  end

end # class TestVersion
