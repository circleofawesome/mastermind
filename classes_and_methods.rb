class Board
	def box(*color)
		return "[     ]" if color[0]==nil
		"[ #{color[0]} ]"
	end

	def keys(*key)
		return "----" if key[0]==nil
		"#{key[0]}#{key[1]}#{key[2]}#{key[3]}"
	end

	def row
		box+box+box+box+"     "+keys("o","o","+","+")
	end

	def board
		12.times{puts row}
	end
end



class Input
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
end
