get '/' do
	erb :login_home
end

get '/notes' do
	@current_user = User.find(session[:user_id]) if session[:user_id]

	if @current_user 
	  @notes = @current_user.notes.order(:id => :asc)
	  erb :notes
	else 
		redirect '/' # Is this necessary?
	end 
end

get '/notes/new' do
	erb :new_note
end

post '/notes' do
	note = Note.create(title: params[:title], content: params[:content])
	content_type :json 
	{ note_id: note.id, title: note.title, content: note.content }.to_json	
end

put '/notes/:id' do
	note = Note.find(params[:id])
	note.update_attributes(title: params[:title], content: params[:content])
	redirect '/notes'
end

get '/notes/:id/edit' do
	@note = Note.find(params[:id])
	erb :edit_note
end

get '/notes/:id' do
	@note = Note.find(params[:id])
	erb :view_note
end

delete '/notes/:id' do
	note = Note.find(params[:id])
	note.destroy
	redirect '/notes'
end





