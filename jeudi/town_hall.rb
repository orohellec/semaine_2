require 'open-uri'
require 'nokogiri'

def get_the_email_of_a_townhal_from_its_webpage(tab_urls_townhalls)
  doc = Nokogiri::HTML(open(tab_urls_townhalls))

#  doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
  email = doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").to_s
  name = doc.xpath("/html/body/div/main/section[1]/div/div/div/h1").to_s
#  print name[4..name.size - 14]
#  print " - "
#  puts email[4..(email.size - 6)]

  email = email[4..(email.size - 6)].split
  #puts email.class
  name = name[4..name.size - 14].split
  #puts name
  #puts email
  my_hash = Hash[name.zip(email)]
  #puts my_hash

  return my_hash
end

def get_all_the_urls_of_val_doise_townhalls
  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  str = ""
  tab = Array.new
  tab = doc.xpath("//td/p/a/@href")
  other_tab = []
  urls_tab = []
  url_begin = "http://annuaire-des-mairies.com"
  i = 0
  while i < tab.size
    other_tab[i] = tab[i].to_s
    other_tab[i] = other_tab[i][1..other_tab[i].size]  #(other_tab.size - 1)]
    urls_tab[i] = url_begin + other_tab[i]
  #  name_city_tab[i] = urls_tab[i][..
    i += 1
  end
  #puts "urls_tab size = " + urls_tab.size.to_s
  #email_tab = []
  i = 0
  my_hash = Hash.new
  while i < urls_tab.size
    my_hash = get_the_email_of_a_townhal_from_its_webpage(urls_tab[i])
    i += 1
  end
   #puts email_tab
   puts my_hash
end

get_all_the_urls_of_val_doise_townhalls
