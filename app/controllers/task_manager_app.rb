class TaskManagerApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = TaskManager.all
    erb :index
  end

#new task
  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

#view individual task
  get '/tasks/:id' do |id|
    @task = TaskManager.find(id.to_i)
    erb :show
  end

#edit existing task
  get '/tasks/:id/edit' do |id|
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id' do |id|
    TaskManager.update(id.to_i, params[:task])
    redirect "/tasks/#{id}"
  end






end