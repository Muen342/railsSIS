class ApplicationController < ActionController::Base
    def execute_statement(sql)
        results = ActiveRecord::Base.connection.execute(sql)
      
        if results.present?
            return results
        else
            return nil
        end
    end
end
