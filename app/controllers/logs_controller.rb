class LogsController < ApplicationController
  def index
    @logs = Log.all
    @conds = Cond.all
    @techs = Tech.all
    @log = Log.new
  end

  def unresolved
    @logs = Log.all.select { |log| log.situation == false }
    @conds = Cond.all
    @techs = Tech.all
    @log = Log.new
  end

  def resolved
    @logs = Log.all.select { |log| log.situation == true }
    @conds = Cond.all
    @techs = Tech.all
    @log = Log.new
  end

  def create
    @log = current_user.logs.create(log_params)
    if @log.save
      redirect_to request.referrer
    else
      render :root
    end
  
  end

  def edit
    @log = current_user.logs.find_by(id: params[:id])
    @conds = Cond.all
    @techs = Tech.all
    respond_to do |format|
      format.js
    end
  end

  def update
    @log = current_user.logs.find_by(id: params[:id])
    if @log.update(log_params)
      redirect_to request.referrer
    else
      render :root
    end
  end

  def resolve_log
    @log = Log.find_by(id: params[:id])
    @log.update(situation: true)
    if @log.save
      redirect_to request.referrer
    else
      render :root
    end
  end

  private

    def log_params
      params.require(:log).permit(:cond_id, :problem, :tech_id, :situation, :user_id)
    end
end
