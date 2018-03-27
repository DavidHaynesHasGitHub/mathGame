class Player
  attr_reader :lives, :name

  def initialize(name)
    @lives = 3
    @name = name;
  end

  def lost_life()
    if (!self.dead?())
        @lives -+ 1
    end
    @lives
  end

  def dead?()
    if(self.lives == 0)
      return true
    end
    return false
  end
end
