class Transfer
  attr_reader :sender, :receiver, :amount
  attr_writer
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  # def reject_transfer     
  #   if !sender.valid?
      
  #   end
  # end

  def execute_transaction
    if valid? && sender.balance > self.amount && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if self.status == "complete"  
      @receiver.balance -= @amount
      @sender.balance += @amount
      self.status = "reversed"
    end
  end

  
end
