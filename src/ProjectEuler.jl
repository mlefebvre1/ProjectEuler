module ProjectEuler
include("problems/P16.jl")

using BenchmarkTools

println(@btime ans())
end # module ProjectEuler
