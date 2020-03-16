class CoursesController < ApplicationController
    require 'date'
    def index
        @courses = Course.all
    end

    def new
        @teachers = Teacher.all
    end

    def edit
        @course = Course.find(params[:id])
        @teachers = Teacher.all
    end

    def show
        @course = Course.find(params[:id])
        @students = []
        if @course.students
            @course.students.split(',').each do |stud|
                stud = stud[1..-2]
                s = Sstudent.find(stud)
                @students.append(s)
            end
        end
    end

    def showAttendance
        @course = Course.find(params[:id])
        @attendance_list = []
        dateToday = Date.today.strftime("%F")
        @course.students.split(',').each do |stud|
            stud = stud[1..-2]
            s = Sstudent.find(stud)
            att = {'name': s.surname + ', ' + s.name}
            record = ActiveRecord::Base.connection.execute("select id from attendances where course_id = " + params[:id] + " and student_id = " + stud + " order by date desc;")
            ids = []
            record.each do |id|
                ids.append(id)
            end
            a = Attendance.find(ids)
            att[:attendance] = a
            @attendance_list.append(att)
        end

        @date_list = []
        #@date_list = @attendance_list[0][:attendance].uniq
        record = ActiveRecord::Base.connection.execute("select distinct date from attendances where course_id = " + params[:id] + " order by date desc;")
        record.each do |d|
            @date_list.append(d)
        end

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

        dateToday = Date.today.strftime("%F")
        @students.each do |stud|
            record = ActiveRecord::Base.connection.execute("select id, attendance from attendances where course_id = " + params[:id] + " and student_id = #{stud.id} and date = '" + dateToday + "';")
            rec = record.to_a
            if rec[0]
                if rec[1] == params[stud.name]
                    next
                end
                a = Attendance.find(rec[0][0])
            else
                a = Attendance.new
                a.course_id = params[:id]
                a.student_id = stud.id
                a.date = dateToday
            end
            a.attendance = params[stud.name]
            a.save
        end
        redirect_to course_path(@course)
    end

    def addStudents
        @course = Course.find(params[:id])
        @students = Sstudent.all.order(:surname)
    end

    def saveStudents
        @added = params[:added]
        @students = ""
        @added.each do |a, b|
            if @students == ""
                @students += "*#{a}*"
            else
                @students += ",*#{a}*"
            end
        end

        @course = Course.find(params[:id])
        @course.students = @students
        @course.save
        redirect_to @course
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