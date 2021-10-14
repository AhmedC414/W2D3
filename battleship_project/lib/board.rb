require "byebug"
class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def size
    @size
  end

  def [](position)
    row, column = position
    @grid[row][column] 
  end

  def []=(position, value)
    row, column = position
    @grid[row][column] = value
  end

  def num_ships
    count = 0
    @grid.each do |subar|
        subar.each { |ele| count += 1 if ele == :S } 
    end
    count
  end

  def attack(position)
    row, column = position
    if self[position] == :S
        self[position] = :H
        puts "you sunk my battleship!"
        return true
    else
        self[position] = :X
        return false
    end
  end

  def place_random_ships
    ships = @size * 0.25
    while self.num_ships < ships
            rand_row = rand(0...@grid.length)
            rand_column = rand(0...@grid.length)
            position = [ rand_row, rand_column ]
            self[position] = :S
    end
  end

  def hidden_ships_grid
    new_grid = []
    @grid.each do |subar|
        inner_arr = []
        subar.each do |ele|
            if ele == :S
               inner_arr << :N
            else
               inner_arr << ele
            end
        end
        new_grid << inner_arr
    end
    new_grid
  end

  def self.print_grid(grid)
    grid.each do |row|
        puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end
