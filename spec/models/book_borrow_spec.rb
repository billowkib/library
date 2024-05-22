require 'rails_helper'

RSpec.describe BookBorrow, type: :model do
  context 'validates uniqueness between user and book' do
    let!(:member) { create(:user, :member) }
    let!(:book) { create(:book) }
    let(:book_borrow) { create(:book_borrow, user: member, book: book) }

    it 'does not persist repeated book_borrows' do
      book_borrow

      expect { member.borrow!(book) }.to raise_error 
    end
  end

  context 'due_today scope' do
    let!(:member) { create(:user, :member) }
    let!(:book) { create(:book) }
    let(:book_borrow) { create(:book_borrow, book: book, user: member, due_date: Time.current) } 

    it 'fetches borrowed books' do
      book_borrow
      expect(BookBorrow.due_today).not_to be_empty
    end
  end
end
