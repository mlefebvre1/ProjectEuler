module Math
export isdivisibleby, Fibonnaci, isprime

isdivisibleby(n, d) = n % d == 0

struct Fibonnaci end
function Base.iterate(::Fibonnaci)
    return 1, (1, 2)
end
function Base.iterate(::Fibonnaci, state)
    a, b = state
    return a, (b, a + b)
end
Base.eltype(::Fibonnaci) = Int


function isprime(n)
    if n <= 1
        return false
    elseif n <= 3
        return true
    elseif isdivisibleby(n, 2) || isdivisibleby(n, 3)
        return false
    end

    i = 5
    while i * i <= n
        if isdivisibleby(n, i) || isdivisibleby(n, i + 2)
            return false
        end
        i += 6
    end
    return true
end
end

function sieves(k)
    sieved = [false for _ in 1:k]
    if k <= 2
        return [2]
    end

    if k <= 3
        return [2, 3]
    end

    for n in 2:Int(ceil(sqrt(k)))
        if !sieved[n]
            for x = n+n:n:k
                sieved[x] = true
            end
        end
    end

    primes = []
    for n = 2:k
        if !sieved[n]
            push!(primes, n)
        end
    end
    return primes
end

ispalindrome(x) = (xs = string(x); xs == reverse(xs))

function primitive_pythagorean_triples(max_h)
    last_i = Int(ceil(√max_h))
    triples = []
    for n in 1:last_i
        for m in n+1:last_i
            if isodd(m + n) && gcd(n, m) == 1
                a = m^2 - n^2
                b = 2 * m * n
                c = m^2 + n^2
                if b < a
                    (a, b) = (b, a)
                end
                push!(triples, (a, b, c))
            end
        end
    end
    triples
end

function pythagorean_triples(max_h)
    triples = []
    primitive_triples = primitive_pythagorean_triples(max_h)
    sort!(primitive_triples)
    for primitive_triple in primitive_triples
        (a, b, c) = primitive_triple
        m = 1
        while true
            triple = (a * m, b * m, c * m)
            triple[3] <= max_h || break
            push!(triples, triple)
            m += 1
        end
    end
    triples
end

function factorize(n)
    factors = [1]
    if n < 2
        return factors
    end
    sqrt_n = √n
    csqrt, fsqrt = Int(ceil(sqrt_n)), Int(floor(sqrt_n))
    for divider in 2:(csqrt-1)
        if isdivisibleby(n, divider)
            push!(factors, divider)
            push!(factors, div(n, divider))
        end
    end
    if n == fsqrt^2
        push!(factors, fsqrt)
    end
    push!(factors, n)
    sort!(factors)
    factors
end

triangular(n) = n * (n + 1) / 2

