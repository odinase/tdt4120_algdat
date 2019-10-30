function greedy_activity_selector(i, s, f)
    n = length(s)
    A = [i[1] s[1] f[1]]
    k = 1
    for m = 2:n
        if s[m] >= f[k]
            A = [A; i[m] s[m] f[m]]
            k = m
        end
    end
    return A
end

s = [12, 12, 6, 15, 16, 1, 4, 6]
f = [14, 17, 10, 18, 17, 5, 7, 9]
i = 1:length(s)

times = [i s f]
times = times[sortperm(times[:, 3]), :]
@show times

A = greedy_activity_selector(times[:, 1], times[:, 2], times[:, 3])
@show A