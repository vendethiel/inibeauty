#!/usr/bin/env perl -na
next if /^;/ || /^$/;

if (/^\[/) {
  $cur_category = substr($F[0], 1, -1);
  $hide_car = 0;
  next
}

next if /= ?$/;

printf("[%s]\n", uc($cur_category)) unless $hide_car++;
s/^$cur_category\.//i;
s/ = ?/=/;
print lc
