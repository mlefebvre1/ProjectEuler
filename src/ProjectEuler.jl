module ProjectEuler
include("problems/P11.jl")

using BenchmarkTools

println(@btime ans())
end # module ProjectEuler
