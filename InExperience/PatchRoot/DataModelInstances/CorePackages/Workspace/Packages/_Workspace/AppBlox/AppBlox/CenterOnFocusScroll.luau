return {
	getRevealOnlyCanvasY = function(p1, p2, p3, p4, p5)
		if p4 <= p1 and p1 + p2 <= p4 + p5 then
			return nil
		end
		local var1 = p3.Y + (p1 - p4) - (p5 - p2) / 2
		
		return if math.abs(var1 - p3.Y) < 1 then nil else var1
	end
}