class Schedule
  require './employee'
  attr_reader :employees

  def initialize
    @weekly_schedule = {
      Monday: (0..600).to_a,
      Tuesday: (0..600).to_a,
      Wednesday: (0..600).to_a,
      Thursday: (0..600).to_a,
      Friday: (0..540).to_a
    }

    @employees = {}
  end

  def create_schedule
    get_number_of_employees
    create_employees
  end

  def display_schedule
    get_employee_schedules
  end

  private

    def get_number_of_employees
      puts
      puts "Please enter number of employees: "
      @number_of_employees = gets.chomp.to_i #add validation
    end

    def get_employee_schedules
      @employees.each do |employee_name, employee|
        puts
        puts "#{employee_name} can work #{employee.work_schedule}"
      end
    end

    def create_employees
      i = 1
      while i <= @number_of_employees
        puts
        puts "Please enter employee #{i}'s name:"
        name = gets.chomp
        employee = Employee.new name
        employee.set_schedule
        @employees[employee.name.to_sym] = employee
        i = i + 1
      end
    end
end
