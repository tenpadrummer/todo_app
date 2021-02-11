class TasksController < ApplicationController
  before_action :require_login, except: [:index]
  before_action :set_task, only: [:show, :edit, :update]

  def index
    if logged_in?
      @tasks = Task.where(user_id: current_user.id)
    end
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

  def update
    if @task.update(task_params)
      flash[:success] = "task successfully updated!!"
      redirect_to task_path
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :finished).merge(user_id: current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
