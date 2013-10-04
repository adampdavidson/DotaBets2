class My::BetsController < ApplicationController


  before_filter :require_login
  before_filter :require_bet, except: [:index, :new, :create]

  def index
    @bets = current_user.bets.order('bets.created_at DESC').all
  end

  def new
    @bet = current_user.bets.build
  end

  def edit
  end

  def update
  end

  def create
    # @project = current_user.projects.build params[:project]
    # if @project.save
    #   redirect_to [:my, :projects], notice: "Project created!"
    # else
    #   render :new
    # end
  end

  protected

  def require_bet
    @bet = current_user.bets.find params[:id]
  end


end
