require 'pry'

class CashRegister

    attr_accessor :total, :all_items, :all_prices
    attr_reader :discount

    def initialize discount = 0
        @discount = discount
        @total = 0
        @all_items = []
        @all_prices = []
    end

    def add_item title, price, quanity=1
        self.total += price * quanity
        quanity.times { |i| @all_items << title} 
        @all_prices << price*quanity
    end

    def apply_discount
        return "There is no discount to apply." if discount == 0
        self.total = (@total * (1-(@discount.to_f / 100.to_f)))
        "After the discount, the total comes to $#{self.total.to_i}."
    end

    def items
        @all_items 
    end

    def void_last_transaction

        voided_item_price = @all_prices.pop
        self.total -= voided_item_price
    end

end

my_cash_register = CashRegister.new(20)
my_cash_register.add_item("tomato", 1.76, 2)
