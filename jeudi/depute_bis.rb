require 'open-uri'
require 'nokogiri'

def get_email_of_depute(url)
  doc = Nokogiri::HTML(open(url))
  email = doc.xpath("//ul[2]/li[1]/ul/li[1]/a")
  email = email.text
  puts email
  return email
end

def get_all_urls_of_deputes
  doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
  urls = doc.xpath("//tr/td/a/@href")
  full_urls = []
  url_begin = "https://www.nosdeputes.fr"
  i = 0
  while i < urls.size
    full_urls[i] = url_begin + urls[i]
    i += 1
  end
  #puts full_urls
  #puts full_urls.size
  full_name = doc.xpath("//tr/td/a/div/span[@class = 'list_nom']").text.tr(' ', '')
  full_name = full_name[1..(full_name.size - 1)]
#  puts full_name
  full_name_tab = full_name.split
  #puts full_name_tab
  puts full_name_tab.class
  puts full_name_tab.size

  first_name = Array.new
  last_name = Array.new

  i = 0
  while i < full_name_tab.size    #isolate first_name and last_name in two different arrays
  #  tmp_tab = Array.new
    tmp_tab = full_name_tab[i].split(',')
    first_name[i] = tmp_tab[1]
    last_name[i] = tmp_tab[0]
    i += 1
  end
#  print first_name
#  puts ""
#  print last_name
  #print " "
  #puts last_name
  #corps_page > div > div > div:nth-child(2) > table > tbody > tr > td:nth-child(1) > a:nth-child(1) > div > span.list_nom
=begin
  while i < urls.size
    full_name[i] = urls[i].text
    i += 1
  end
  emails = []
  puts full_name
=end
  emails = []
  i = 0
  while i < full_urls.size
    emails[i] = get_email_of_depute(full_urls[i])
    i += 1
  end
  puts emails.size
end

#get_email_of_depute
get_all_urls_of_deputes
