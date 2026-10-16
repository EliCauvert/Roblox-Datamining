return {
	rectangle = function(Left, Bottom) --[[ Line: 2 ]]
		return { top = Bottom, bottom = Bottom, left = Left, right = Left }
	end,
	square = function(Bottom) --[[ Line: 10 ]]
		return {
			top = Bottom,
			bottom = Bottom,
			left = Bottom,
			right = Bottom
		}
	end,
	quad = function(Top, Right, Bottom, Left) --[[ Line: 18 ]]
		return { top = Top, bottom = Bottom, left = Left, right = Right }
	end
}