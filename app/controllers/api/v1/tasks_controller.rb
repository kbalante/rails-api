class Api::V1::TasksController < ApplicationController
  before_action :authenticate_request!
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    load_current_user!
    @tasks = @current_user.tasks

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:summary, :description)
    end
end
