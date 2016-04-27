has={1=>[1,2,3],2=>[0,2,3],3=>[0,1,3],4=>[0,1,2]}
colors=[1,2,3,4]

def rearrange(list,colors)
	shuffled=colors.shuffle
	shuffled.each do |i|
		return rearrange(list,colors) if list[i].include?(shuffled.index(i))==false
	end
	return shuffled
end

rearrange(has,colors)

#this works; put this into where rearrange should go in mastermind.rb

def not_list_checker(list,colors)
	#returns true or false, if false then run the parent function again
	return false if list[i].include?(colors.index(i))==false
	return true
end

