require 'nokogiri'
require 'httparty'

class Scrapper

def initialize
@doc = getHtml("https://www.allrecipes.com/recipes/156/bread/?internalSource=top%20hubs&referringContentType=Homepage")
end

def execute
 categories = getcategories(@doc)   
 puts categories
end


def getcategories(htmlcode)
  categoryNames = htmlcode.scan(/(?<=span class="category-title" data-ellipsis>)(.*)(?=<\/span>)/).flatten
  categoryLinks = htmlcode.scan(/(?<=<a data-internal-referrer-link="hub nav" data-link-name="hub nav daughter" data-click-id="hub nav 2" href=")(.*)(?=" target="_self" class="grid-col--subnav">)/).flatten
  
end


def getHtml(url)
    HTTParty.get(url)
end

end
srap = Scrapper.new
srap.execute