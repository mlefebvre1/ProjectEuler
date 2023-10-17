function prepare_grid()
    f = open("data/p18.txt")
    grid = []
    for line in readlines(f)
        gridl = []
        for col in split(line, ' ')
            push!(gridl, parse(Int, col))
        end
        push!(grid, gridl)
    end
    grid
end

ans() = begin
    grid = prepare_grid()
    for y in 2:lastindex(grid)
        for x in 1:lastindex(grid[y])
            if x == firstindex(grid)
                grid[y][x] += grid[y-1][x]
            elseif x == lastindex(grid[y])
                grid[y][x] += grid[y-1][x-1]
            else
                grid[y][x] += max(grid[y-1][x-1], grid[y-1][x])
            end
        end
    end
    maximum(last(grid))
end

println(ans())