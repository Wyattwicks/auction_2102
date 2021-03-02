
class Item

  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = Hash.new
  end

  def add_bid(attendee, value)
    @bids[attendee] = value
  end

  def current_high_bid
    highest_bid = @bids.values
    highest_bid.max
  end



end
