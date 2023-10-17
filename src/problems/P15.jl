ans() = begin
    grid = fill(0, (20, 20))
    for col in 1:20
        grid[1, col] = col + 1
    end
    for row in 1:20
        grid[row, 1] = row + 1
    end
    for row in 2:20
        for col in 2:20
            grid[row, col] = grid[row-1, col] + grid[row, col-1]
        end
    end
    grid[20, 20]
end

println(ans())