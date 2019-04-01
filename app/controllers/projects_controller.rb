class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end
    def update
    end
    def create
    end
end
