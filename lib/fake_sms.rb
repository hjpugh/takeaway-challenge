class FakeSMS
  Message = Struct.new(:from, :to, :body)

  attr_reader :messages

  def initialize
    @messages = []
  end

  def api
    self
  end

  def account
    self
  end
  
  def messages
    self
  end
end