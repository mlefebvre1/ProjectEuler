include("lib/Math.jl")

using .Math

ans() = sum(sieves(Int(2e6)))