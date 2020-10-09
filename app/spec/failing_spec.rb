require 'rails_helper'

RSpec.describe Object do
    it 'fails' do
        expect(1).to eq 0
    end
end

RSpec.describe TestDbModel do
    it 'passes' do
        model = TestDbModel.new
        model.Name = 'test'
        model.save!
        expect(model.id).not_to eq nil
    end
end