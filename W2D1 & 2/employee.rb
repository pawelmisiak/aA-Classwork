class Employee
  attr_reader :salary
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    unless boss.nil?
      @boss.employees_under << self
    end
  end
  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees_under  
  def initialize(name, title, salary, boss)
    @employees_under = []
    super(name, title, salary, boss)
  end
  
  def bonus(multiplier)
    sum = 0
    @employees_under.each do |emp|
      if emp.class == Manager
        emp.employees_under.each {|i| sum += i.salary }
      end
      sum += emp.salary
    end
    sum * multiplier
  end
end