require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount


def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

def valid?
  sender.valid? && receiver.valid?
end

def execute_transaction
   if @status == "pending" && @sender.valid? && @sender.balance >= @amount
     @sender.balance -= @amount
     @receiver.balance += @amount
     @status = "complete"
  else
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
 end
end

def reverse_transfer
  #binding.pry
    if @receiver.valid? && @receiver.balance >= @amount && (@status != "reversed" && @status != "pending")
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
      #binding.pry
    end
 end
end
