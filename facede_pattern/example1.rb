class DoWork
  def self.method1
    puts "员工：打卡考勤"
  end
end

class Inspection
  def self.method1
    puts "领导视察：端茶倒水"
  end
end

class Post
  def self.method1
    puts "邮递员：登记收发物品"
  end
end

class Visit
  def self.method1
    puts "访客：登记身份证"
  end
end

class Facede
  def operate(action)
    case action.downcase
    when 'dowork'
      DoWork.method1
    when 'inspection'
      Inspection.method1
    when 'post'
      Post.method1
    when 'visit'
      Visit.method1
    else
      puts "没有对应事项，不能工作"
    end
  end
end

facede = Facede.new
# 员工上班
facede.operate('dowork')
# 领导过来视察
facede.operate('inspection')
# 向前台提交邮品
facede.operate('post')
# 向前台要求访客
facede.operate('visit')
