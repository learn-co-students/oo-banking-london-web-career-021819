#!/usr/bin/env ruby

require "pry"

require_relative "../lib/bank_account.rb"
require_relative "../lib/transfer.rb"


alex = BankAccount.new("Alex")
dan = BankAccount.new("Dan")



binding.pry

puts "done"
