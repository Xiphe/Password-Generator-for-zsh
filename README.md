Password Generator for zsh
==========================

A simple tool to generate random strings.


Example
-------

Copy a 16 characters long random string containing letters, numbers
and symbols (`GSXutSdunI#1NjI^`) to your clipboard.  
`pw_gen | pbcopy`


Installation
------------

If you have not switched to zsh jet, i can recomend [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

### As an oh-my-zsh plugin:

Install:
```zsh
mkdir -p ~/.oh-my-zsh/custom/plugins/password_generator
git clone git://github.com/Xiphe/Password-Generator-for-zsh.git ~/.oh-my-zsh/custom/plugins/password_generator
```
Activate:
```zsh
vim ~/.zshrc
```
Add the plugin: `plugins=([your other plugins] password_generator)`
Save the file and restart your shell.

### For usage in other scripts

Clone the repository somewhere
```zsh
git clone git://github.com/Xiphe/Password-Generator-for-zsh.git /your/custom/path
```
Include the password_generator.plugin.zsh in your script
```zsh
#!/bin/zsh
. /your/custom/path/password_generator.plugin.zsh

# now use the generator:
pw_gen -l 128 -s aaaaan
```


Options
-------

* -h --help      Show the help.
* -a --add       Add this password to the latest.
* -i --incognito Don't save the password for the --latest option.
* -l --length    The number of characters, the password should contain. (Default: 16)
*    --latest    Show the latest password generated.
* -s --source    What type of characters should be used. (Default: aAns)  
                  a = lowercased letters  
                  A = uppercased letters  
                  n = numbers  
                  s = symbols ($symbols)  
* -S --silent    Make no output.
* -v --version   Show the version number.
* -q --addquiet  Same as --add but show only the new password.


Usage with Text Expander
------------------------

1. Open `Passwords.textexpander` and make sure the path to `password_generator.plugin.zsh`
   matches your installation.  
   Default is `~/.oh-my-zsh/custom/plugins/password_generator/password_generator.plugin.zsh`
   which is the default path for custom [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
   plugins.
2. Import `Passwords.textexpander` by clicking "New Group from File" in your Text expander window.
3. Adjust the shortcuts if you don't like my presets. :_(
4. Type `#pw ` somewhere and feel the magique.

### Default Shortcuts

* `#pw `: A 16 characters long random string containing letters, numbers
and symbols.  
  (`UIns3hIY;ia5Bi0K`)
* `#lpw `: The latest Password AGAIN  
  (`UIns3hIY;ia5Bi0K`)
* `#pwa `: 16 characters, Alpha  
  (`BmGPmUPnaGZLmbsw`)
* `#pwan `: 16 characters, Alphanumeric  
  (`D109toUBL6G277vA`)
* `#pwn `: 16 numbers  
  (`6927410783901882`)
* `#pwl `: 64 characters, Alphanumeric + symbols  
  (`ZzrKPf),Sc:cMeTq?%1lt,#f1AAbbvNKwZz;/qO7b8;xQmFGn,8:Jo.*a5lG.'XB`)
* `#pwla `: 64 characters, Alpha  
  (`JfSmspyFnNjjHKjSJQPdCtRcLVJNQkAypMrZiOVDshBffHXVGGNOWWguqrnaDWub`)
* `#pwlan `: 64 characters, AlphaNumeric  
  (`vJQJfRD22z5wsBObCgRGrNfngg95jfTKHwcOVAjEGmzODLKR4TaEo0OlRPHMUWo3`)
* `#pwln `: 64 numbers  
  (`0646076676380719164741029151451960033091014516155374845683965847`)

### Custom length

If you switch `#` to `+` the current password will be added to the one recently
saved. (Normally it is overwritten.)
So if you need a 32 characters long random string, just type `#pw +pw `.
The result should be like (`'zPki40V2Eiv=D:^wgk^xNBqo@3/klyq`) ...nothing fancy...
BUT: if you type `#lpw` now, it's (`'zPki40V2Eiv=D:^wgk^xNBqo@3/klyq`), too *YAY*!



License
-------
Copyright (c) 2013 Hannes Diercks <info@xiphe.net>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.