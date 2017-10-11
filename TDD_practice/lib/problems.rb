class Array

  def my_uniq
    result = []
    self.each do |el|
      result << el if !result.include?(el)
    end

    result
  end

  def two_sum
    result = []
    self[0...-1].each_index do |idx1|
      self[idx1 + 1..-1].each_index do |idx2|
          if self[idx1] + self[idx2 + idx1 + 1] == 0
            result << [idx1, idx2 + idx1 + 1]
          end
      end
    end

  result
  end

  def my_transpose
    result = Hash.new { |h, k| h[k] = [] }
    self.each do |arr|
      arr.each_index do |idx|
        result[idx] << arr[idx]
      end
    end

    result.values
  end

  def stock_picker
    start_idx = nil
    end_idx = nil
    self.each_with_index do |num, day|
      if (start_idx.nil? || num < self[start_idx])
        next if !end_idx.nil? && day > end_idx
          start_idx = day
      elsif end_idx.nil? || num > self[end_idx]
        end_idx = day
      end
    end

    [start_idx, end_idx]
  end

end

class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = [[3, 2, 1],[],[]]
  end

  def play
    until won?
      render
      p 'What tower would you like to select a disc from?'
      from_tower = gets.chomp.to_i - 1
      p 'Where would you like to move the disc to?'
      to_tower = gets.chomp.to_i - 1
      @disc = @towers[from_tower].last
      if valid_move?(from_tower, to_tower)
        move(from_tower, to_tower)
      else
        raise 'That is not a valid move! Please choose tower 1, tower 2 or tower 3'
      end
    end
  end

  def render
    p @towers
  end

  def valid_move?(from_tower, to_tower)
    if (from_tower + 1 > 0 && from_tower < @towers.length) && (to_tower + 1 > 0 && to_tower < @towers.length)
      if (@towers[from_tower] != [] && @towers[to_tower] != []) && (@disc < @towers[to_tower].last)
        return true
      elsif @towers[from_tower] != [] && @towers[to_tower] == []
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def move(from_tower, to_tower)
    @disc = @towers[from_tower].pop
    @towers[to_tower].push(@disc)
  end

  def won?
    if @towers[0] == [] && (@towers[1] == [3, 2, 1] || @towers[2] == [3, 2, 1])
      p "you've won!"
      return true
    end
  end
end
