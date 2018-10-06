RSpec.describe "a visitor visits the comedians page" do
  it 'should show comedians information'do
    comic = Comedian.create(name: 'Mitch Hedberg', age: 48, city: 'Helena, Montana')
    special = comic.specials.create(name: "Louis C.K. 2017", runtime: 74,
                                    thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
    visit '/comedians'

    expect(page).to have_content(comic.name)
    expect(page).to have_content(comic.age)
    expect(page).to have_content(comic.city)
  end

  it 'should show specials information' do
    comic = Comedian.create(name: 'Mitch Hedberg', age: 48, city: 'Helena, Montana')
    special = comic.specials.create(name: "Louis C.K. 2017", runtime: 74,
                                    thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
    visit '/comedians'

    expect(page).to have_content(special.name)
    expect(page).to have_content(special.runtime)
    expect(page).to have_css("img[src='#{special.thumbnail}']")
  end

  describe 'Statistcs' do
    it 'should show average special runtime' do
      comic = Comedian.create(name: 'Mitch Hedberg', age: 48, city: 'Helena, Montana')
      special = comic.specials.create(name: "Louis C.K. 2017", runtime: 74,
                                      thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
      special = comic.specials.create(name: "Louis C.K. 2017", runtime: 76,
                                      thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_UY268_CR4,0,182,268_AL_.jpg")

      visit '/comedians'

      expect(page).to have_content 75
    end
  end
end
