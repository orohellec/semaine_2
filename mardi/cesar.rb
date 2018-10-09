def cesar_number (str, nb)
  i = 0
  tab = []
  while (i < str.size)
    if ((str[i].ord >= 65) && (str[i].ord <= 90))
      if (str[i].ord + nb > 90)
        tab[i] = 65 + str[i].ord + nb - 91
      else
        tab[i] = str[i].ord + nb
      end
    elsif ((str[i].ord >= 97) && (str[i].ord <= 122))
      if (str[i].ord + nb > 122)
        tab[i] = 97 + str[i].ord + nb - 121
      else
        tab[i] = str[i].ord + nb
      end
    else
      tab[i] = str[i].ord
    end
    i += 1
  end
  i = 0
  str = ""
  while (i < tab.size)
    str += tab[i].chr
    i += 1
  end
  puts str
end

cesar_number("What a string!", 5)
