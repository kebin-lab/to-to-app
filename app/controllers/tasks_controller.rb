class TasksController < ApplicationController
    before_action :current_user

    def current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def index
        @tasks = Task.where(user_id: @current_user.id).order(priority: "asc")
    end

    def show
        @task = Task.find_by(id: params[:id])
    end

    def new
        @task = Task.new
    end

    def create
        all_user_tasks = Task.where(user_id: @current_user.id)
        length = all_user_tasks.length
        priority = params[:priority].to_i

        if !all_user_tasks
             priority = 1
        elsif length < priority
            priority = length + 1
        else
            all_user_tasks.each do |task|
                if task.priority >= priority
                    task.priority +=1
                    task.save
                end
            end
        end
    
        task = Task.new(
            user_id: @current_user.id,
            priority: priority,
            task_summary: params[:summary],
            task_detail: params[:detail],
            deadline: params[:deadline]
        )
        if task.save
            flash[:notice] = "タスクを追加しました"
            redirect_to("/tasks/index")
        else
            flash[:notice] = "タスクの追加に失敗しました"
            render("new")
        end
    end

    def edit
        @task = Task.find_by(id: params[:id])
    end

    def update

    end

    def destroy
        @task = Task.find_by(id: params[:id])
        if @task.destroy
            flash[:notice] = "削除が完了しました"
            redirect_to("/tasks/index")
        end
    end

end
