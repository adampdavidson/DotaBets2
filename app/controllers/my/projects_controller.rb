class My::ProjectsController < ApplicationController

  before_filter :require_login
  before_filter :require_bets

  def index
    # @bets.each do |x|{
    #   @projects = @projects.push(x.project) 
    # }
    @projects = Project.all()
  end

  def new
    @project = current_user.projects.build
  end

  def edit
  end

  def update
    if @project.update_attributes params[:project]
      redirect_to [:my, :projects], notice: "Project updated!"
    else
      render :edit
    end
  end

  def create
    @project = current_user.projects.build params[:project]
    if @project.save
      redirect_to [:my, :projects], notice: "Project created!"
    else
      render :new
    end
  end

  protected

  def require_bets
    # @bets = current_user.matches.bets find params[:id]
    # @bets = current_user.bets.matches find params[:id]
    # @bets = current_user.matches find params[:id]
  end
end