class Player
 attr_accessor :name,:blood,:manna
 
  def initialize name
   @name = name
   @blood = 40
   @manna = 100
  end
  
  def gameOver
    @manna <= 0 || @blood <= 0
  end
  
  def attack
   @manna = @manna - 20
  end
  
  def defense
   @blood = @blood - 20
  end
end
