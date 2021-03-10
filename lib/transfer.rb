class Transfer

  attr_reader :sender, :receiver, :amount
  # these will not change
  attr_accessor :status
  # this will change

  # initial methods 

 def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
 end

 def valid?
  sender.valid? && receiver.valid?
  # this uses the valid? method from our bank   account class
 end
  

 def execute_transaction
   # check status is valid, sender has money, status is pending

    if valid? && sender.balance > self.amount && status == "pending"
    # subtract amount from sender
    # add amount to the receiver
    # set status as complete 
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else
    # OTHERWISE
    # set the status to rejected 
    # give "Transaction rejected. Please check your account balance."
      self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
    end
    
 end

 def reverse_transfer
    # can reverse transfer between 2 accounts
    # can only be reversed once 
    # we want to only reverse a completed transfer

    if valid? && (sender.balance > self.amount) &&       (self.status == "complete")
        receiver.balance -= self.amount
        sender.balance += self.amount
          self.status = "reversed"
    else
        self.status = "rejected"
          return "Transaction rejected. Please check your account balance."
    end

 end


end
