class A
  def call
    step1

    step2

    step3
  end

  def step1
    puts "step1"
  end

  def step2
    raise "yous should override this method in subclass"
  end

  def step3
    puts "step3"
  end
end

class B < A
  def step2
    puts "override step2"
  end
end

B.new.call
