function nonzero_return() {
  RETVAL=$?
  [ $RETVAL -ne 0 ] && echo " [$RETVAL] "
}

export PATH="$HOME/.toys/bin:$PATH"

export PS1="\n☺ \[\e[31m\]\H -> \[\e[33m\]\u\[\e[m\]\[\e[31m\] \[\e[m\]\[\e[31m\]\`nonzero_return\`\[\e[m\] \w \[\e[34m\]>\[\e[m\]\[\e[32m\]>\[\e[m\]\[\e[33m\]>\[\e[m\] "

