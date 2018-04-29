require 'nokogiri'
require 'httparty'
#require 'watir'

#Selenium::WebDriver::Chrome.driver_path = '/usr/lib/chromium-browser/chromedriver'

def get_all_links_as_hash(page)
  parsed_page = Nokogiri::HTML(page)
  links = parsed_page.css('a')

  all_links = Hash[links.xpath('//a[@href]').map {|link| [link.text.strip, link['href']]}]

  return all_links
end

def extract_github_from_hash(hashed_links)
  result = {}
  hashed_links.each do |key, value|
    if key.downcase.include?('github') and value.downcase.include?('/github')
      result[key] = value
    end
  end

  return result
end

puts 'what is the URL of the tutorial?'
url = gets.strip

response = HTTParty.get(url)

document_links = get_all_links_as_hash(response.body)

filtered_links = extract_github_from_hash(document_links)

puts filtered_links

#def find_all_pages(url)

#  browser = Watir::Browser.new :chrome, headless: true
  # starts at the first page of the tutorial
#  browser.goto(url)
  # saves the url of the first page
#  current_url = browser.url

  # grab the page content here for later, then go to the next
  # page if it exists

#  page_content = browser.html

#  js_link = browser.link(:class, "rightArrow")
#  js_link.click if js_link

#  browser.wait_until { browser.url != current_url }

#  page_content += browser.html

#  open('content.txt', 'w') { |f|
#    f.puts page_content
#  }

#end

#find_all_pages(url)
