return {
	rescaleCFramePosition = function(p0, p1) --[[ line: 1 ]]
		return p0.Rotation + p0.Position * p1
	end
}