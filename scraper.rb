# This is a template for a Ruby scraper on Morph (https://morph.io)
# including some code snippets below that you should find helpful

# require 'scraperwiki'
require 'mechanize'
#
agent = Mechanize.new
#
# # Read in a page
#page = agent.get("http://www.congreso.es/portal/page/portal/Congreso/Congreso/Diputados?_piref73_1333056_73_1333049_1333049.next_page=/wc/menuAbecedarioInicio&tipoBusqueda=completo&idLegislatura=10")

diputados = []

#while true
#  diputados.concat(page.links_with(href: /fichaDiputado/))
#  next_page_link = page.link_with(text: /Siguiente/)
#  break if next_page_link == nil
#  page = next_page_link.click
#end

page = agent.get("http://www.congreso.es/portal/page/portal/Congreso/Congreso/Diputados/BusqForm?_piref73_1333155_73_1333154_1333154.next_page=/wc/fichaDiputado?idDiputado=268&idLegislatura=10")
name = page.search('div.nombre_dip').text
div = page.search('div#curriculum')
email = div.search('a[href*=mailto]').text.strip

puts "'#{name}',#{email}"





#
# # Find somehing on the page using css selectors
# p page.at('div.content')
#
# # Write out to the sqlite database using scraperwiki library
# ScraperWiki.save_sqlite(["name"], {"name" => "susan", "occupation" => "software developer"})
#
# # An arbitrary query against the database
# ScraperWiki.select("* from data where 'name'='peter'")

# You don't have to do things with the Mechanize or ScraperWiki libraries. You can use whatever gems are installed
# on Morph for Ruby (https://github.com/openaustralia/morph-docker-ruby/blob/master/Gemfile) and all that matters
# is that your final data is written to an Sqlite database called data.sqlite in the current working directory which
# has at least a table called data.


