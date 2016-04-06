class Board

	@@prev_guesses={}
	@@prev_keys={}
	@@move_num=1
	@@turn=1
	def row(choices)
		colors={1=>"RED",2=>"GRE",3=>"BLU",4=>"YEL",5=>"BRW",6=>"ORG",7=>"BLK",8=>"WHT"}
		choices_num=[]
		choices.each do |i|
			choices_num<<i.to_i
		end
		#@@prev_guesses[@@move_num]="[ #{colors[choices_num[0]]} ][ #{colors[choices_num[1]]} ][ #{colors[choices_num[2]]} ][ #{colors[choices_num[3]]} ]"+"    "+"#{keys}"
		#puts"[ #{colors[choices_num[0]]} ][ #{colors[choices_num[1]]} ][ #{colors[choices_num[2]]} ][ #{colors[choices_num[3]]} ]"+"    "+keys
		@@prev_guesses[@@move_num]="[ #{colors[choices_num[0]]} ][ #{colors[choices_num[1]]} ][ #{colors[choices_num[2]]} ][ #{colors[choices_num[3]]} ]"+"    "
	end

	def keys(user,comp)
		circles=[]
		plusses=[]
	
		user_nums=[]
		comp_nums=[]
	
		plus_count=0
	
	
		user.each_index do |i|
			circles<<"O" if user[i]==comp[i]
		end
	
		user.each do |i|
			user_nums<<i unless user_nums.include?(i)
		end
		
		comp.each do |i|
			comp_nums<<i unless comp_nums.include?(i)
		end
	
	
		user_nums.each do |i|
			user_count=user.count(i)
			comp_count=comp.count(i)
			
			if user_count>comp_count
				plus_count=comp_count
			elsif comp_count>user_count
				plus_count=user_count
			elsif user_count==comp_count
				plus_count=user_count
			else
				plus_count=0
			end
			
			plus_count.times {
				plusses<<"+"
			}
		end
	
		circles.length.times {
				plusses.pop
			}
			
		plusses.each do |i|
			circles<<i	
		end
		
		if circles==[]
			return @@prev_keys[@@move_num]="----"
		else
			return @@prev_keys[@@move_num]=circles.join('')
		end
	end

	def empty_row
		puts "[     ][     ][     ][     ]"+"    "+"----"
	end

	def board(moves_left)
		moves_left.times{puts empty_row}
	end

	def prev_keys
		prev_arr=@@prev_keys.to_a.reverse.to_h
		prev_arr.each do |k,v|
			puts v unless k==@@turn
		end
	end

	def prev_guesses
		#prevG_arr=@@prev_guesses.to_a.reverse.to_h
		#prevK_arr=@@prev_keys.to_a.reverse.to_h
		#prevG_arr.each do |k,v|  ###
		#	puts v unless k==@@turn ###
		#end  ###
		#for i in 1..prevG_arr.length-1
		#	puts prevG_arr[i] + prevK_arr[i]
		#end
		#puts @@prev_guesses
		count=@@prev_guesses.length-1
		count.times {
			puts @@prev_guesses[count]+@@prev_keys[count]
			count-=1
		}
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
		print "Select your last guess:"
		box4=gets.chomp
		user_choices=[box1,box2,box3,box4]
	end

	def play
		board(@@num_of_moves)
		@@num_of_moves-=1
		comp_sel=computer_selection
		puts comp_sel #delete this after you finish writing the program

		while @@num_of_moves>-1
			choices=user_choices
			choices.map!{|i|i.to_i}
			break if choices.eql?(comp_sel)
			board(@@num_of_moves)
			puts row(choices)+keys(choices,comp_sel)
			if @@turn>1
				prev_guesses
				@@turn+=1
			else
				@@turn+=1
			end
			@@num_of_moves-=1
			@@move_num+=1
		end
		puts "You won!" if @@num_of_moves>0
	end
end


g1=Game.new
puts "lets play"
g1.play

