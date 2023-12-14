# book_spec.rb

require_relative '../book'
require_relative '../rental'

describe Book do
  let(:book_title) { 'The Great Gatsby' }
  let(:author_name) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(book_title, author_name) }

  it 'has a title and an author' do
    expect(book.title).to eq(book_title)
    expect(book.author).to eq(author_name)
  end

  it 'starts with an empty list of rentals' do
    expect(book.rentals).to be_empty
  end
end
