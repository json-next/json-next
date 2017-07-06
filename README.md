# jasony

jasony gem -  read generation y / next generation json versions with comments, unquoted keys, multi-line strings, trailing commas, and more


* home  :: [github.com/datatxt/jasony](https://github.com/datatxt/jasony)
* bugs  :: [github.com/datatxt/jasony/issues](https://github.com/datatxt/jasony/issues)
* gem   :: [rubygems.org/gems/jasony](https://rubygems.org/gems/jasony)
* rdoc  :: [rubydoc.info/gems/jasony](http://rubydoc.info/gems/jasony)




## Usage - `HANSON.parse`

### HanSON

_HanSON - JSON for Humans by Tim Jansen et al_

HanSON is an extension of JSON  with a few simple additions to the spec:

- quotes for strings are optional if they follow JavaScript identifier rules.
- you can alternatively use backticks, as in ES6's template string literal, as quotes for strings.
  A backtick-quoted string may span several lines and you are not required to escape regular quote characters,
  only backticks. Backslashes still need to be escaped, and all other backslash-escape sequences work like in
  regular JSON.
- for single-line strings, single quotes (`''`) are supported in addition to double quotes (`""`)
- you can use JavaScript comments, both single line (`//`) and multi-line comments (`/* */`), in all places where JSON allows whitespace.
- Commas after the last list element or object property will be ignored.


Example:

``` js
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
```

Use `HANSON.convert` to convert HanSON text to ye old' JSON text:

``` json
{
  "listName": "Sesame Street Monsters",       
  "content": [
    { "name": "Cookie Monster",
       "background": "Cookie Monster used to be a\n ... to eat \"healthy\" food."
    },
    { "name": "Herry Monster",
      "background": "Herry Monster is a furry blue monster with a purple nose.\n ... today."
    }
  ]
}
```

Use 'HANSON.parse' instead of 'JSON.parse' to parse text to ruby:

``` ruby
{
  "listName" => "Sesame Street Monsters",
  "content" => [
     { "name" => "Cookie Monster",
       "background" => "Cookie Monster used to be a\n ... to eat \"healthy\" food."
     },
     { "name" => "Herry Monster",
       "background" => "Herry Monster is a furry blue monster with a purple nose.\n ... today."
    }
  ]
}
```


**Live Example**


``` ruby
require 'jasony'

text =<<TXT
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

pp HANSON.parse( text )  # note: is the same as JSON.parse( HANSON.convert( text ))
```

resulting in:

``` ruby
{
  "listName" => "Sesame Street Monsters",
  "content" => [
     { "name" => "Cookie Monster",
       "background" => "Cookie Monster used to be a\n ... to eat \"healthy\" food."
     },
     { "name" => "Herry Monster",
       "background" => "Herry Monster is a furry blue monster with a purple nose.\n ... today."
    }
  ]
}
```


## More JSON Formats

See the [Awesome JSON (What's Next?)](https://github.com/datatxt/awesome-json-next) collection / page.



## License

![](https://publicdomainworks.github.io/buttons/zero88x31.png)

The `jasony` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.

## Questions? Comments?

Post them to the [wwwmake forum](http://groups.google.com/group/wwwmake). Thanks!
