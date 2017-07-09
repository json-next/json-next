# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_parser_son.rb


require 'helper'


class TestParserSon < MiniTest::Test

  def test_son
    exp_sample1 = {
       "name"=>"Alexander Grothendieck",
       "fields"=>"mathematics",
       "main_topics"=>
         ["Etale cohomology", "Motives", "Topos theory", "Schemes"]
    }

    sample1 =<<TXT
     {
        # Personal information

        "name": "Alexander Grothendieck"
        "fields": "mathematics"
        "main_topics": [
            "Etale cohomology"
            "Motives"
            "Topos theory"
            "Schemes"
        ]
    }
TXT

    puts SON.convert( sample1 )

    assert_equal exp_sample1, SON.parse( sample1 )
  end

end
