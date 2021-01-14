
require 'pry'

class Transfer
  # your code here
  attr_reader :sender
  attr_accessor :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
     sender.valid? && receiver.valid? 
    # binding.pry
  end
  
  def execute_transaction
  
    if sender.balance >= amount && @status == "pending" && valid?
      receiver.deposit(amount)
      sender.deposit(amount * -1)
      @status = "complete"
      
    else sender.balance < amount 
        @status = "rejected" 
        return "Transaction rejected. Please check your account balance."
  
    end
    
    def reverse_transfer
      if @status == "complete"
        receiver.balance -= amount 
        sender.balance += amount
        @status = "reversed"
      end
    
    end

  end

 
end
