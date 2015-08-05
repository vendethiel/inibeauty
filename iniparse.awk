#!/usr/bin/env awk -f
/^;/ || /^$/ { next }

/^\[/ {
  cur_category = substr($0, 2, length-2)
  hide_car = 0
  next
}

/= ?$/ { next }

{
  if (!hide_car++) {
    printf("[%s]\n", toupper(cur_category))
  }
  gsub(tolower(cur_category) ".", "")
  gsub(/ = /, "=")
  print tolower($0)
}
