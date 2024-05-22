require 'rails_helper'

RSpec.describe BookBorrow, type: :model do
  context 'validates uniqueness between user and book' do
    let!(:member) { create(:user, :member) }
    let!(:book) { create(:book) }
    let(:book_borrow) { create(:book_borrow, user: member, book: book) }

    it 'does not persist repeated book_borrows' do
      book_borrow
      bogus_borrow = member.borrow!(book)

      expect(bogus_borrow.errors).not_to be_empty 
    end
  end
end
