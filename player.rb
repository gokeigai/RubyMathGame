#player class

class Player

  attr_accessor :life, :points, :name

  #initialize player object
  def initialize(name)
    @life = 3
    @points = 0
    @name = name
  end

  def life
    @life
  end

  def points
    @points
  end

  def name
    @name
  end

  def lose_life
    @life -= 1
  end

  def add_score
    @points += 1  
  end

  def lost?
    @life == 0 ? true : false
  end

  def player_won
    @won = true
  end

  def print_status
    "#{@name} Life: #{@life}  Score: #{@points}"
  end

  def print_final_result
    msg = "-----------------------"
    if @won
      msg += "#{@name} Won"
    else
      msg += "#{@name} Lost"
    end
    msg += "-----------------------"
  end

end