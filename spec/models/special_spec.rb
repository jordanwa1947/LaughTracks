RSpec.describe Special do
  describe 'Validations' do
    describe 'Required Field(s)' do
      it 'should be invalid if missing a name' do
        special = Special.create
        expect(special).to_not be_valid
      end

      it 'should belong to one comedian' do
        association = Special.reflect_on_association(:comedian)
        expect(association.macro).to eq :belongs_to
      end
    end
  end

  describe 'Class Methods' do
    it 'should calculate average runtime'do
      Special.create(name: "Louis C.K. 2017", runtime: 74, thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
      Special.create(name: "Louis C.K.: Shameless", runtime: 56, thumbnail: "https://m.media-amazon.com/images/M/MV5BMjE4NjE1ODI5Ml5BMl5BanBnXkFtZTcwMTgxNjc0MQ@@._V1_UY268_CR4,0,182,268_AL_.jpg")

      average = Special.average_runtime
      expect(average).to eq 65
    end
  end
end
