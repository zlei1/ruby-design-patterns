class BankAccount
  attr_accessor :balance

  def initialize(starting_balance = 0)
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class AccountProtectionProxy
  def initialize(real_subject)
    @real_subject = real_subject
  end

  def deposit(amount)
    check_access

    @real_subject.deposit(amount)
  end

  def withdraw(amount)
    check_access

    @real_subject.withdraw(amount)
  end

  def balance
    check_access

    @real_subject.balance
  end

  def check_access
    _access = true
    raise "cannot access account" unless _access
  end
end

real_subject = BankAccount.new
proxy = AccountProtectionProxy.new(real_subject)
proxy.deposit(100)
proxy.withdraw(50)
puts proxy.balance
