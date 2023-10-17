ans() = begin
    return sum(d for d in digits(factorial(big(100))))
end

println(ans())