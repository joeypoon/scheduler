class Employee
  attr_reader :name, :work_schedule

  def initialize name
    @name = name
    @work_schedule = {
      Monday: (0..600).to_a,
      Tuesday: (0..600).to_a,
      Wednesday: (0..600).to_a,
      Thursday: (0..600).to_a,
      Friday: (0..540).to_a
    }
  end

  def set_schedule
    times_cant_work
  end

  def display_employee_schedule

  end

  private

    def convert_back
      @work_schedule
    end

    def convert_time time
      if time >= 800
        ((time - 800)/100 * 60) + (time % 100)
      else
        ((time + 400)/100 * 60) + (time % 100)
      end
    end

    def get_start day
      puts
      puts "Enter start of time that #{@name} cannot work on #{day} (ex 1030 for 1030am or 245 for 245pm)."
      starting = gets.chomp.to_i
      convert_time starting
    end

    def get_end day
      puts
      puts "Enter end of time that #{@name} cannot work on #{day} (ex 1030 for 1030am or 245 for 245pm)."
      ending = gets.chomp.to_i
      convert_time ending
    end

    def splice_schedule starting, ending, day, hours
      @work_schedule[day.to_sym] = @work_schedule[day.to_sym].reject do |time|
        (starting..ending).to_a.include? time
      end
    end

    def times_cant_work
      @work_schedule.each do |day, hours|
        puts
        puts "Are there times #{@name} cannot work on #{day} (y/n)?"
        cannot_work = gets.chomp.downcase
        while cannot_work == 'y'
          starting = get_start day
          ending = get_end day
          splice_schedule(starting, ending, day, hours)
          puts
          puts "Are there other times #{@name} cannot work on #{day} (y/n)?"
          cannot_work = gets.chomp.downcase
        end
      end
    end
end
