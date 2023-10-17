include("lib/Math.jl")

using .Math

ans() = Int(prod([prime^floor(log(prime, 20)) for prime in sieves(20)]))

println(ans())