class TasksController < ApplicationController
  def index

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
    params.require(:task).permit(:name, :content, :deadline, :finished).merge(user_id: session[:user_id])
  end

end
