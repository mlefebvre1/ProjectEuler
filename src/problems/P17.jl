numbers_0_to_10 = [
    "zero",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
]
numbers_10_to_20 = [
    "ten",
    "eleven",
    "twelve",
    "thirteen",
    "fourteen",
    "fifteen",
    "sixteen",
    "seventeen",
    "eighteen",
    "nineteen",
]
numbers_base_20_to_100 = [
    "unused",
    "unused",
    "twenty",
    "thirty",
    "forty",
    "fifty",
    "sixty",
    "seventy",
    "eighty",
    "ninety",
]

function digit(n, i)
    return (digits(n)|>reverse)[i]
end

function first_digit(n)
    return digit(n, 1)
end

function second_digit(n)
    return digit(n, 2)
end

function count_base10(n)
    nb_letters = 0
    if n < 10
        nb_letters += length(numbers_0_to_10[n+1])
    elseif 10 <= n < 20
        nb_letters += length(numbers_10_to_20[(n+1)-10])
    elseif 20 <= n < 100
        if second_digit(n) == 0  # 20, 30, 40 .. etc.
            nb_letters += length(numbers_base_20_to_100[first_digit(n)])
        else  # 21, 22.. 31, 32 .. 91.. 99
            nb_letters += length(numbers_base_20_to_100[first_digit(n)+1]) + length(numbers_0_to_10[second_digit(n)+1])
        end
    end
    return nb_letters
end

function count_letters(n)
    nb_letters = 0
    if n < 100   # 10 .. 99
        nb_letters += count_base10(n)
    elseif n < 1000
        base100 = first_digit(n)
        base10 = parse(Int, join((digits(n)|>reverse)[2:3]))
        if base10 == 0  # 100, 200, 300 .. etc.
            nb_letters += length(numbers_0_to_10[base100+1]) + length("hundred")
        else  # 101, 102 .. etc.
            nb_letters += length(numbers_0_to_10[base100+1]) + length("hundred") + length("and")
            nb_letters += count_base10(base10)
        end
    else # 1000
        nb_letters += length("one") + length("thousand")
    end
    return nb_letters
end

ans() = begin
    sum([count_letters(n) for n in 1:1000])
end

println(ans())