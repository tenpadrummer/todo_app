class TasksController < ApplicationController
  before_action :require_login, except: [:index]
  before_action :set_task, only: %i[show edit update destroy]

  def index
    if logged_in?
      @tasks = Task.where(user_id: current_user.id)
      #ページネーションを導入するまでの応急処置（ページネーションはuser#editの時に同時実装予定）
      @projects = Project.all.limit(3)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save(finished: false)
      flash[:success] = 'task successfully created!!'
      SlackNotifier.new.send(@task)
      redirect_to root_url
    else
      flash[:error] = 'Something went wrong'
      render :new
    end
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'task successfully updated!!'
      redirect_to task_path
    else
      flash[:error] = 'Something went wrong'
      render :edit
    end
  end

  def destroy
    @task.destroy!
    flash[:message] = 'Task successfully deleted!!'
    redirect_to root_url
  rescue ActiveRecord::RecordNotFound
    flash[:message] = 'Task was already deleted!'
  rescue ActiveRecord::RecordNotDestroyed
    flash[:message] = 'Task was not deleted!'
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :finished, :project_id).merge(user_id: current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
