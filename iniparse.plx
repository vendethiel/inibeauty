#!/usr/bin/env perl -na
if (/^;/ || /^$/) { next }

if (/^\[/) {
  $cur_category = substr($F[0], 1, -1);
  $print_car = 1;
  next
}

if ($print_car) {
  printf("[%s]\n", uc($cur_category));
  $print_car = 0
}
s/$cur_category.//;
print lc
