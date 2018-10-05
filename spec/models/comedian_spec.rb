

RSpec.describe Comedian do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        comic = Comedian.create(age: 48)
        expect(comic).to_not be_valid
      end

      it 'should be invalid if missing an age' do
        comic = Comedian.create(name: 'Mitch Hedberg')
        expect(comic).to_not be_valid
      end

      it 'should be valid if missing nothing' do
        comic = Comedian.create(name: 'Mitch Hedberg', age: 48, city: 'Helena, Montana')
        expect(comic).to be_valid
      end

      it 'comedian should have many specials' do
        association = Comedian.reflect_on_association(:specials)
        expect(association.macro).to eq :has_many
      end
    end
  end
end
