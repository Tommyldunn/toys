BEGIN {
  FS=":|-"
  file=""
  ln=0
  lastn=0
  red="\033[0;31m"
  yellow="\033[0;33m"
  gray="\033[0;90m"
  nc="\033[0m"
}

!/(--|Binary|binarny)/ { 
  if($1 != file)
  { file=$1
    print "\n" red $1 ":" nc
    ln=$2
  }
  if($2 > ln + 1)
  {
    print gray " ¦ " nc
  }
  if($2 > ln && $2 != lastn)
  {
    $1=""
    out=$0
    $2 = $2 ":"
    print $0
  }
  ln=$2
  lastn=ln
}
