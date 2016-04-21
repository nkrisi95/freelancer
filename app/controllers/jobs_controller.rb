class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :destroy, :update]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(jobs_params)

    if @job.save
      redirect_to @job, notice: 'Job was successfully created.'
    else
      render 'New'
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
  end

  def update
    if @job.update(jobs_params)
      redirect_to @job, notice: 'Job was successfully updated.'
    else
      render 'Edit'
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  private

  def find_job
    @job = Job.find(params[:id])
  end

  def jobs_params
    params.require(:job).permit(:title, :description)
  end
end
