class Group
  def initialize
    @users = []
  end

  def add(user)
    user.group = self
    @users << user
  end

  def notify(msg, msg_user)
    @users.each do |user|
      next if user.object_id == msg_user.object_id
      user.receive(msg)
    end
  end
end

class AbstractUser
  attr_accessor :group

  def initialize(group = nil)
    @group = group
  end
end

class UserA < AbstractUser
  def send(msg)
    puts "用户A向群组里面发送了一条消息：#{msg}"
    @group.notify(msg, self)
  end

  def receive(msg)
    puts "用户A从群组里面接收了一条消息：#{msg}"
  end
end

class UserB < AbstractUser
  def send(msg)
    puts "用户B向群组里面发送了一条消息：#{msg}"
    @group.notify(msg, self)
  end

  def receive(msg)
    puts "用户B从群组里面接收了一条消息：#{msg}"
  end
end

usera = UserA.new
userb = UserB.new

group = Group.new
group.add(usera)
group.add(userb)

usera.send("你好，我是张三")

puts "\n"

userb.send("你好，我是李四，很高兴见到你")
