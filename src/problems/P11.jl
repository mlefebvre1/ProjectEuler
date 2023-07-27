ans() = begin
    NB_ADJACENT = 4
    right_prod(matrix, row, col) = prod(matrix[row, col:col+3])
    down_prod(matrix, row, col) = prod(matrix[row:row+3, col])
    right_down_prod(matrix, row, col) = reduce(*, [matrix[row+i, col+i] for i in 0:3])
    right_up_prod(matrix, row, col) = reduce(*, [matrix[row-i, col+i] for i in 0:3])
    left_down_prod(matrix, row, col) = reduce(*, [matrix[row+i, col-i] for i in 0:3])
    left_up_prod(matrix, row, col) = reduce(*, [matrix[row-i, col-i] for i in 0:3])

    right_valid(col) = col <= 20 - NB_ADJACENT
    down_valid(row) = row <= (20 - NB_ADJACENT)
    right_down_valid(row, col) = col <= (20 - NB_ADJACENT) && row <= (20 - NB_ADJACENT)
    right_up_valid(row, col) = col <= (20 - NB_ADJACENT) && row >= NB_ADJACENT
    left_down_valid(row, col) = col >= NB_ADJACENT && row <= (20 - NB_ADJACENT)
    left_up_valid(row, col) = col >= NB_ADJACENT && row >= NB_ADJACENT


    f = open("data/p11.txt")
    matrix = reshape([parse(Int, col) for line in readlines(f) for col in split(line, ' ')], (20, 20))
    products = []
    for row in 1:20
        for col in 1:20
            if right_valid(col)
                push!(products, right_prod(matrix, row, col))
            end
            if down_valid(row)
                push!(products, down_prod(matrix, row, col))
            end
            if right_down_valid(row, col)
                push!(products, right_down_prod(matrix, row, col))
            end
            if right_up_valid(row, col)
                push!(products, right_up_prod(matrix, row, col))
            end
            if left_down_valid(row, col)
                push!(products, left_down_prod(matrix, row, col))
            end
            if left_up_valid(row, col)
                push!(products, left_up_prod(matrix, row, col))
            end
        end
    end
    return maximum(products)
end
