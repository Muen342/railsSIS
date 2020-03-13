class CoursesController < ApplicationController
    require 'date'
    def index
        @courses = Course.all
    end

    def new
    end

    def edit
        @course = Course.find(params[:id])
    end

    def show
        @course = Course.find(params[:id])
        @students = []
        @course.students.split(',').each do |stud|
            stud = stud[1..-2]
            s = Sstudent.find(stud)
            @students.append(s)
        end
    end

    def showAttendance
        @course = Course.find(params[:id])
        @attendance_list = []
        @date_list = []
        dateToday = Date.today.strftime("%F")
        @course.students.split(',').each do |stud|
            stud = stud[1..-2]
            s = Sstudent.find(stud)
            att = {'name': s.surname + ',' + s.name}
            a = Attendance.where(course_id: params[:id], student_id: stud).order(:id)
            att['attendance'] = a
            @attendance_list.append(att)
        end

        @date_list = @attendance_list[0]['attendance'].uniq

    end

    def editAttendance
        @course = Course.find(params[:id])
        @students = []
        @course.students.split(',').each do |stud|
            stud = stud[1..-2]
            s = Sstudent.find(stud)
            @students.append(s)
        end
    end

    def saveAttendance
        @course = Course.find(params[:id])
        @attendances = []
        @students = []
        @course.students.split(',').each do |stud|
            stud = stud[1..-2]
            s = Sstudent.find(stud)
            @students.append(s)
        end

        @students.each do |stud|
            a = Attendance.new
            a.attendance = params[stud.name]
            a.course_id = params[:id]
            a.student_id = stud.id
            a.date = Date.today.strftime("%F")
            print a
            a.save
        end
        redirect_to courses_path(@course)
    end

    def create
        @course = Course.new(course_params)
        @course.save
        redirect_to @course
    end

    def update
        @course = Course.find(params[:id])
        if @course.update(course_params)
            redirect_to @course
          else
            render 'edit'
          end
    end

    private
        def course_params
            params.require(:courses).permit(:title, :code, :teacher, :credits, :description)
        end

        def attendance_params
            params.require(:attendance).permit(:attendance)
        end
end

# date, attendance, course, student