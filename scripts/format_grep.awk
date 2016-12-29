BEGIN {
  FS=":|-"
  file=""
  ln=0
  lastn=0
  filestarted=0
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
    filestarted=0
  }
  if($2 > ln + 1 && filestarted != 0)
  {
    print gray " ¦ " nc
  }
  out=$0
  pattern1=$1 ":" $2 ":"
  pattern2=$1 "-" $2 "-"
  gsub(/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]/, "", pattern1)
  gsub(/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]/, "", pattern2)
  gsub(pattern1, "", out)
  gsub(pattern2, "", out)
  line=$2
  print $2 ":" out
  filestarted=1
  ln=$2
  lastn=ln
}
