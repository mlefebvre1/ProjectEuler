include("lib/Math.jl")

using .Math

ans() = begin
    n = findfirst(n -> length(factorize(triangular(n))) >= 500, 1:typemax(Int))
    return Int(triangular(n))
end