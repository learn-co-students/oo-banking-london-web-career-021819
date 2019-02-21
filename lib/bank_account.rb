class BankAccount
    attr_reader :name
    attr_writer
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"

    end

    def deposit(int)
        self.balance += int
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end
    
    def valid?
        status == "open" && balance > 0
    end 

    def close_account
        self.status = "closed"
    end


end
