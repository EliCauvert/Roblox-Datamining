return {
	MIN_VISIBLE_FRACTION = 0.7,
	tileVisibilityFraction = function(p1: number, p2: number, p3: number, p4: number, p5: number): number --[[ Line: 6 ]]
		if p1 < 1 or p4 <= 0 or p3 <= 0 then
			return 0
		else
			local v1 = (p1 - 1) * (p4 + p5)
			
			return math.max(0, math.min(v1 + p4, p2 + p3) - math.max(v1, p2)) / p4
		end
	end,
	verticalVisibilityFraction = function(p1: number, p2: number, p3: number, p4: number): number --[[ Line: 25 ]]
		return if p2 <= 0 or p4 <= 0 then 0 else math.max(0, math.min(p1 + p2, p3 + p4) - math.max(p1, p3)) / p2
	end,
	isAtLeast70PercentVerticallyVisible = function(p1: number, p2: number, p3: number, p4: number): boolean --[[ Line: 40 ]]
		return (if p2 <= 0 or p4 <= 0 then 0 else math.max(0, math.min(p1 + p2, p3 + p4) - math.max(p1, p3)) / p2) >= 0.7
	end,
	isAtLeast70PercentVisible = function(p1: number, p2: number, p3: number, p4: number, p5: number): boolean --[[ Line: 49 ]]
		local LargestRatio = nil
		if p1 < 1 or p4 <= 0 or p3 <= 0 then
			LargestRatio = 0
		else
			local v1 = (p1 - 1) * (p4 + p5)
			LargestRatio = math.max(0, math.min(v1 + p4, p2 + p3) - math.max(v1, p2)) / p4
		end
		return LargestRatio >= 0.7
	end
}