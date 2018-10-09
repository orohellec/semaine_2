def multiple_3_5(nb)
  tab = []
  i = 1
  j = 0
  while (i <= nb)
    if (i % 3 == 0 || i % 5 == 0)
      tab[j] = i
      j += 1
    end
    i += 1
  end
  puts tab.sum
end


multiple_3_5(999)
