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





#for checking repeat choices 
has={1=>[3,1,2,4],2=>[3,1,4,2],3=>[1,3,4,2],4=>[4,2,1,3],5=>[2,4,1,3]}

arr=[2,4,1,3]

def no_repeat_guesses(list,colors)
	#returns false if the guess was already made before
	list.each do |key,val|
		return false if colors.eql?(val)
	end
	return true
end

no_repeat_guesses(has,arr)