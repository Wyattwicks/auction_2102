require './lib/attendee'
require './lib/item'

class Auction

  attr_reader :items

  def initialize
    @items = []

  end

  def add_item(item)
    @items << item
  end

  def item_names
    item_names = []
    @items.each do |item|
      item_names << item.name
    end
    item_names
  end

  def unpopular_items
    unpopular_items = []
    @items.each do |item|
      if item.bids == {}
        unpopular_items << item
      end
    end
    unpopular_items
  end

  def potential_revenue
    potential_revenue = []
    @items.each do |item|
      if item.bids != {}
        potential_revenue << item.current_high_bid
      end
    end
    potential_revenue.sum
  end

  def bidders
    bidders = []
    @items.each do |item|
      if item.bids != {} && item.bids
        bidders << item.bids.keys
      end
    end
    bidders.flatten
  end

end
