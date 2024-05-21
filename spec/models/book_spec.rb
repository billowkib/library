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
end
