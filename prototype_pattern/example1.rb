# 浅拷贝 obj.clone
# 深拷贝 Marshal.load(Marshal.dump(obj))
#     Marshal.dump(obj)是把obj递归地写入字符串或文件
#     Marshal.load生成一个与原对象状态相同的对象

# 手动进行的深拷贝
class Resume
  attr_accessor :name, :sex, :age, :work_experience

  def initialize(name)
    @name = name
    @work_experience = WorkExperience.new
  end

  def set_personal_info(sex, age)
    @sex = sex
    @age = age
  end

  def set_work_experience(time_area, company)
    @work_experience.time_area = time_area
    @work_experience.company = company
  end

  def display
    puts "#{name} #{age} #{sex}"
    puts "工作经历 #{@work_experience.time_area} #{@work_experience.company}"
  end

  def self_clone
    obj = self.clone
    obj.work_experience = self.work_experience.self_clone
    return obj
  end

end

class WorkExperience
  attr_accessor :time_area, :company
  def self_clone
    self.clone
  end
end

resume1 = Resume.new('大鸟')
resume1.set_personal_info('男', '29')
resume1.set_work_experience('1998-2000', 'xx公司')

resume2 = resume1.self_clone
resume2.set_personal_info('男', '30')
resume2.set_work_experience('2000-2002', 'xx公司')

resume3 = resume1.self_clone
resume3.set_personal_info('男', '31')
resume3.set_work_experience('2002-2004', 'xx公司')

resume1.display
resume2.display
resume3.display
