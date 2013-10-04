class BetsController < ApplicationController

  before_filter :require_login
  before_filter :require_project

  def new
    @bet = @project.bets.build
  end

  def create
    @bet = @project.bets.build params[:bet]
    @bet.user = current_user
    bet_setup(@bet)

    if @bet.save
      redirect_to [:my, :bets], notice: "Bet submitted! You bet $#{@bet.amount1} for TEAM A and $#{@bet.amount2} for TEAM B"
    else
      render :new
    end
  end

  protected

  def require_project
    @project = Project.find params[:project_id]
  end

  def bet_setup(the_bet)
    if the_bet[:amount1] == nil
      the_bet[:amount1] = 0
    end
    if the_bet[:amount2] == nil
      the_bet[:amount2] = 0
    end

  end
end