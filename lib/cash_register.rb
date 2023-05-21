class CashRegister
    attr_accessor :items, :discount, :total, :last_transaction
  
    def initialize(discount=0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, amount, quantity=1)
      puts "Adding item: #{title} | Amount: #{amount} | Quantity: #{quantity}"
      self.total += amount * quantity
      quantity.times do
        items << title
      end
      self.last_transaction = amount * quantity
      puts "Total after adding item: #{total}"
    end
  
    def apply_discount
      puts "Applying discount: #{discount}%"
      if discount != 0
        self.total = (total * ((100.0 - discount.to_f)/100)).to_i
        puts "Discount applied. Updated total: #{total}"
        "After the discount, the total comes to $#{self.total}."
      else
        puts "No discount to apply."
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      puts "Voiding last transaction"
      self.total = self.total - self.last_transaction
      puts "Total after voiding last transaction: #{total}"
    end
  end
  