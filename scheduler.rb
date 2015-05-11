#setup ******
# get number of employees
# get name of employees
# get employee schedules for each day

#processing *****
#loop employees
#check how many employees are available for time block
#if can work 4 straight hours, schedule employee for block

#representation *****
#8am = 0
#9am = 60
#6pm = 600

class Employee
  attr_accessor :times_cant_work
  attr_reader :name

  def initialize name
    @name = name
  end
end

class Schedule
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

  def get_number_of_employees
    puts "Please enter number of employees: "
    @number_of_employees = gets.chomp #add validation
  end

  def create_employees
    i = 1
    while i <= @number_of_employees
      puts "Please enter employee #{i}'s name:"
      name = gets.chomp
      employee = Employee.new name
    end
  end

  def create_schedule
  end
end

# ask number_of_employees
employees = []

# create employee up to number
i = 1
while i <= number_of_employees
  puts "What is the name of employee #{i}?"
  name = gets.chomp
  employee = Employee.new name
  puts "What times can #{employee.name} not work? (Ex. 8-10)"

  employees << employee
end

schedule = Schedule.new number_of_employees
schedule.create_schedule
