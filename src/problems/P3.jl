include("lib/Math.jl")

using .Math

ans() = maximum([x for x in 1:Int(ceil(√600851475143)) if isdivisibleby(600851475143, x) && isprime(x)])

println(ans())