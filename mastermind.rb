class Board

	@@prev_guesses={}
	@@move_num=1
	@@turn=1
	def row(choices)
		colors={1=>"RED",2=>"GRE",3=>"BLU",4=>"YEL",5=>"BRW",6=>"ORG",7=>"BLK",8=>"WHT"}
		choices_num=[]
		choices.each do |i|
			choices_num<<i.to_i
		end
		@@prev_guesses[@@move_num]="[ #{colors[choices_num[0]]} ][ #{colors[choices_num[1]]} ][ #{colors[choices_num[2]]} ][ #{colors[choices_num[3]]} ]"+"    "+"#{keys}"
		puts"[ #{colors[choices_num[0]]} ][ #{colors[choices_num[1]]} ][ #{colors[choices_num[2]]} ][ #{colors[choices_num[3]]} ]"+"    "+keys
	end

	def keys
		"----"
	end

	def empty_row
		puts "[     ][     ][     ][     ]"+"    "+"----"
	end

	def board(moves_left)
		moves_left.times{puts empty_row}
	end

	def prev_guesses
		puts @@prev_guesses[@@move_num-1]
		#while @@move_num<@@turn
			#puts @@prev_guesses[@@move_num]
			#@@move_num+=1
		#end
		#@@move_num=0
	end
end



class Game < Board

	@@num_of_moves=12
	def controls
		puts "1=RED   2=GRE   3=BLU   4=YEL   5=BRW   6=ORG   7=BLK   8=WHT"
	end

	def computer_selection
		box1=rand(1..8)
		box2=rand(1..8)
		box3=rand(1..8)
		box4=rand(1..8)
		computer_choices=[box1,box2,box3,box4]
	end

	def user_choices
		print "Select your first guess:"
		box1=gets.chomp
		print "Select your second guess:"
		box2=gets.chomp
		print "Select your third guess:"
		box3=gets.chomp
		print "Select your third guess:"
		box4=gets.chomp
		user_choices=[box1,box2,box3,box4]
	end

	def play
		board(@@num_of_moves)
		@@num_of_moves-=1
		computer_selection
		while @@num_of_moves>0
			choices=user_choices
			board(@@num_of_moves)
			row(choices)
			if @@turn>1
				prev_guesses
				
				@@move_num+=1
				@@turn+=1
			else
				@@turn+=1
				@@move_num+=1
			end
			@@num_of_moves-=1
		end
	end
end


g1=Game.new
puts "lets play"
g1.play

