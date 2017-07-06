# encoding: utf-8

###
#  to run use
#     ruby -I ./lib -I ./test test/test_parser.rb


require 'helper'


class TestParser < MiniTest::Test

  def test_hanson
    exp_sample1 = {
      "listName"=>"Sesame Street Monsters",
      "content"=>
        [{"name"=>"Cookie Monster",
          "background"=> "Cookie Monster used to be a\n    monster that ate everything, especially cookies.\n    These days he is forced to eat \"healthy\" food."
         },
         {"name"=>"Herry Monster",
          "background"=> "Herry Monster is a furry blue monster with a purple nose.\n    He's mostly retired today."
        }
       ]}

    sample1 =<<TXT
    {
      listName: "Sesame Street Monsters", // note that listName needs no quotes
      content: [
        {
          name: "Cookie Monster",
          /* Note the template quotes and unescaped regular quotes in the next string */
          background: `Cookie Monster used to be a
    monster that ate everything, especially cookies.
    These days he is forced to eat "healthy" food.`
        }, {
          // You can single-quote strings too:
          name: 'Herry Monster',
          background: `Herry Monster is a furry blue monster with a purple nose.
    He's mostly retired today.`
        },    // don't worry, the trailing comma will be ignored
       ]
    }
TXT

    puts HANSON.convert( sample1 )

    pp HANSON.parse( sample1 )

    assert_equal exp_sample1, HANSON.parse( sample1 )
  end

end
