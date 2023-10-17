include("lib/Math.jl")

using .Math

ans() = maximum([x * y for x in 100:999 for y in 100:999 if ispalindrome(x * y)])

println(ans())