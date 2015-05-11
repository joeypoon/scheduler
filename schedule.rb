class Schedule
  require './employee'
  attr_reader :employees

  def initialize
    @weekly_schedule = {
      Monday: [0..600],
      Tuesday: [0..600],
      Wednesday: [0..600],
      Thursday: [0..600],
      Friday: [0..540]
    }

    @employees = []
  end

  def create_schedule
    get_number_of_employees
    create_employees
  end

  def display_schedule
  end

  private

    def get_number_of_employees
      puts
      puts "Please enter number of employees: "
      @number_of_employees = gets.chomp.to_i #add validation
    end

    def create_employees
      i = 1
      while i <= @number_of_employees
        puts
        puts "Please enter employee #{i}'s name:"
        name = gets.chomp
        employee = Employee.new name
        employee.times_cant_work
        @employees << employee
        i = i + 1
      end
    end
end
