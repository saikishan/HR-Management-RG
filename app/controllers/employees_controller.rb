class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
        puts @employees
        return @employees
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def create
        @employee = Employee.new()
        employee_details = employee_params
        @employee.name = employee_details[:name]
        @employee.team = Team.find(employee_details[:team_id])
        @employee.age = employee_details[:age]
        @employee.desigination = employee_details[:desigination]
        @employee.date_of_joining = employee_details[:date_of_joining]
        employee_details[:skills].each do |x|
            if x.length > 0
                @employee.skills<<Skill.find(x)
            end
        end
        if @employee.save
            redirect_to @employee
        else
            render 'new'
        end

    end

    def new
       @employee = Employee.new
    end

    private
    def employee_params
        employee_details = {}
        employee_details[:name] = params.require(:employee_name)
        employee_details[:age] = params.require(:employee_age)
        employee_details[:team_id] = params.require(:team)[:team_id]
        employee_details[:skills] = params.require(:skill)[:skill_ids]
        employee_details[:date_of_joining] = params.require(:joining_date)[:date_of_joiing]
        employee_details[:desigination] = params.require(:desigination)
        return employee_details
    end
end
