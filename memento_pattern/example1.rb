class Originator
  attr_writer :blood_value, :magic_value

  def initialize(blood_value, magic_value)
    @blood_value = blood_value
    @magic_value = magic_value
  end

  def perform
    puts "用户当前状态"
    puts "血量：#{@blood_value} 蓝量：#{@magic_value}"
  end

  def save
    Memento.new(@blood_value, @magic_value)
  end

  def restore(memento)
    @blood_value = memento.blood_value
    @magic_value = memento.magic_value
  end
end

class Memento
  attr_reader :blood_value, :magic_value

  def initialize(blood_value, magic_value)
    @blood_value = blood_value
    @magic_value = magic_value
  end
end

class Caretaker
  def initialize(originator)
    @mementos = []
    @originator = originator
  end

  def backup
    @mementos << @originator.save
  end

  def rollback
    return if @mementos.empty?

    memento = @mementos.pop

    @originator.restore(memento)
  end
end

puts "打怪兽前"
originator = Originator.new(100, 100)
originator.perform

puts "\n"

puts "开始存档..."
caretaker = Caretaker.new(originator)
caretaker.backup

puts "\n"

puts "第一次怪兽"
originator.blood_value = 80
originator.magic_value = 80
originator.perform

puts "\n"

puts "开始存档..."
caretaker.backup

puts "\n"

puts "第二次打怪兽"
originator.blood_value = 20
originator.magic_value = 20
originator.perform

puts "\n"

puts "第一次回滚"
caretaker.rollback
originator.perform

puts "\n"

puts "第二次回滚"
caretaker.rollback
originator.perform
