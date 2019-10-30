function recursive_activity_selector(i, s, f, k, n)
    m = k + 1
    while m <= n && s[m] < f[k]
        m += 1
    end
    if m <= n
        return [i[m] s[m] f[m]; recursive_activity_selector(i, s, f, m, n)]
    else
        return [0 0 0]
    end
end

s = [12, 12, 6, 15, 16, 1, 4, 6, 0]
f = [14, 17, 10, 18, 17, 5, 7, 9, 0]
i = 1:length(s)

times = [i s f]
times = times[sortperm(times[:, 3]), :]
@show times

A = recursive_activity_selector(times[:, 1], times[:, 2], times[:, 3], 1, length(s))
@show A