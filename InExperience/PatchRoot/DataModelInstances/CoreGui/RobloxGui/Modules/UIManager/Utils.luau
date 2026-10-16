return {
	rescaleCFramePosition = function(p1, p2) --[[ Line: 1 ]]
		return p1.Rotation + p1.Position * p2
	end
}