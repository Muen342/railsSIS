class TeacherController < ApplicationController

    def index
        @teachers = Teacher.all
    end

    def new
    end

    def edit
        @teacher = Teacher.find(params[:id])
    end

    def show
        @teacher = Teacher.find(params[:id])
    end

    def create
        @teacher = Teacher.new(teacher_params)
        @teacher.save
        redirect_to @teacher
    end

    def update
        @teacher = Teacher.find(params[:id])
        if @teacher.update(teacher_params)
            redirect_to @teacher
        else
            render 'edit'
        end
    end

    private
        def teacher_params
            params.require(:teacher).permit(:name, :surname, :department)
        end
end
