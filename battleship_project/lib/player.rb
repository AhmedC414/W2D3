class Player
    def get_move
        print 'enter a position with coordinates separated with a space like `4 7`'
        position = gets.chomp
        position_arr = position.split(" ")
        position_arr.map! { |ele| ele.to_i }
    end
end
