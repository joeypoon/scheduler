class Employee
  def initialize name
    @name = name
    @work_schedule = {
      Monday: [0..600],
      Tuesday: [0..600],
      Wednesday: [0..600],
      Thursday: [0..600],
      Friday: [0..540]
    }
  end

  def set_schedule
    times_cant_work
  end

  private

    def convert_time time
      if time >= 800
        ((time - 800)/100 * 60) + (time % 100)
      else
        ((time + 400)/100 * 60) + (time % 100)
      end
    end

    def convert_diff starting, ending
      time = 0
      diff = ending - starting
      hours = diff / 100
      if hours >= 1
        time = time + hours * 60
        time = time + diff % 100
      else
        time = time + diff
      end
    end

    def get_start day
      puts "Enter start of time that #{@name} cannot work on #{day} (ex 1030 for 1030am or 245 for 245pm)."
      starting = gets.chomp.to_i
      convert_time starting
    end

    def get_end day
      puts "Enter end of time that #{@name} cannot work on #{day} (ex 1030 for 1030am or 245 for 245pm)."
      ending = gets.chomp.to_i
      convert_time ending
    end

    def splice_schedule starting, ending, day, hours
      start = hours.find { |hour| hour == starting }
      diff = convert_diff(starting, ending)
      @work_schedule[day.to_sym].reject do |time|
        [starting..ending].include? time
      end
    end

    def times_cant_work
      @work_schedule.each do |day, hours|
        puts "Are there times #{@name} cannot work on #{day} (y/n)?"
        cannot_work = gets.chomp.downcase
        while cannot_work == 'y'
          starting = get_start day
          ending = get_end day
          splice_schedule(starting, ending, day, hours)
          puts "Are there other times #{@name} cannot work on #{day} (y/n)?"
          cannot_work = gets.chomp.downcase
        end
      end
    end
end
