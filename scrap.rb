def player_keys
			print "Enter the keys here: "
			keys=gets.chomp
			keys=keys.split
			keys2.each do |i|
				keys.delete(i) if i!="+" || i!="O" || i!="-"
			end
			keys
end

player_keys


arr=[1,2,3,3,4,3]

arr.each do |i|
	arr.delete(i) if i==3
end

arr




	
	
	
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
			return code
end

players_code