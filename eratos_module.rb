class Eratos
  attr_reader :x
  attr_reader :prime_numbers
  attr_reader :integers

  def initialize(x)
    @x = x.to_i
  end

  def answer
    step1
    while step3?
      step2
    end
    step4
    puts prime_numbers.join(', ')
  end

  def step1
    @integers = Array.new(x-1).fill { |i| i+2 }
  end

  def step2
    @prime_numbers ||= Array.new
    prime_numbers.push integers.shift
    integers.delete_if { |i| i % prime_numbers.last == 0 }
  end

  def step3?
    integers.first * integers.first < x
  end

  def step4
    prime_numbers.concat integers
  end

  def self.stdout_replaces_to_mock_obj
    $stdout = File.new(__FILE__, 'r')
  end

  def self.stdout_back_to_default
    $stdout = STDOUT
  end
end
