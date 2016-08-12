get '/questions' do
  @questions = Question.all
  erb :index
end

get '/questions/new' do
  user = self.current_user
  if logged_in?
    erb :"/questions/new"
  else
    redirect '/login'
  end
end

post '/questions' do
  @question = Question.new(params[:question])
  @question.user_id = session[:user_id]
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
  end
end

get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  @answers = Answer.where(question_id: @question.id)
  erb :'/questions/show'
end

post '/questions/:question_id/comments' do
  question = Question.find(params[:commentable])
  comment = question.comments.new(params[:comment])
  comment.user_id = session[:user_id]
  comment
  # if comment.save
  # else
    @errors = comment.errors.full_messages unless comment.save
  # end
  @question = question
  @answers = Answer.where(question_id: @question.id)
  erb :"/questions/show"
end

delete '/questions/:id' do
  question = Question.find(params[:id])
  question.destroy
  redirect '/'
end

put '/questions/:question_id' do
 p "hello"
end

delete '/questions/:question_id/comments/:id' do
  question = Question.find(params[:question_id])
  comment = Comment.find(params[:id])
  comment.destroy
  redirect "/questions/#{question.id}"
end




