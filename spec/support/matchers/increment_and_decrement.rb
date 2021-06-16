RSpec::Matchers.alias_matcher :increment, :change do |desc|
  desc.gsub("changed", "incremented").gsub("change", "increment")
end

RSpec::Matchers.alias_matcher :decrement, :change do |desc|
  desc.gsub("changed", "decremented").gsub("change", "decrement").gsub("-", "")
end

module IncrementAndDecrement
  def increment(&block)
    super(&block).by(1)
  end

  def decrement(&block)
    super(&block).by(-1)
  end
end

RSpec.configure do |c|
  c.include IncrementAndDecrement
end
