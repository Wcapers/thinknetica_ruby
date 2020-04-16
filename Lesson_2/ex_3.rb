def fibonacci(n)
  return  n  if (0..1).include? n
  (fibonacci(n - 1) + fibonacci(n - 2))
end
i = 1;
result = [fibonacci(i-1)]
while fibonacci(i) < 100
  result.push(fibonacci(i))
  i += 1
end
puts result
