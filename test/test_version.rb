# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_version.rb


require 'helper'


class TestVersion < MiniTest::Test


  def test_version

    pp Jasony::UNESCAPE_MAP
    pp Jasony::ML_ESCAPE_MAP

    pp Jasony::BACKTICK_ML_QUOTE
    puts Jasony::BACKTICK_ML_QUOTE
    pp Jasony::SINGLE_QUOTE
    puts Jasony::SINGLE_QUOTE
    pp Jasony::DOUBLE_QUOTE
    puts Jasony::DOUBLE_QUOTE

    pp Jasony::CLANG_ML_COMMENT
    puts Jasony::CLANG_ML_COMMENT
    pp Jasony::CLANG_COMMENT
    puts Jasony::CLANG_COMMENT


    puts Jasony::VERSION
    assert true
    ## assume everything ok if get here
  end

end # class TestVersion
