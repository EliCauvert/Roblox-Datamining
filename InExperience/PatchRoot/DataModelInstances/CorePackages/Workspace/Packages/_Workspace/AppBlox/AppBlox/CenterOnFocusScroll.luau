return {
	getRevealOnlyCanvasY = function(p1, p2, Vector, p3, p4) --[[ Line: 4 ]]
		if p3 <= p1 and p1 + p2 <= p3 + p4 then
			return nil
		else
			local YDelta = Vector.Y + (p1 - p3) - (p4 - p2) / 2
			
			return if math.abs(YDelta - Vector.Y) < 1 then nil else YDelta
		end
	end
}