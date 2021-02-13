class ProjectsController < ApplicationController
  before_action :require_login
  before_action :set_project, only: [:edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project successfully created!!"
      redirect_to root_url
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def update
    if @project.update(project_params)
      flash[:success] = "Project successfully updated!!"
      redirect_to root_url
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @project.destroy!
    flash[:message] = "Project successfully deleted!!"
    redirect_to root_url
    rescue ActiveRecord::RecordNotFound
      flash[:message] = "Project was already deleted!"
    rescue ActiveRecord::RecordNotDestroyed
      flash[:message] = "Project was not deleted!"
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
