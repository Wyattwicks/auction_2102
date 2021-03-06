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
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    @attendee3 = Attendee.new(name: 'Mike', budget: '$100')
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

  def test_item_bids

    @auction.add_item(@item1)
    @auction.add_item(@item2)
    assert_equal Hash.new, @item1.bids
  end

  def test_add_bids
    @auction.add_item(@item1)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    answer = {
              @attendee2 => 20,
              @attendee1 => 22
            }
            assert_equal answer, @item1.bids
  end

  def test_current_high_bid
    @auction.add_item(@item1)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    assert_equal 22, @item1.current_high_bid
  end

  def test_unpopular_items

    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)

    assert_equal [@item2, @item3, @item5], @auction.unpopular_items
  end

  def test_potential_revenue
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    assert_equal 87, @auction.potential_revenue
  end

  def test_bidders
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    assert_equal [@attendee2, @attendee1, @attendee3], @auction.bidders
  end

end
