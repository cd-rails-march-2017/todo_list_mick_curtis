class TasksController < ApplicationController
  def index
    @user = User.find(session[:user])
    if session[:show_all] == true
      @tasks = @user.tasks
    else
      @tasks =  @user.tasks.where("completed = ?", false)
    end
  end

  def new
  end

  def create
    @task = Task.new(task_params)
    @task.user = User.find(session[:user])
    @task.completed = false
    if @task.valid?
      @task.save
      redirect_to '/tasks'
    else
      flash[:errors] = @task.errors.full_messages
      redirect_to '/tasks/new'
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.completed = !@task.completed
    @task.save
    redirect_to '/tasks'
  end

  private
  def task_params
    params.require(:task).permit(:content, :due_date)
  end
end
