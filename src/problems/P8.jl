include("lib/Math.jl")

using .Math

ans() = begin
    file = open("data/p8.txt")
    number = [parse(Int, c) for c in reduce(*, readlines(file)) |> collect]
    return maximum([reduce(*, number[i-13:i-1], init=1) for i in 14:length(number)])
end

