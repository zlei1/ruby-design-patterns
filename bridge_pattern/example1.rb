class Department
  def initialize(action)
    @action = action
  end

  def do_action
    raise "yous should override this method in subclass"
  end
end

class DevelopmentDep < Department
  @@name = "开发部"

  def do_action
    @action.do_action(@@name)
  end
end

class FinanceDep < Department
  @@name = "财务部"

  def do_action
    @action.do_action(@@name)
  end
end

class MarketDep < Department
  @@name = "市场部"

  def do_action
    @action.do_action(@@name)
  end
end

class Action
  def do_action(_depart_name)
    raise "yous should override this method in subclass"
  end
end

class Meeting < Action
  def do_action(depart_name)
    puts "这是#{depart_name}部门的会议"
  end
end

class Training < Action
  def do_action(depart_name)
    puts "这是#{depart_name}部门的培训"
  end
end

# 针对开发部的培训工作
action = Training.new
depart = DevelopmentDep.new(action)
depart.do_action

# 针对市场部会议
action = Meeting.new
depart = MarketDep.new(action)
depart.do_action
