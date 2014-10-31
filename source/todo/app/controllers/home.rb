get '/' do
	erb :login_home
end

get '/notes' do
	# user = User.find(session[:user_id])
	# @user_notes = user.notes.order(:id => :asc)

	user = User.find(session[:user_id]) if session[:user_id]

	if user
	  @notes = current_user.notes
	else
		@notes = Note.all
	end
	erb :notes
	# @all_notes = Note.all.order(:id => :asc)
end

get '/notes/new' do
	erb :new_note
end

post '/notes' do
	Note.create!(params)
	redirect '/notes'
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





