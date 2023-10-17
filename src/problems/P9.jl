include("lib/Math.jl")

using .Math

ans() = begin
    triples = pythagorean_triples(2000)
    index = findfirst(triple -> sum(triple) == 1000, triples)
    prod(triples[index], init=1)
end

println(ans())