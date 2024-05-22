require 'rails_helper'

RSpec.describe User, type: :model do
  context 'member knows their borrowed books' do
    let(:book) { create(:book) }
    let(:member) { create(:user, :member)}
    
    it 'returns borrowed books' do
      member.borrow!(book)
      expect(member.borrowed_books).not_to be_empty
    end
  end
end
