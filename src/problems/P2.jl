include("lib/Math.jl")

using .Math
using Base.Iterators

ans() = sum([x for x in takewhile(x -> x < 4000000, Fibonnaci()) if iseven(x)])

println(ans())