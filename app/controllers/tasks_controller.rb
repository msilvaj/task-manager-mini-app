class TasksController < ApplicationController
  before_action :authenticate_user!, only: %i[index new create destroy search]
  before_action :user_profile?
  before_action :find_task, only: %i[edit update show confirm_delete destroy delete_comment]
  skip_before_action :verify_authenticity_token, only: %i[search]
    
  def index
    @tasks = Task.all
  end
  def mytasks
    @tasks = current_user.tasks.all
  end

 

  def show 
    @task = Task.find(params[:id])
      respond_to do | format |
        format.html
      end
  end

  def find_task
    @task = Task.find(params[:id])
  end
  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    @task.user = current_user
    if @task.save
      flash[:notice] = 'Task Created!'
      redirect_to @task
    else
      render :new
    end
  end

  def edit
    
  end


  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html
    end
  end

  def complete
  end

  def incomplete
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :priority, :user_id)
  end  

  def comment_params
    params.require(:comment).permit(:body)
  end 

  def sanitize_sql_like(string, escape_character = "\\")
    pattern = Regexp.union(escape_character, "%", "_")
    string.gsub(pattern) { |x| [escape_character, x].join }
  end
end

