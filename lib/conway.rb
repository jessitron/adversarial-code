class Cell
  def dead?
    true
  end

  def to_s
    "☠️"
  end

  class Poop
    def dead?
      false
    end

    def to_s
      "🤩"
    end
  end

  def self.living
    return Poop.new
  end
end

class Board
  def initialize(width, hieht)

    
  end

  def cells

    "poop💩💩💩💩💩"
  end

end


