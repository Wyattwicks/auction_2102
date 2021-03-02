class Attendee

  attr_reader :name

  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget]
  end

  def budget
    budget_array = @budget.split('$')
    @budget = budget_array[1].to_i
  end

end
