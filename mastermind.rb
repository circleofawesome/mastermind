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
			puts @@prev_guesses[count]+@@prev_keys[count] unless @@prev_keys.empty?
			puts @@prev_guesses[count] if @@prev_keys.empty?
			count-=1
		}
	end
end



class Player_Codebreaker < Board

	@@num_of_moves=12
	def controls
		2.times{puts "\n"}
		puts "1=RED   2=GRE   3=BLU   4=YEL   5=BRW   6=ORG   7=BLK   8=WHT"
		puts "These are the buttons. Enter each color separated by a space!"
	end

	def computer_selection
		box1=rand(1..8)
		box2=rand(1..8)
		box3=rand(1..8)
		box4=rand(1..8)
		computer_choices=[box1,box2,box3,box4]
	end

	def user_choices
		controls
		print "Your guesses:"
		guesses=gets.chomp
		guesses=guesses.split
		guesses.map! {|i|
			i.to_i
		}
		guesses.each do |i|
			if i==nil
				return user_choices
			elsif i<1
				return user_choices
			elsif i>8
				return user_choices
			end
		end
		return user_choices if guesses.empty?
		return user_choices if guesses.length!=4
		return guesses
	end

	def play
		puts "   -= M A S T E R M I N D =-"
		board(@@num_of_moves)
		@@num_of_moves-=1
		comp_sel=computer_selection
		#puts comp_sel #delete this after you finish writing the program

		while @@num_of_moves>-1
			choices=user_choices
			choices.map!{|i|i.to_i}
			break if choices.eql?(comp_sel)
			puts "   -= M A S T E R M I N D =-"
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
		4.times{puts "\n"}

		puts "Computer picked: "+"#{row(comp_sel)}"
		puts "You won!" if @@num_of_moves>0
		puts "You lost :(" if @@num_of_moves<=0
	end
end

class AI_Codebreaker < Board
		@@num_of_moves=12
		@@correct_colors=[]
		@@computers_selections={}
		@@not_it_list={}
		@@position_count=1
		def players_code
			puts "1=RED   2=GRE   3=BLU   4=YEL   5=BRW   6=ORG   7=BLK   8=WHT"
			print "These are the buttons. Please enter a 4 color code separated by spaces: "
			code=gets.chomp
			code=code.split
			code.map! do |i|
				i.to_i
			end
			
			code.each do |i|
				if i==nil
					return players_code
				elsif i<1
					return players_code
				elsif i>8
					return players_code
				end
			end
			return players_code if code.empty?
			return players_code if code.length!=4
			#@@secret_code=code
			return code
		end

		def player_keys
			2.times{puts "\n"}
			puts "What did I get right?"
			puts " '+'=Correct Color & Wrong Position"
			puts " 'O'=Correct Color & Correct Position"
			puts " '-'=Neither "
			print "Enter the 4 keys here: "
			keys=gets.chomp
			keys=keys.split
			keys.select!{|i|i=~/[O+-]/}
			return player_keys if keys.length!=4
			#keys
			@@prev_keys[@@move_num]=keys.join
			return keys
		end

		def comp_guess_colors
			guess=[]
			if @@guess_count==8 && @@correct_colors.length!=4
				@@correct_colors<<8
				guess=comp_guess_position(@@correct_colors)
				@@position_count+=1
				#might be an issue here with guess_count==8, the 8 might need to change
			end
			4.times{guess<<@@guess_count} if @@correct_colors.length!=4
			@@guess_count+=1

			if @@correct_colors.length==4
				guess=comp_guess_position(@@correct_colors)
				@@position_count+=1
			end
			@@computers_selections[@@move_num]=guess
			return guess
		end

		def comp_guess_position(colors)
			#returns array of guesses 
			#return colors.shuffle! if @@position_count==1

			if @@position_count==1
				colors.each do |i|
					@@not_it_list[i]=[0,1,2,3]
				end
				return colors.shuffle!
			end
			
			
			keys=@@prev_keys[@@move_num-1].split('')
			circles=keys.count("O")

			if circles==0
				guess=zero(colors)
			else
				guess=non_zero(colors)
			end
			return guess
		end

		def rearrange(list,colors)
			shuffled=colors.shuffle
			shuffled.each do |i|
				return rearrange(list,colors) if list[i].include?(shuffled.index(i))==false
			end
			return rearrange(list,colors) if no_repeat_guesses(@@computers_selections,shuffled)==false
			return shuffled
		end

		def no_repeat_guesses(list,colors)
			#returns false if the guess was already made before
			list.each do |key,val|
				return false if colors.eql?(val)
			end
			return true
		end

		def zero(colors)
			colors.each_index do |i|
				@@not_it_list[colors[i]].delete(i)
			end
			#at this point @@not_it_list contains which positions those particular colors cannot be at 
			#at this point we run the 'rearrange' method which is being worked on in scrap.rb
			return rearrange(@@not_it_list,colors)
		end

		def non_zero(colors)
			return rearrange(@@not_it_list,colors)
		end
		
		def key_reader(keys,comp_sel)
			#keys.include?("O")
			#@@correct_colors<<comp_sel[0] if keys.include?("O")
			#@@correct_colors
			return @@correct_colors if @@correct_colors.length==4
			num_Os=keys.count("O")
			num_Os.times {
				@@correct_colors<<comp_sel[0]
			}
		end

		def play
			@@guess_count=1
			puts "   -= M A S T E R M I N D =-"
			board(@@num_of_moves)
			@@num_of_moves-=1
			player_sel=players_code
			#turn_num=1
			while @@num_of_moves>=0
				puts "   -= M A S T E R M I N D =-"
				comp_sel=comp_guess_colors
				return winning_message(comp_sel) if player_sel.eql?(comp_sel)
				board(@@num_of_moves)
				@@num_of_moves-=1
				puts row(comp_sel)
				prev_guesses
				return losing_message if @@num_of_moves<0
				keys=player_keys
				key_reader(keys,comp_sel)
				@@move_num+=1
				2.times{puts "\n"}
			end
		end

		def losing_message
			3.times{
				puts "\n"
			}
			puts "You win :("
		end

		def winning_message(comp_sel)
			puts "  "+row(comp_sel)
			1.times{puts "\n"}
			puts "I guessed correctly! I win! You lose!"
		end
end


#g1=Player_Codebreaker.new
#g1.play

g2=AI_Codebreaker.new
g2.play

