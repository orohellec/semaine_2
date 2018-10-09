
  jour_1 = { :GOO => 15, :MMM => 14, :ADBE => 12, :EA=> 13, :BA => 8, :KO => 10, :XOM => 20, :GPS => 7, :MCD => 11, :DIS => 15, :CRM => 6, :JNJ => 10 },
  jour_2 = { :GOO => 8, :MMM => 20, :ADBE => 3, :EA=> 10, :BA => 5, :KO => 19, :XOM => 12, :GPS => 6, :MCD => 15, :DIS => 9, :CRM => 10, :JNJ => 17 },
  jour_3 = { :GOO => 3, :MMM => 8, :ADBE => 15, :EA=> 5, :BA => 10, :KO => 5, :XOM => 15, :GPS => 13, :MCD => 10, :DIS => 18, :CRM => 5, :JNJ => 14 },
  jour_4 = { :GOO => 17, :MMM => 3, :ADBE => 6, :EA=> 9, :BA => 15, :KO => 6, :XOM => 8, :GPS => 1, :MCD => 10, :DIS => 15, :CRM => 18, :JNJ => 3 },
  jour_5 = { :GOO => 8, :MMM => 18, :ADBE => 4, :EA=> 6, :BA => 15, :KO => 18, :XOM => 3, :GPS => 12, :MCD => 19, :DIS => 3, :CRM => 7, :JNJ => 9 },
  jour_6 = { :GOO => 10, :MMM => 12, :ADBE => 8, :EA=> 3, :BA => 18, :KO => 20, :XOM => 5, :GPS => 11, :MCD => 3, :DIS => 9, :CRM => 8, :JNJ => 15 },
  jour_7 = { :GOO => 17, :MMM => 14, :ADBE => 2, :EA=> 17, :BA => 7, :KO => 13, :XOM => 1, :GPS => 15, :MCD => 15, :DIS => 10, :CRM => 9, :JNJ => 17 }

tab_hash = [jour_1, jour_2, jour_3, jour_4, jour_5, jour_6, jour_7]

def sunday_trader(tab)
  i = 0
  dif = 0
  index_buy = 0
  index_sell = 0
  while i < tab.size
    n = 1
    j = 0
    while i + n < tab.size
        if ((tab[j] * -1) + tab[i + n] > dif)
          dif = (tab[j] * -1) + tab[i + n]
          index_buy = j
          index_sell = i + n
        end
        n += 1
        j += 1
    end
    i += 1
  end
  puts "=> [#{index_buy},#{index_sell}]"
end

def recolt_data(tab_hash)
  price = Array.new
  puts tab_hash
  tab_hash.each do |company|
    price.push(company[:GOO].to_i)
  end
#  puts price
end

def format(hash)
  output = Hash.new
  hash.each do |key, value|
    output[key] = cleanup(value)
  end
  output
end
=begin
def monday_trader(hash)
#  puts hash.values
  jour_1 = Hash.new
  jour_1 = hash.values_at(:jour_1)
  puts jour_1
  puts jour_1.values_at(:G00)
end
tab = [17,3,6,9,15,8,6,1,10]

sunday_trader(tab)
monday_trader(my_hash)
=end
format(tab_hash)
recolt_data(tab_hash)
