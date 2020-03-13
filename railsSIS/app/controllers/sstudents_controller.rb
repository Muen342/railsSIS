class SstudentsController < ApplicationController
    def new
    end
    def show
        @sstudent = Sstudent.find(params[:id])
    end
    def create
        @sstudent = Sstudent.new(sstudent_params)
   
        @sstudent.save
        redirect_to @sstudent
    end
   
    private
        def sstudent_params
            params.require(:sstudent).permit(:id, :name, :surname, :grade)
        end
 end
 