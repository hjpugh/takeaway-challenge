require 'twilio-ruby'
require_relative 'dishes'
require_relative 'account_info'

class Takeaway
  include Dishes

  def initialize
    @account_sid = ACCOUNT_SID
    @auth_token = AUTH_TOKEN
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @account = @client.api.account
    @order = []
  end

  def take_order
    present_menu
    choose
    confirm_order(order_total(order))
  end

  def pull_texts
    @client.api.account.messages.list.map do |m|
       [m.from, m.body] if m.direction == 'inbound' 
    end.compact!.flatten
  end

  def p_texts
    @client.api.account.messages.list
  end

  private

  def menu
    formatted_menu
  end

  def order
    @order
  end

  def present_menu
    puts 'Choose from the menu below by entering the menu no., exit with \'0\''
    puts
    puts menu
  end

  def delivery_time
    (Time.new + 3600).to_s.split(' ')[1].split(':')[0..1].join(':')
  end

  def choose
    inp = Kernel.gets.chomp.to_i
    return @order if inp == 0
    inp <= dishes.count ? @order << inp : choose
    choose
  end

  def confirm_order(total)
    @client.messages.create(
      from: '+447449791316',
      to: MOB_NO,
      body: "Order received for £#{total}, will be with you by #{delivery_time}" 
    )
    order.clear
  end
end