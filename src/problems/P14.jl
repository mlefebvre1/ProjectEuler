ans() = begin
    function chain(n)
        chain_len = 0
        while n != 1
            if isodd(n)
                n = div((3 * n + 1), 2)
                chain_len += 2
            else
                n = div(n, 2)
                chain_len += 1
            end
        end
        chain_len
    end

    r = Int(1e6 / 2):Int(1e6)
    chains = zip(map(chain, r), r)
    (_, max_n) = maximum(chains)
    max_n
end

println(ans())