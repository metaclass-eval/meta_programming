#!/usr/bin/env ruby
# encoding: utf-8
# Version = '20210118-054047'


# normal repeat
def fact(n)
  s = 1
  (1..n).to_a.each do |i|
    s *= i
  end
  s
end
p fact(5)

# recursive repeat
def fact(n)
  if n > 0
    n*fact(n-1)
  else
    1
  end
end
p fact(5) 

# meta-programming
define_method :fact do |n|
  s = (1..n).to_a.join("*")
  eval(s)
end
p fact(5)

def fact(n)
  s = (1..n).to_a.join("*")
  eval(s)
end
p fact(5)

# first classify
fact =->(n) do
  s = 1
  (1..n).to_a.each do |i|
    s *= i
  end
  s
end

def run_method(method, n)
  method.(n)
end
p run_method(fact, 5)

# first classify by meta-programming
def fact(n)
  s = (1..n).to_a.join("*")
end

def eval_method(s)
  eval(s)
end
p eval_method(fact(5))


# operator argument
def fact(arr, operator)
  s = arr.to_a.join(operator)
  eval(s)
  #arr.inject(0){|a, b| eval("#{a} #{operator} #{b}")}
end

p fact(1..5, "+")
p fact(1..5, "*")

