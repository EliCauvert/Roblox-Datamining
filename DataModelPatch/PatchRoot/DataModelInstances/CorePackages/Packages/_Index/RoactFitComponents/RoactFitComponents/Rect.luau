return {
	rectangle = function(Left, Bottom)
		return { top = Bottom, bottom = Bottom, left = Left, right = Left }
	end,
	square = function(Bottom)
		return {
			top = Bottom,
			bottom = Bottom,
			left = Bottom,
			right = Bottom
		}
	end,
	quad = function(Top, Right, Bottom, Left)
		return { top = Top, bottom = Bottom, left = Left, right = Right }
	end
}