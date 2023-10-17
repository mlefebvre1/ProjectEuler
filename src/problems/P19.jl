include("lib/Math.jl")

using .Math

function isleap(year)
    if isdivisibleby(year, 4)
        if isdivisibleby(year, 100)
            if isdivisibleby(year, 400)
                return true
            else
                return false
            end
        else
            return true
        end
    end
    false
end

function month_nb_days(month_index, year)
    """
    jan(31), feb(28), mar(31), apr(30), may(31), june(30), july(31), aug(31), sept(30), oct(31),
    nov(30), dec(31)
    """
    month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if isleap(year) && month_index == 2  # leap years only affect february
        return month[month_index] + 1
    else
        return month[month_index]
    end
end

ans() = begin
    day = 0
    nb_sundays = 0
    for year in 1901:1999  # for each year of the twentieth century
        for month in 1:12  # for each month in the year
            nb_days = month_nb_days(month, year)  # this gives the number of days in for the current month
            while day < nb_days
                day += 7
            end
            day -= nb_days  # this gives the first day of the next month
            if day == 6
                nb_sundays += 1
            end
        end
    end
    nb_sundays
end

println(ans())