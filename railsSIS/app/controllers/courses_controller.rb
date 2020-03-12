class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def new
    end

    def show
        @course = Course.find(params[:id])
    end

    def create
        @course = Course.new(course_params)
        @course.save
        redirect_to @course
    end

    private
        def course_params
            params.require(:courses).permit(:title, :code, :teacher, :credits, :description)
        end
end
