require 'pry'

class Transfer

  attr_accessor :status, :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    (sender.valid? && receiver.valid?) ? true : false
  end

def execute_transaction
  # binding.pry
  # if sender.valid? && sender.status == "open" && receiver.status == "open"
  if @status == "pending"
    sender.balance -= amount
    receiver.balance += amount
    @status = "complete"
  end
  if !sender.valid? || !receiver.valid?
    @status ="rejected"
    "Transaction rejected. Please check your account balance."
  end
end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver. balance -= amount
      @status = "reversed"
    end
  end
end
