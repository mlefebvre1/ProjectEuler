include("lib/Math.jl")

using .Math

ans() = sum(1:100)^2 - sum(map(n -> n^2, 1:100))

println(ans())