class Board
	def colors(color1=" ",color2=" ",color3=" ",color4=" ")
		"[#{color1}] [#{color2}] [#{color3}] [#{color4}]"
	end

	def keys(key1="o",key2="o",key3="o",key4="o")
		"#{key1}"+"#{key2}"+"#{key3}"+"#{key4}"
	end

	def row
		puts colors+"   "+keys("+","+","-")
	end
end

b=Board.new
b.row