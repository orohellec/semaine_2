require 'open-uri'
require 'nokogiri'

def get_email_of_depute(url)
  doc = Nokogiri::HTML(open(url))
  email = doc.xpath("//article/div[3]/div/dl/dd[4]/ul/li/a/@href").to_s
  email = email[7..(email.size - 1)]
  puts email
  return email
  # //*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li/a
end

def get_all_urls_of_deputes
  doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
  urls = doc.xpath("//div/div/ul/li/a")
#  puts urls
  urls = urls[0..575]
  urls.each do |url|
  #  puts url
  end
  name = []
  i = 0
  while i < urls.size
    name[i] = urls[i].text  #grep all the name of deputes
    i += 1
  end
  #name = urls.text
  i = 0
  tab_first_name = []
  tab_last_name = []
  while i < name.size
    name_split = name[i].split
    puts name[i].class
    tab_first_name[i] = name_split[1]
    tab_last_name[i] = name_split[2..(name_split.size - 1)]
    i += 1
  end
#  puts tab_first_name
#  puts tab_last_name

  urls = doc.xpath("//div/div/ul/li/a/@href")
  urls = urls[0..575]

  url_begin = "http://www2.assemblee-nationale.fr"
  full_urls = []
  i = 0
  while i < urls.size
    full_urls[i] = url_begin + urls[i]
    i += 1
  end
#  puts full_urls

  emails = []
  i = 0
  while i < full_urls.size
    emails[i] = get_email_of_depute(full_urls[i])
    i += 1
  end

  print "first_name size = "
  puts tab_first_name.size
  print "last_name size = "
  puts tab_last_name.size

  print "first_name size = "
  puts urls.size
  print "name size = "
  puts name.size
end

#get_email_of_depute
get_all_urls_of_deputes


  #deputes-list > div:nth-child(3) > ul:nth-child(1) > li:nth-child(1) > a

#//*[@id="deputes-list"]/div[1]/ul[1]/li[1]/a
