include("./q1.jl")
include("./q2.jl")

function mincoins(coins, value)
    println(string("length(coins): ", length(coins)))
    println(string("value: ", value))
    if usegreed(coins)
        return mincoinsgreedy(coins, value)
    end
    
    opt = (Array{Int}(undef, length(coins)) .= typemax(Int))
    
    if length(coins) == 1
        return value
    end

    if length(coins) == 2
        num_coins = floor(value / coins[end - 1])
        return value + (1 - coins[1]) * num_coins
    end
    
    opt[end] = value
    num_coins = floor(value / coins[end - 1])
    opt[end - 1] = value + (1 - coins[end - 1]) * num_coins
    for i = length(coins) - 2:-1:1
        cur_max = floor(value / coins[i])
        greedy = mincoinsgreedy(coins[i:end], value)
        new_opt = typemax(Int)
        for j = cur_max:-1:0
            new_opt = min(new_opt, j + mincoins(coins[i + 1:end], value - j * coins[i]))
        end
        opt[i] = min(greedy, opt[i + 1], new_opt)
    end
    return opt[1]
end

### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
   	# @test mincoins([1000,500,100,20,5,1], 1226) == 6
    # @test mincoins([20,10,5,1], 99) == 10
    # @test mincoins([5,1], 133) == 29
   	@test mincoins([4,3,1], 18) == 5
    @test mincoins([1000,500,100,30,7,1], 14) == 2
    @test mincoins([40, 30, 20, 10, 1], 90) == 3
    @test mincoins([1000, 500, 200, 100, 50, 20, 10, 5, 4, 3, 1], 1027) == 4
    # @test mincoins([9929, 9783, 9522, 8712, 8639, 8619, 8540, 8492, 8399, 7821, 7433, 7247, 7181, 7064, 6974, 6854, 6842, 6582, 6440, 6337, 6305, 6014, 5840, 5739, 5719, 5643, 5516, 5031, 4699, 3957, 3811, 3248, 2149, 2007, 1893, 1305, 971, 736, 643, 543, 1], 11)
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")