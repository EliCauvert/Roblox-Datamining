return {
	MIN_VISIBLE_FRACTION = 0.7,
	tileVisibilityFraction = function(p1, p2, p3, p4, p5)
		if p1 < 1 or p4 <= 0 or p3 <= 0 then
			return 0
		end
		local var1 = (p1 - 1) * (p4 + p5)
		
		return math.max(0, math.min(var1 + p4, p2 + p3) - math.max(var1, p2)) / p4
	end,
	verticalVisibilityFraction = function(p1, p2, p3, p4)
		return if p2 <= 0 or p4 <= 0 then 0 else math.max(0, math.min(p1 + p2, p3 + p4) - math.max(p1, p3)) / p2
	end,
	isAtLeast70PercentVerticallyVisible = function(p1, p2, p3, p4)
		return (if p2 <= 0 or p4 <= 0 then 0 else math.max(0, math.min(p1 + p2, p3 + p4) - math.max(p1, p3)) / p2) >= 0.7
	end,
	isAtLeast70PercentVisible = function(p1, p2, p3, p4, p5)
		local var1
		if p1 < 1 or p4 <= 0 or p3 <= 0 then
			var1 = 0
		else
			local var2 = (p1 - 1) * (p4 + p5)
			var1 = math.max(0, math.min(var2 + p4, p2 + p3) - math.max(var2, p2)) / p4
		end
		return var1 >= 0.7
	end
}