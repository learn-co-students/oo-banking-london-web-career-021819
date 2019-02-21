class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == "pending"
      if @sender.valid? && @sender.balance > @amount
        @receiver.deposit(@amount)
        @sender.deposit(-@amount)
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(-@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
