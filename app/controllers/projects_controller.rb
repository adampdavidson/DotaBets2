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

    def create
    @bet = @project.bets.build params[:bet]
    @bet.user = current_user

    if @pledge.save
      UserMailer.new_pledge(@pledge).deliver #will now send emails when a pledge is created
      redirect_to @project, notice: "Nice! Thanks for pledging $#{@pledge.amount} for this project."
    else
      render :new
    end
  end


end
