
class Transfer

attr_accessor :sender, :receiver, :status, :amount

@@all = []

 def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
  @@all << self
 end
 def valid?
  sender.valid? && receiver.valid?
 end
 def execute_transaction
  if valid? && @sender.balance > amount && @status == "pending"

   sender.balance -= amount
   receiver.balance += amount
   self.status = "complete"

   else
   self.status = "rejected"
   "Transaction rejected. Please check your account balance."
   end
 end

 def reverse_transfer
  if status == "complete"

   sender.balance += amount
   receiver.balance -= amount
   self.status = "reversed"
  else
    "Reverse rejected. No transaction found."
  end

 end
end
