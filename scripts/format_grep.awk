BEGIN {
  FS=":"
  file=""
  ln=0
  filestarted=0
  red="\033[0;31m"
  gray="\033[0;90m"
  darkgraybg="\033[0;100m"
  nc="\033[0m"
}

!/(--|Binary|binarny)/ { 
  if($1 != file && $1 != "")
  { file=$1
    print "\n" red $1 ":" nc
    ln=$2
    filestarted=0
  }
  if($2 > ln + 1 && filestarted != 0)
  {
    print gray " ¦ " nc
  }
  out=substr($0, length($1 ":" $2 ": "))
  if($2 >= ln && $2 != "")
  {
    linum=sprintf("%-6s", $2)
    print darkgraybg " " linum " " nc " " out
    filestarted=1
    ln=$2
  }
}
