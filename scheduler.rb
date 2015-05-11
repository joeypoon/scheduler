#!/usr/bin/env ruby

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

# require './schedule'
require './employee'

# schedule = Schedule.new
# schedule.create_schedule
# schedule.display_schedule

employee = Employee.new 'Joey'
employee.set_schedule
