#!/usr/bin/env perl -na
next if /^;/ || /^$/;

if (/^\[/) {
  $cur_category = substr($F[0], 1, -1);
  $print_car = 1;
  next
}

next if /= ?$/;

if ($print_car) {
  printf("[%s]\n", uc($cur_category));
  $print_car = 0
}
s/^$cur_category\.//i;
s/ = ?/=/;
print lc
