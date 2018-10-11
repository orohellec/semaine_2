require 'open-uri'
require 'nokogiri'

def get_the_email_of_a_townhal_from_its_webpage(tab_urls_townhalls)
  doc = Nokogiri::HTML(open(tab_urls_townhalls))

  email = doc.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").to_s
  return email = email[4..(email.size - 6)]
end

def get_all_the_urls_of_val_doise_townhalls
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    name = doc.xpath("//td/p/a")
    town_name = []
    i = 0
    while i < name.size             #keep only the town_name
      town_name[i] = name[i].text
      i += 1
    end
    tab = doc.xpath("//td/p/a/@href")
    other_tab = []
    urls_tab = []
    url_begin = "http://annuaire-des-mairies.com"
    i = 0
    while i < tab.size              #keep the full urls
      other_tab[i] = tab[i].to_s
      other_tab[i] = other_tab[i][1..other_tab[i].size - 1]
      urls_tab[i] = url_begin + other_tab[i]
      i += 1
    end
    i = 0
    email_tab = []
    while i < urls_tab.size         #get these fucking emails
      email_tab[i] = get_the_email_of_a_townhal_from_its_webpage(urls_tab[i])
      i += 1
    end
    my_hash = Hash[town_name.zip(email_tab)]
    puts my_hash
end

  get_all_the_urls_of_val_doise_townhalls
