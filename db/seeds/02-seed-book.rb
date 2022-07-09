require 'net/http'
puts "Seed Book"
url = "https://raw.githubusercontent.com/nschaetti/SFGram-dataset/master/books.json"
puts "get json"
resp = Net::HTTP.get_response(URI.parse(url))
data = resp.body
result = JSON.parse(data)
puts "Seed Book To Table books"
books = result["books"]
books.each.with_index do |val, i|
	puts "Process Book - #{i+1}"
	cover = URI.parse(val["cover"]).open rescue nil
	cover_name = val["cover"].split('/').last rescue ""
	val["author_name"] = val["author_name"].gsub!('ï¿½', 'é') if val["author_name"].include?('ï¿½')
	author = Author.find_by(name: val["author_name"])
	book = Book.find_or_initialize_by(title: val["title"])
	book.isbn = val["isbn"]
	puts "author : #{author&.name}, from: #{val["author_name"]}"
	book.original_title = val["original_title"]
	book.author_id = author.id
	book.year = val["year"]
	book.plot = val["plot"]
	book.copyright = val["copyright"]
	book.title = val["title"]
	book.average_rating = val["average_rating"]
	book.rating_count = val["rating_count"]
	book.description = val["description"]
	book.loc_class = val["loc_class"]
	book.pages = val["pages"]
	book.language = val["language"]
	book.isbn13 = val["isbn13"]
	book.release_date = val["release_date"]
	book.summary = val["summary"]
	book.cover.attach(io: cover  , filename: cover_name) if cover.present?
	book.content_cleaned = val["content_cleaned"]
	book.content_available = val["content_available"]
	book.social_sources.new(type_source: "wikipedia", url: val["wikipedia"]["url"], found: val["wikipedia"]["found"]) if val["wikipedia"].present? && book.new_record?
	book.social_sources.new(type_source: "goodreads", url: val["goodreads"]["url"], found: val["goodreads"]["found"], year: val["goodreads"]["year"]) if val["goodreads"].present? && book.new_record?
	book.social_sources.new(type_source: "gutenberg", url: val["goodreads"]["url"], num: val["goodreads"]["num"]) if val["gutenberg"].present? && book.new_record?
	puts "valid : #{book.valid? ? 'good' : book.errors.full_messages }"
	book.save
	puts "Process Book - #{i+1} is done"
end