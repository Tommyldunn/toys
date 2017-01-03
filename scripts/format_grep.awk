BEGIN {
  FS=":"
  file=""
  ln=0
  filestarted=0
  red="\033[0;31m"
  yellow="\033[0;33m"
  gray="\033[0;90m"
  darkgraybg="\033[0;100m"
  darkgraybg2="\033[95;100m"
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
    linum=sprintf("%-7s", "⁞")
    print darkgraybg2 " " linum nc
  }
  out=substr($0, length($1 ":" $2 ": "))
  gsub(/#FOUND#/, yellow, out)
  gsub(/#!FOUND#/, nc, out)
  if($2 >= ln && $2 != "")
  {
    linum=sprintf("%-4s", $2)
    print darkgraybg " " linum " " nc " " out
    filestarted=1
    ln=$2
  }
}
