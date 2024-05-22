require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'has basic info' do
    let(:book) { create(:book) }
    %i(title author genre isbn).each do |field|
      it "has a valid #{field}" do
        expect(book.public_send(field)).not_to be_blank
      end
    end
  end

  context 'borrowed scope' do
    let(:book) { create(:book) }
    let(:book_borrow) { create(:book_borrow, book: book) } 

    it 'fetches borrowed books' do
      book_borrow
      expect(Book.borrowed).not_to be_empty
    end
  end
end
