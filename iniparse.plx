#!/usr/bin/env perl -na
next if /^;/ || /^$/;

if (/^\[/) {
  $cur_category = substr($F[0], 1, -1);
  $hide_car = 0;
  next
}

next if /= ?$/;

if (!$hide_car++) {
  printf("[%s]\n", uc($cur_category));
}
s/^$cur_category\.//i;
s/ = ?/=/;
print lc
