require 'nokogiri'
require 'httparty'
require 'watir'

Selenium::WebDriver::Chrome.driver_path = '/usr/lib/chromium-browser/chromedriver'


puts 'what is the URL of the tutorial?'
url = gets.strip

def get_all_links(page)
  parsed_page = Nokogiri::HTML(page)
  links = parsed_page.css('a')

  hrefs = links.map {|link| link.attribute('href').to_s}.uniq.sort

  return hrefs
end

def find_all_pages(url)

  browser = Watir::Browser.new :chrome, headless: true
  # starts at the first page of the tutorial
  browser.goto(url)
  # saves the url of the first page
  current_url = browser.url

  # grab the page content here for later, then go to the next
  # page if it exists

  page_content = browser.html

  js_link = browser.link(:class, "rightArrow")
  js_link.click if js_link

  browser.wait_until { browser.url != current_url }

  page_content += browser.html

  open('content.txt', 'w') { |f|
    f.puts page_content
  }

end

find_all_pages(url)
