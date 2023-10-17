include("lib/Math.jl")

using .Math

ans() = sieves(Int(1e6))[10001]

println(ans())