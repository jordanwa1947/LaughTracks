RSpec.describe "a visitor visits the comedians/new page" do
  it 'should post information to the database' do
    comic = Comedian.create(name: 'Mitch Hedberg', age: 48, city: 'Helena, Montana')
    special = comic.specials.create(name: "Louis C.K. 2017", runtime: 74,
      thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_UY268_CR4,0,182,268_AL_.jpg")
    special = comic.specials.create(name: "Louis C.K. 2017", runtime: 76,
      thumbnail: "https://m.media-amazon.com/images/M/MV5BOGYwMmVlMWUtZDE2My00MzMyLTk5MTQtZDdmM2U5YWQwZjM1XkEyXkFqcGdeQXVyMjExNDAyOTU@._V1_UY268_CR4,0,182,268_AL_.jpg")

        visit '/comedians/new'

        fill_in('Name', with:'Jordan Whitten')
        fill_in('Age', with:'22')
        fill_in('City', with:'Tampa, Florida')
        find_button('Create').click

        expect(page).to have_current_path('/comedians')
        expect(page).to have_content "Jordan Whitten"
        expect(page).to have_content "Tampa, Florida"
        expect(page).to have_content "22"
      end

  it 'should have a form with name, age and city fields' do
    visit '/comedians/new'

    expect(page).to have_button('Create')
    expect(page).to have_field('Name')
    expect(page).to have_field('Age')
    expect(page).to have_field('City')
  end

end
