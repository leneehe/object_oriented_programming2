class BankAccount
  @@interest_rate = 0.02
  @@accounts = []

  def initialize
    @balance = 0
  end

#reader
  def balance
    return @balance.round(2)
  end

#writer
  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

#class method
  def self.create
    new_account = BankAccount.new
    @@accounts  << new_account
    return new_account
  end

  def self.total_funds
    total_fund = 0
    @@accounts.each { |acc|
      total_fund += acc.balance
    }
    return total_fund
  end

  def self.interest_time
    @@accounts.each { |acc|
      acc.deposit(@@interest_rate * acc.balance)
    }
    puts "Interest is collected to your accounts!"
  end

end

my_acc = BankAccount.create
puts my_acc.balance
my_acc.deposit(100.00)
my_acc.deposit(55.35)
my_acc.deposit(600.00)
puts my_acc.balance

lenas = BankAccount.create
lenas.deposit(20.00)
puts lenas.balance

puts BankAccount.total_funds
BankAccount.interest_time

puts my_acc.balance
puts lenas.balance
puts BankAccount.total_funds

my_acc.withdraw(50)
puts my_acc.balance
puts BankAccount.total_funds
