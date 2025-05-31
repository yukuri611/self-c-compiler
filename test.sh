#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  ./self_cc "$input" > tmp.s
  gcc -static -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 21 "5+20-4"
assert 41 " 12 + 34 - 5 "


echo OK
