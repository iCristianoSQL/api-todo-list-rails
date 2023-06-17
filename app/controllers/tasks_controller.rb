class TasksController < ApplicationController
    before_action :set_task, only: [:show, :update, :destroy]
  
    def index
      @tasks = Task.order(created_at: :desc)
      render json: {
        message: "Tarefas carregadas com sucesso!",
        data: @tasks
      }
    end
  
    def show
      render json: @task
    end
  
    def create
      @task = Task.new(task_params)
      if @task.save
        render json: {
          message: "Tarefa #{@task.title} inserida com sucesso.",
          data: @task
        }, status: :created
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
      render json: { message: 'Tarefa excluída com sucesso' }
    end
  
    private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:user, :photo, :finished, :title, :description)
    end
  end
  