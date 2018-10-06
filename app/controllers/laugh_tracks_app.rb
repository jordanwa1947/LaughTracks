
class LaughTracksApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/comedians' do
    if params[:age] == nil
      @comedians = Comedian.all
    else
      @comedians = Comedian.all.find_all do |comedian|
        comedian.age == params[:age].to_i
      end
    end
    @specials = Special.all
    erb :comedians
  end
end
