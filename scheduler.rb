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
#900 = 60
#930 = 90
#6pm = 600

class Employee
  attr_reader :name, :times_cant_work

  def initialize name
    @name = name
    @times_cant_work = []
  end

  def times_cant_work
    puts
    puts "Please enter times #{@name} can't work (ex. 1000-1130) or enter -1 if finished entering times."
    times = gets.chomp
    while times != '-1'
      @times_cant_work << convert_time(times)
      puts
      puts "Other times #{@name} can't work (ex. 1000-1130)? Enter -1 if finished entering times."
      times = gets.chomp
    end
  end

  private

    def convert_time times
      times = times.split("-")
      hours = times.map do |time|
        time = time.to_i
        if time >= 800
          ((time - 800)/100 * 60) + (time % 100)
        else
          ((time + 400)/100 * 60) + (time % 100)
        end
      end
    end
end

class Schedule
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

schedule = Schedule.new
schedule.create_schedule
puts schedule.employees
