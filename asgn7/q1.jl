function usegreed(coins)
    remainder = coins[1:end - 1] .% coins[2:end]
    return !any(remainder .> 0)
end

### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin
   	@test usegreed([20, 10, 5, 1]) == true
    @test usegreed([20, 15, 10, 5, 1]) == false
    @test usegreed([100, 1]) == true
    @test usegreed([5, 4, 3, 2, 1]) == false
    @test usegreed([1]) == true
end


println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")

@time usegreed([20, 10, 5, 1])
@time usegreed([20, 15, 10, 5, 1]) 
@time usegreed([100, 1]) 
@time usegreed([5, 4, 3, 2, 1]) 
@time usegreed([1])