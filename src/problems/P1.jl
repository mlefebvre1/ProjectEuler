include("lib/Math.jl")

using .Math

ans() = sum([x for x in 1:999 if isdivisibleby(x, 3) || isdivisibleby(x, 5)])

println(ans())