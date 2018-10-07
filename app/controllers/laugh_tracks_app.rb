
class LaughTracksApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/comedians' do
    if params[:age] == nil
      @comedians = Comedian.all
      @specials = Special.all
    else
      @comedians = Comedian.where(age:params[:age])
      @specials = Special.where(comedian_id: @comedians.ids)
    end
    erb :comedians
  end

  get '/comedians/new' do
    erb :"comedians/new"
  end

  post '/comedians' do
    Comedian.create(params[:comedian])
    redirect "/comedians"
  end
end
