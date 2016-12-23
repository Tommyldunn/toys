BEGIN {
  FS=":"
  file=""
  ln=0
  red="\033[0;31m"
  yellow="\033[0;33m"
  gray="\033[0;90m"
  nc="\033[0m"
}

/[0-9]+:/ { 
  if($1 != file)
  { file=$1
    print "\n" red $1 ":" nc
    ln=$2
  }
  if($2 > ln + 1)
  {
    print gray " ¦ " nc
  }
  ln=$2
  out=$0
  gsub($1 ":" $2 ":", "", out)
  # gsub("(" term ")", yellow "\0" nc, out)
  print $2 ":" out
}
