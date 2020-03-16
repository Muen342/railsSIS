class SstudentsController < ApplicationController
    def index
        @sstudents = Sstudent.all
    end
    def new
        @sstudent = Sstudent.new
    end
    
    def edit
        @sstudent = Sstudent.find(params[:id])
    end
    def show
        @sstudent = Sstudent.find(params[:id])
    end
    def courses
        record = ActiveRecord::Base.connection.execute("Select id from courses where students like '%*" + params[:id] + "*%';")
        ids = []
        record.each do |row|
            ids << row
        end
        @courses = Course.find(ids)
        render 'courses'
    end
    def create
        @sstudent = Sstudent.new(sstudent_params)
   
        if @sstudent.save
            redirect_to @sstudent
        else
            render 'new'
        end
    end
    def update
        @sstudent = Sstudent.find(params[:id])
        if @sstudent.update(sstudent_params)
            if params[:id] != sstudent_params[:id]
                record = ActiveRecord::Base.connection.execute("Select id from courses where students like '%*" + params[:id] + "*%';")
                ids = []
                record.each do |row|
                    ids << row
                end
                courses = Course.find(ids)
                courses.each do |course|
                    temp = course[:students]
                    temp["*" + params[:id] + "*"] = "*" + sstudent_params[:id] + "*"
                    course[:students] = temp
                    course.save
                end
            end
            redirect_to @sstudent
          else
            render 'edit'
          end
    end
    def destroy
        @sstudent = Sstudent.find(params[:id])
        @sstudent.destroy
    
        redirect_to sstudents_path
    end
   
    private
        def sstudent_params
            params.require(:sstudent).permit(:id, :name, :surname, :grade)
        end
end
 