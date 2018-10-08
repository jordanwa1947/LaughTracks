

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

    describe 'Class Methods' do
      it 'should calculate average age' do
        Comedian.create(name: 'Mitch Hedberg', age: 48, city: 'Helena, Montana')
        Comedian.create(name: 'Jordan Whitten', age: 52, city: 'Tampa, Florida')


        expect(Comedian.average_age).to eq 50
      end

      it 'should output uniq cities' do
        Comedian.create(name: 'Mitch Hedberg', age: 48, city: 'Helena, Montana')
        Comedian.create(name: 'Jordan Whitten', age: 52, city: 'Tampa, Florida')
        Comedian.create(name: 'Jordan Whitten', age: 52, city: 'Tampa, Florida')


        expect(Comedian.uniq_cities).to eq ["Tampa, Florida", "Helena, Montana"]
      end
    end
  end
end
