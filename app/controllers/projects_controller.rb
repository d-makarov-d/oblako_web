class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end
    def update
    end
    def create
        @todo = Todo.new(text: todo_params['text'], isCompleted: false, project: Project.find(todo_params['project_id'].to_i))
        @todo.save
        redirect_to root_url
    end

    private def todo_params
        params.permit(:text, :project_id)
    end
end
