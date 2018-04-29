require 'nokogiri'
require 'httparty'

puts 'what is the URL of the tutorial?'
url = gets.strip

response = HTTParty.get(url)

def find_code_in_page(page)
  # this is where we search for 'gem'
  lines = page.lines

  results_array = []

  lines.each do |line|
    if line.include?('gem')
      results_array.push(line)
    end
  end

  return results_array
end

gem_stuff = find_code_in_page(response.body)
puts gem_stuff
