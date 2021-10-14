class HumanPlayer
    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position
        print "Enter position in the form of row and column with space Ex: 0, 2 "
        input = gets.chomp.split(" ").map { |ele| ele.to_i }
        if input.length != 2 
            raise "input too long or short"
        end
        input
    end
end