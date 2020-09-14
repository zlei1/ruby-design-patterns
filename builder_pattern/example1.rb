class PersionBuilder
  def head
    raise "yous should override this method in subclass"
  end

  def body
    raise "yous should override this method in subclass"
  end

  def arm
    raise "yous should override this method in subclass"
  end

  def leg
    raise "yous should override this method in subclass"
  end
end

class PersionThinBuilder < PersionBuilder
  def head
    puts '头'
  end

  def body
    puts '瘦身体'
  end

  def arm
    puts '双手'
  end

  def leg
    puts '双脚'
  end
end

class PersionFatBuilder < PersionBuilder
  def head
    puts '头'
  end

  def body
    puts '胖身体'
  end

  def arm
    puts '双手'
  end

  def leg
    puts '双脚'
  end
end

class PersionDirect
  attr_accessor :persion

  def initialize(persion)
    @persion = persion
  end
   
  def create_persion
    persion.head
    persion.body
    persion.arm
    persion.leg
  end
end

puts "这是第一个小人"
p1 = PersionThinBuilder.new
pd1 = PersionDirect.new(p1)
pd1.create_persion

puts '这是第二个小人'
p2 = PersionFatBuilder.new
pd2 = PersionDirect.new(p2)
pd2.create_persion
