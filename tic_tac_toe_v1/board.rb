class Board
    def initialize 
        @board = Array.new(3) { Array.new(3,"_") }
    end

    def board
        @board
    end

    def [](position)
        row, column = position
        @board[row][column] 
    end

    def []=(position, value)
        row, column = position
        @board[row][column] = value
    end

    def valid?(position)
        row, column = position
        # row = position[0]
        # column = position[1]
        if row > 2 || row < 0
            puts "Invaid row"
            return false
        elsif column > 2 || column < 0
            puts "Invalid column"
            return false
        else
             return true
        end
    end

    def empty?(position)
        row, column = position
        # row = position[0]
        # column = position[1]
        if @board[row][column] == "_"
            return true
        else
            return false
        end
    end

    def place_mark(position, mark)
        # row = position[0]
        # column = position[1]
        row, column = position
        if !self.valid?(position) 
            raise "Error invalid position"
        end
        if !self.empty?(position)
            raise "Position not empty"
        end
        @board[row][column] = mark
    end

    def print
        @board.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @board.each do |row|
            return row.all? { |ele| ele == mark } 
        end
    end

    def win_col?(mark)
        @board.transpose.each do |col|
            return col.all? { |ele| ele == mark }
        end
    end

    def win_diagonal?(mark)
        left_right = (0...@board.length).all? do |i|
            row = i
            col = i
            @board[row][col] == mark
        end

        right_left = (0...@board.length).all? do |i|
            row = i
            col = @board.length - 1 - i
            @board[row][col] == mark
        end

        left_right || right_left
    end

    def win?(mark)
        # @board.win_row?(mark) || @board.win_col?(mark) || @board.win_diagonal?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @board.flatten.any? { |ele| ele == "_" }
    end

end