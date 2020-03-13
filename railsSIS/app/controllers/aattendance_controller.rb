class AattendanceController < ApplicationController

    def index
        @aattendance = Aattendance.all
    end
end
