require File.expand_path(File.dirname(__FILE__) + '/../eratos_module')

describe Eratos do
  before do
    Eratos.stdout_replaces_to_mock_obj
  end

  after do
    Eratos.stdout_back_to_default
  end

  specify {
    eratos = Eratos.new('30')
    eratos.answer
    expect($stdout.read).to eq "2, 3, 5, 7, 11, 13, 17, 19, 23, 29"
  }

  specify {
#pending
    eratos = Eratos.new(10)
    eratos.step1
    expect(eratos.integers).to eq [2,3,4,5,6,7,8,9,10]
  }

  specify {
#pending
    eratos = Eratos.new(11)
    eratos.step1
    expect(eratos.integers).to eq [2,3,4,5,6,7,8,9,10,11]
  }

  specify {
#pending
    eratos = Eratos.new(10)
    eratos.step1
    eratos.step2
    expect(eratos.prime_numbers).to eq [2]
    expect(eratos.integers).to eq [3,5,7,9]
  }

  specify {
#pending
    eratos = Eratos.new(11)
    eratos.step1
    eratos.step2
    expect(eratos.prime_numbers).to eq [2]
    expect(eratos.integers).to eq [3,5,7,9,11]
  }

  specify {
#pending
    eratos = Eratos.new(11)
    eratos.step1
    eratos.step2
    expect(eratos.step3?).to be_true
    eratos.step2
    expect(eratos.step3?).to be_false
  }

  specify {
#pending
    eratos = Eratos.new(11)
    eratos.step1
    eratos.step2
    eratos.step2
    eratos.step4
    expect(eratos.prime_numbers).to eq [2,3,5,7,11]
  }
end

class File
  attr_reader :read
  def puts(str)
    @read = str
  end
end


