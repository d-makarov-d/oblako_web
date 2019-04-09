class MobileController < ApplicationController
    def index
        render :json => {'Projects': Project.all.to_json(:include => :todos) }
    end
    def update
        @todo = Todo.find(iscompleted_params['todo_id'].to_i)
        if @todo.isCompleted then
            @todo.isCompleted = false
        else
            @todo.isCompleted = true
        end
        @todo.save
    end
    def create
        @todo = Todo.new(text: todo_params['text'], isCompleted: false, project: Project.find(todo_params['project_id'].to_i))
        @todo.save
    end

    private def todo_params
        params.permit(:text, :project_id)
    end
    private def iscompleted_params
        params.permit(:todo_id)
    end
end
