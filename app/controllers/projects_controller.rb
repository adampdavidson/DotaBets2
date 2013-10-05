class ProjectsController < ApplicationController
	

    def index
    	@projects = Project.all
  	end

  	def show
         @project = Project.find(params[:id])
  	end

  	def project_params
    	params.require(:title).permit(:team1, :team2, :title, :description, :goal, :user_id)
  	end

    def new
      if (current_user.admin == 1)
      @project = current_user.projects.build
      else
      not_admin
      end
    end

    def create
    if (current_user.admin ==1)
      @project = current_user.projects.build params[:project]
      if @project.save
        redirect_to "/projects", notice: "Match created! Write down the time, don't forget to administer closing"
      else
        render :new
      end
     else
     not_admin
     end
  end


 


end
