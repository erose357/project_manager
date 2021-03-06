class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      current_user.projects << @project
      OriginalBudget.create!({project_id: @project.id})
      flash[:success] = "#{@project.name} Created!"
      redirect_to projects_path
    else
      flash[:error] = "Error, #{@project.errors.keys}, #{@project.errors.values}"
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:name, :street, :city, :state, :zip)
  end
end

