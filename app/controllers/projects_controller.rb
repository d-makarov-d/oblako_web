class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end
    def update
        @todo = Todo.find(iscompleted_params['todo_id'].to_i)
        puts @todo.isCompleted
        puts 'changed'
        if @todo.isCompleted then
            @todo.isCompleted = false
        else
            @todo.isCompleted = true
        end
        puts @todo.isCompleted
        @todo.save
        redirect_to root_url
    end
    def create
        @todo = Todo.new(text: todo_params['text'], isCompleted: false, project: Project.find(todo_params['project_id'].to_i))
        @todo.save
        redirect_to root_url
    end

    private def todo_params
        params.permit(:text, :project_id)
    end
    private def iscompleted_params
        params.permit(:todo_id)
    end
end
