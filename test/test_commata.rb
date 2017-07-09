# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_commata.rb


require 'helper'


class TestCommata < MiniTest::Test

  def test_commata

    sample1a =<<TXT
     {
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

  exp_sample1b = {
    "name" => "Alexander Grothendieck",
    "fields" => "mathematics",
    "main_topics" =>
      ["Etale cohomology", "Motives", "Topos theory", "Schemes"]
  }


    sample2a =<<TXT
     {
      "nested": {
        "name": "Alexander Grothendieck"
        "fields": "mathematics"
        "array": ["one" "two"]  }
      "numbers": [1 2 3 4 5]
      "more_numbers": [1.1 2.0 0.3 4.444 -5.1]
      "mixed": [1 true false null]
     }
TXT

    sample2a1 =<<TXT
     {
      "nested": {
        "name": "Alexander Grothendieck",
        "fields": "mathematics",
        "array": ["one", "two"]  },
      "numbers": [1, 2, 3, 4, 5],
      "more_numbers": [1.1, 2.0, 0.3, 4.444, -5.1],
      "mixed": [1, true, false, null]
     }
TXT



   exp_sample2b = {
       "nested" => {
         "name" => "Alexander Grothendieck",
         "fields" => "mathematics",
         "array" => ["one", "two"]
       },
       "numbers" => [1, 2, 3, 4, 5],
       "more_numbers" => [1.1, 2.0, 0.3, 4.444, -5.1],
       "mixed" => [1, true, false, nil]
    }


    sample1b = JSON::Next::Commata.convert( sample1a, debug: true )
    puts sample1b

    assert_equal exp_sample1b, JSON.parse( sample1b )


    sample2b = JSON::Next::Commata.convert( sample2a, debug: true )
    puts sample2b

    assert_equal exp_sample2b, JSON.parse( sample2b )


    sample2b1 = JSON::Next::Commata.convert( sample2a1, debug: true )
    puts sample2b1

    assert_equal exp_sample2b, JSON.parse( sample2b1 )
  end

end
