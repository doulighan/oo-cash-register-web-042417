require 'pry'

class CashRegister
  attr_accessor :total, :discount, :last_item, :last_item_quantity  

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
    @last_item = nil
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times { @items << title }
    @last_item = price * quantity
  end

  def apply_discount
    if @discount
      @total = @total - (@total * @discount / 100.0)
      "After the discount, the total comes to $800."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= last_item
    @items.pop(@last_item_quantity)
  end

  def items
    @items
  end
  

end