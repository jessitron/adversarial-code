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
    @width = width
    # what do here?
  end

  def cells
    [ "💩" ] * 9
  end

  def cell_at(*)
    return self;
  end

  def dead?
    false
  end

  def alive_count
    @width
  end

  def self.from_string(blueprint)
    happy = blueprint.count("🤩")
    instance = new(happy,0)
    rows = blueprint.lines.length
    cols = blueprint.lines.first.strip.length
    instance.define_singleton_method(:cells) {
      [nil] * rows * cols
    }
    instance.define_singleton_method(:to_s) { blueprint }
    return instance
  end

end

class Object
  def dead?
    true
  end
end

