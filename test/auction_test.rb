require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee'
require './lib/item'
require './lib/auction'

class AuctionTest < Minitest::Test
  def setup
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee = Attendee.new(name: 'Megan', budget: '$50')
  end

  def test_it_exists
    assert_instance_of Auction, @auction
  end

  def test_items_is_empty
    assert_equal [], @auction.items
  end

  def test_add_items
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    assert_equal [@item1, @item2], @auction.items
  end

  def test_item_names
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    assert_equal [@item1.name, @item2.name], @auction.item_names
  end
end
