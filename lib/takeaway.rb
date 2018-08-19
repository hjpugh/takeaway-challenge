require 'twilio-ruby'
require_relative 'dishes'

class Takeaway
  include Dishes

  def initialize
    @account_sid = 'ACaa769211a7f6f77e7b2ef644ee1ec9cc'
    @auth_token = '221f14fb766a760b8af3d96aa3e6ab35'
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @account = @client.api.account
    @order = []
  end

  def take_order
    present_menu
    choose
    confirm_order(order_total(order))
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
      to: '+447725610150',
      body: "Order received for £#{total}, will be with you by #{delivery_time}" 
    )
    order.clear
  end
end

ta = Takeaway.new
ta.take_order