module ProjectEuler
include("problems/P15.jl")

using BenchmarkTools

println(@btime ans())
end # module ProjectEuler
