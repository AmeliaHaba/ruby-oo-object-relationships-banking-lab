class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end 

    #instance methods 

    def deposit(cash)
        self.balance += cash 
        # calling self (bank account).balance 
        # and setting + & = cash deposited
    end
    
    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        # both sides should return true
            self.balance > 0  && self.status == "open"    
    end

    def close_account
        self.status = "closed"
    end 

end
