#!/usr/bin/env awk -f
/^;/ || /^$/ { next }

/^\[/ {
  cur_category = substr($0, 2, length-2)
  print_car = 1
  next
}

{
  if (print_car) {
    printf("[%s]\n", toupper(cur_category))
    print_car = 0
  }
  gsub(tolower(cur_category) ".", "")
  print tolower($0)
}
