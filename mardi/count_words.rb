=begin
dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]
> jean_michel_data("below", dictionary)
=> {"below"=>1, "low"=>1}
> jean_michel_data("Howdy partner, sit down! How's it going?", dictionary)
=> {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}
=end

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]





def jean_michel_data(str, tab_dico)
  tab_str = str.split
  tab_count = Array.new
  hash_result = Hash.new
  count = 0
  i = 0
  result = []
  while i < tab_dico.size
  result[i] = str.grep(/howdy/).size
    #  count += 1
    i += 1
  end
  puts count
end


str = "Howdy partner Howdy, sit down! How's it going?"
tab = str.count("it")
puts tab
#jean_michel_data("Howdy partner Howdy, sit down! How's it going?", dictionary)
