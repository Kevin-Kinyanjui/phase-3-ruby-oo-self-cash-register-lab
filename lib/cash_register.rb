class CashRegister
    attr_accessor :total, :discount, :prev_transaction, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times { items << title }
        self.prev_transaction = price * quantity
    end

    def apply_discount
        if discount > 0
            self.total -= (total * discount / 100.0).to_i
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.prev_transaction
    end
end

# kevin = CashRegister.new(20)
# puts kevin.add_item("Light Bulb", 4, 4)
# puts kevin.apply_discount
# puts kevin.items
