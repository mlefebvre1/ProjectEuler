module ProjectEuler
include("problems/P20.jl")

using BenchmarkTools

println(@btime ans())
end # module ProjectEuler
