class AbstractBigGun
  attr_writer :next_big_gun

  def next_big_gun(big_gun)
    @next_big_gun = big_gun

    big_gun
  end

  def handle
    return @next_big_gun.handle if @next_big_gun

    nil
  end
end

class BigGunA < AbstractBigGun
  def initialize(answer)
    @answer = answer
  end

  def handle
    if @answer == "succeed"
      puts "大牛A成功解决了这个问题"
    else
      super
    end
  end
end

class BigGunB < AbstractBigGun
  def initialize(answer)
    @answer = answer
  end

  def handle
    if @answer == "succeed"
      puts "大牛B成功解决了这个问题"
    else
      super
    end
  end
end

class BigGunC < AbstractBigGun
  def initialize(answer)
    @answer = answer
  end

  def handle
    if @answer == "succeed"
      puts "大牛C成功解决了这个问题"
    else
      super
    end
  end
end

bga = BigGunA.new("failed")
bgb = BigGunB.new("succeed") # 设置大牛b能够解决这个问题
bgc = BigGunB.new("failed")

bga.next_big_gun(bgb).next_big_gun(bgc)

bga.handle
