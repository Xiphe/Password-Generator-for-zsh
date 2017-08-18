#!zsh
#
# Password Generator for zsh
#
# Copyright (c) 2013 Hannes Diercks <info@xiphe.net>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

function password_generator() {
  local -a i length latest charsource help add vers silent incognito addquiet source_length save_password new_password password latest_pw alpha Alpha numbers symbols save_symbols

  version="0.2"

  ## Source Seeds.
  alpha="abcdefghijklmnopqrstuvwxyz"
  Alpha="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  numbers="0123456789"
  save_symbols=",;.:-_#+*!$%&/^()=?@[]|{}~"
  symbols="\"'$save_symbols"

  ## Parse options.
  zparseopts a=add       -add=add \
             h=help      -help=help \
             i=incognito -incognito=incognito \
             l:=length   -length:=length \
                         -latest=latest \
             s:=source   -source:=source \
             S=silent    -silent=silent \
             v=vers      -version=vers \
             q=addquiet  -addquiet=addquiet

  ## Get the latest password.
  if [[ -n $latest ]] || [[ -n $add ]] || [[ -n $addquiet ]]; then 
    latest_pw=$(cat ~/.pw_gen_lpw)
  fi

  ## Display latest.
  [[ -z $silent ]] && [[ -n $latest ]] && [[ -n $latest_pw ]] && { echo $latest_pw; return }
  
  ## Display Version.
  [[ -z $silent ]] && [[ -n $vers ]] && { echo "v$version"; return }

  ## Display help.
  [[ -z $silent ]] && [[ -n $help ]] && { 
    echo "usage: pw_gen [-ahil:s:Svq] [--add] [--help] [--incognito] [--length] [--latest] [--source] [--silent] [--vers] [--addquiet]"
    echo "  -a --add       Add this password to the latest."
    echo "  -h --help      Show this help."
    echo "  -i --incognito Don't save the password for the --latest option."
    echo "  -l --length    The number of characters, the password should contain. (Default: 16)"
    echo "     --latest    Show the latest password generated."
    echo "  -s --source    What type of characters should be used. (Default: aAns)"
    echo "                   a = lowercased letters" 
    echo "                   A = uppercased letters" 
    echo "                   n = numbers"
    echo "                   s = symbols ($symbols)"
    echo "                   S = symbols without quotes ($save_symbols)"
    echo "  -S --silent    Make no output."
    echo "  -v --version   Show the version number."
    echo "  -q --addquiet  Same as --add but show only the new password."
    return
  }

  ## Set defaults.
  source=${source[2]:-aAns}
  length=${length[2]:-16}

  ## Build the source string.
  i=1
  while [[ -n $source[$i] ]]; do
    case $source[$i] in
      a )
        charsource="$charsource$alpha"
        ;;
      A )
        charsource="$charsource$Alpha"
        ;;
      n )
        charsource="$charsource$numbers"
        ;;
      s )
        charsource="$charsource$symbols"
        ;;
      S )
        charsource="$charsource$save_symbols"
        ;;
    esac
    let i++
  done

  ## Get the length of the source string.
  source_length=${#${(S%%)charsource//$~zero/}}

  ## Get random entries of the source string.
  for (( i = 0; i < $length; i++ )); do
    new_password="$new_password$charsource[$[RANDOM % source_length + 1]]"
  done

  ## Save the generated password if not permitted.
  if [[ -z $incognito ]]; then
    if [[ -n $add ]] || [[ -n $addquiet ]]; then
      save_password="$latest_pw$new_password"
    else
      save_password="$new_password"
    fi
    echo -n "$save_password" > ~/.pw_gen_lpw
  fi

  if [[ -z $silent ]]; then
    ## Format the output 
    if [[ -n $add ]]; then
      password="$latest_pw$new_password"
    else
      password="$new_password"
    fi

    echo "$password"
  fi
}

alias pw_gen="password_generator"