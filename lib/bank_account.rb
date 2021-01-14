require 'pry'

class BankAccount
    
    attr_reader :name  
    attr_accessor :balance, :status
    
    @@account_info = []
    
    def initialize(name, balance =1000, status = "open")
        @name = name 
        @balance = balance 
        @status = status
        @@account_info << name
    end 
    #binding.pry
    def deposit(money)
    # binding.pry
        self.balance += money
    end
        
    def display_balance
        self.balance
        return "Your balance is $#{self.balance}."
    end 

    def valid?
        if self.status == "open" && self.balance > 0 
            return true
        else 
            return false
        end 
    end

    def close_account
        @status = "closed"
    end 
            
end
