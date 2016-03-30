class Board



	def colors(color1=" ",color2=" ",color3=" ",color4=" ")
		"[#{color1}] [#{color2}] [#{color3}] [#{color4}]"
	end

	def keys(key1="o",key2="o",key3="o",key4="o")
		"#{key1}"+"#{key2}"+"#{key3}"+"#{key4}"
	end

	def row(c1=" ",c2=" ",c3=" ",c4=" ",k1="o",k2="o",k3="o",k4="o")
		puts colors(c1,c2,c3,c4)+"   "+keys(k1,k2,k3,k4)
	end

	def empty_row
		puts colors+"   "+keys
	end

	def board
		11.times{empty_row}
		1.times{row()}
	end

end

b=Board.new
b.board
