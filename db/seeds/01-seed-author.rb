require 'net/http'
puts "Seed Author"
url = "https://raw.githubusercontent.com/nschaetti/SFGram-dataset/master/authors.json"
puts "get json"
resp = Net::HTTP.get_response(URI.parse(url))
data = resp.body
result = JSON.parse(data)
puts "Seed Author To Table authors"
authors = result["authors"]
authors.each.with_index do |val, i|
	puts "Process Author - #{i+1}"
	author = Author.find_or_initialize_by(name: val["name"])
	author.bio = val["bio"]
	author.gender = val["gender"].present? ? val["gender"] : "m"
	author.total_book = val["n_book"]
	author.summary = val["summary"]
	author.born = val["born"]
	author.died = val["died"]
	social = author.social_sources.new(type_source: "wikipedia", url: val["wikipedia"]["url"], found: val["wikipedia"]["found"]) if val["wikipedia"].present? && author.new_record?
	author.save
	puts "Process Author - #{i+1} done"
end