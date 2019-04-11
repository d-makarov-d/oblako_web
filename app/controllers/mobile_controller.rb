class MobileController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        s = {'Projects': Project.all.to_json(:include => :todos) }.to_json()
        render :json => Project.all.to_json(:include => :todos)
        #render :json => {'Projects': Project.all, 'Todos': Todo.all}
    end
    def update
        @todo = Todo.find(iscompleted_params['todo_id'].to_i)
        @todo.isCompleted = !@todo.isCompleted
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
