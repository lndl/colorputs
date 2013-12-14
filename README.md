colorputs
=========

Color in p and puts method!

Description
-----------

Colorputs provides a beatiful color (and format) printing for Ruby console-based applications

Instalation
-----------

    gem install colorputs
    
Examples of usage
-----------------

    p 'Hello world!', :red
    
Will print out "Hello world!" colored in red.

    p 'Hello world!', :_bl
    
Will print out a blinking "Hello world!".

In addition, it's possible to combine both color and mode (for now, only one of each)
and if some of them are mispelled, Colorputs will try to parse the another part if this one
is well-spelled. Examples:

    p 'Hello world!', :blue_u
    
Will print out an underlined "Hello world!" colored in blue.

    p 'Hello world!', :wrong_r
    
Will not print out the "Hello world!" message colored, but reversed.
Same behavior in the opposite case (correct color, wrong format mode)

Availables colors
-----------------

<table>
  <tr>
    <th>Symbol</th><th>Color</th>
  </tr>
  <tr>
    <td>:red</td><td>Red</td>
  </tr>
  <tr>
    <td>:blue</td><td>Blue</td>
  </tr>
  <tr>
    <td>:green</td><td>Green</td>
  </tr>
  <tr>
    <td>:yellow</td><td>Yellow</td>
  </tr>
  <tr>
    <td>:cyan</td><td>Cyan</td>
  </tr>
  <tr>
    <td>:magenta</td><td>Magenta</td>
  </tr>
  <tr>
    <td>:white</td><td>White</td>
  </tr>
  <tr>
    <td>:black</td><td>Black</td>
  </tr>
  <tr>
    <td>:rainbow</td><td>Rainbow colors!</td>
  </tr>
</table>

Availables modes
-----------------

<table>
  <tr>
    <th>Symbol</th><th>Mode</th>
  </tr>
  <tr>
    <td>:_b</td><td>Bold</td>
  </tr>
  <tr>
    <td>:_u</td><td>Underlined</td>
  </tr>
  <tr>
    <td>:_bl</td><td>Blinked</td>
  </tr>
  <tr>
    <td>:_r</td><td>Reversed</td>
  </tr>
</table>

## Contributing

1. Fork it.
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin my-new-feature`).
5. Create new Pull Request.
