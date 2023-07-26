ans() = begin
    f = open("data/P13.txt")
    total = sum([parse(BigInt, line) for line in readlines(f)])
    string(total)[1:10]
end