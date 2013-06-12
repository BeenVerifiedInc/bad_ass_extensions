# EXTRACTED FROM THIS THREAD: 
# http://rails.lighthouseapp.com/projects/8994/tickets/879-finding-the-days-weeks-months-years-between-two-dates
require "active_support" rescue (require 'activesupport')

class Date
  def self.days_between(start, finish)
    (finish - start).to_i
  end
  
  def self.weeks_between(start, finish)
    days_between(start, finish) / 7
  end
  
  def self.months_between(start, finish)
    (finish.year * 12 + finish.month) - (start.year * 12 + start.month)
  end
  
  def self.years_between(start, finish)
    difference = finish.year - start.year
    difference -= 1 if difference > 0 && (finish.month < start.month || finish.day < start.day)
    difference
  end
end

#=> Date.years_between(Date.parse('04/26/78', "%m/%d/%Y"), Date.today)  
#=> 30
