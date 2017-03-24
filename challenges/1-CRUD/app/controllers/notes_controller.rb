# Index
get '/' do
  @notes = Note.all
  haml :index, :layout => :'layouts/layout'
end

# New
get '/notes/new' do
  haml :new, :layout => :'layouts/layout'
end

# Show
get '/notes/:id' do
  @note = Note.find_by(id: params[:id])
  haml :show, :layout => :'layouts/layout'
end

# Create
post '/notes' do
  @note = Note.new(title: params[:title], content: params[:content])
  if @note.save
    redirect "/notes/#{@note.id}"
  else
    @errors = @note.errors.full_messages
    haml :new, :layout => :'layouts/layout'
  end
end 

# Edit
get '/notes/:id/edit' do
  @note = Note.find_by(id: params[:id])
  haml :edit, :layout => :'layouts/layout'
end 

# Update
patch '/notes/:id' do
  note = Note.find_by(id: params[:id])
  note.update(title: params[:title], content: params[:content])
  redirect "/notes/#{note.id}"
end

# Destroy
get '/notes/:id/delete' do
  note = Note.find_by(id: params[:id])
  note.destroy
  redirect '/'
end










