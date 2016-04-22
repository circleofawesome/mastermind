has={1=>[1,2,3],2=>[0,2,3],3=>[0,1,3],4=>[0,1,2]}
colors=[1,2,3,4]

def rearrange(list,colors)
	shuffled=colors.shuffle
	shuffled.each do |i|
		return rearrange(has,colors) if i.index!=list[i][0] && i.index!=list[i][1] && i.index!=list[i][2]
	end
	return shuffled
end

rearrange(has,colors)

#this is where we left off; the above function does not work, check the error messages and make it work 