require 'open-uri'
require 'nokogiri'

def get_email_of_depute(url)
  doc = Nokogiri::HTML(open(url))
  email = doc.xpath("//ul[2]/li[1]/ul/li[1]/a")
  email = email.text
  return email
end

def get_all_urls_of_deputes
  doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
  urls = doc.xpath("//tr/td/a/@href")
  full_urls = Array.new
  url_begin = "https://www.nosdeputes.fr"
  i = 0
  while i < urls.size
    full_urls[i] = url_begin + urls[i]
    i += 1
  end
  full_name = doc.xpath("//tr/td/a/div/span[@class = 'list_nom']").text.tr(' ', '')
  full_name = full_name[1..(full_name.size - 1)]
  full_name_tab = full_name.split
  first_name = Array.new
  last_name = Array.new
  i = 0
  while i < full_name_tab.size    #isolate first_name and last_name in two different arrays
    tmp_tab = full_name_tab[i].split(',')
    first_name[i] = tmp_tab[1]
    last_name[i] = tmp_tab[0]
    i += 1
  end
  emails = []
  i = 0
  while i < full_urls.size      #get_the_emails
    emails[i] = get_email_of_depute(full_urls[i])
    i += 1
  end
  my_hash = Hash.new
  i = 0
  while i < first_name.size
    my_hash.store(:first_name, first_name)
    my_hash.store(:last_name, last_name)
    my_hash.store(:email, emails)
    i += 1
  end
  puts my_hash
end

get_all_urls_of_deputes
