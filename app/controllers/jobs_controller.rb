class JobsController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs
  end

  def show
    @job = Job.find(params[:id])
    render json: { data: @job, status: :ok, message: 'Success' }
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render json: { status: :ok, message: 'Success' }
    else
      render json: { json: @job.errors, status: :unprocessable_entity }
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      render json: { status: :ok, message: 'Success' }
    else
      render json: { json: @job.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      render json: { json: 'Job was successfully deleted.'}
    else
      render json: { json: @job.errors, status: :unprocessable_entity }
    end
  end

  private
  def job_params
    params.require(:job).permit(:id, :title, :company, :contact, :status, :user_id)
  end
end
