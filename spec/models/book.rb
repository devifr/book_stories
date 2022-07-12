require 'rails_helper'

RSpec.describe Book, type: :model do

  subject {
  	described_class.new(title: "Book Name", release_date: DateTime.now)
  }

  describe "Validations" do
  	it "is valid with valid attribute" do
  		author = Author.create(name: 'Author Book' )
  		subject.author_id = author.id
  		expect(subject).to be_valid
  	end

  	it "is not valid without author_id" do
	  	subject.author_id = nil
  		expect(subject).to_not be_valid
  	end

  	it "is not valid without title" do
	  	subject.title = nil
  		expect(subject).to_not be_valid
  	end

  	it "is not valid without release date" do
	  	subject.release_date = nil
  		expect(subject).to_not be_valid
  	end
  end

  describe "Associations" do
  	it { should belong_to(:author).without_validating_presence }
  	it { should have_many(:social_sources).without_validating_presence }
  end

  describe "filtering" do
  	before do
  	 	@author = Author.create(name: 'Author Book')
		 	@books = Book.create(title: 'My Book', author_id: @author.id, year: 2019, pages: 100, similiar_books: "Test Book, Book Two", release_date: DateTime.now)
		end

  	it "should have data while search by author" do
  		search_books = Book.search({author_id: @author.id})
  		expect(search_books.count).to eq(1)
  	end  	

  	it "should have data while search by year" do
  		search_books = Book.search({year: 2019})
  		expect(search_books.count).to eq(1)
  	end

  	it "should have data while search by page" do
  		search_books = Book.search({from_page: 1, to_page: 100})
  		expect(search_books.count).to eq(1)
  	end

  	it "should have data while search by similiar book" do
  		search_books = Book.search({similar_books: 'test'})
  		expect(search_books.count).to eq(1)
  	end

  	it "should no data while search by wrong data" do
  		search_books = Book.search({year: 2000})
  		expect(search_books.count).to eq(0)
  	end
  end

end