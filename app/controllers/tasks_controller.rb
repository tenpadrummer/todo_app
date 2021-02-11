class TasksController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    if logged_in?
      @tasks = Task.where(user_id: current_user.id)
    end
  end

  def show
    @task = Task.find(params[:id])
  end


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save(finished: false)
      flash[:success] = "task successfully created!!"
      redirect_to root_url
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :finished).merge(user_id: current_user.id)
  end

end
