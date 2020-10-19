class Api::V1::ProjectsController < ActionController::API
  include Response
  include ExceptionHandler
  before_action :doorkeeper_authorize!
  before_action :set_project, only: [:show]

  def currently_working_projects
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @projects = @user.projects.where.not(:status => ['Started', 'In Progress', 'Dev Completed'])
    end
    json_response(@projects)
  end

  def all_assigned_projects
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @projects = @user.projects
    end
    json_response(@projects)
  end

  def show
    json_response(@project)
  end

  protected

  def set_project
    @project = Project.find_by!(id: params[:id])
  end
end