return function(p1: number) --[[ Line: 26 | Named "getBorderlessBubbleChatAnimation" ]]
	if p1 < 0.5 then
		local LargestRatio = math.max(p1, 0) / 0.5
		
		return {
			yOffset = 0,
			transparency = 0,
			isComplete = false,
			scale = if LargestRatio < 0.6 then LargestRatio * 1.2 / 0.6 else 1.2 - (LargestRatio - 0.6) * 0.19999999999999996 / 0.4
		}
	elseif p1 < 2.9 then
		return {
			scale = 1,
			transparency = 0,
			isComplete = false,
			yOffset = math.sin((p1 - 0.5) * 2 * 3.141592653589793 * 1.25) * -6
		}
	else
		local Smallest = math.min((p1 - 2.9) / 0.5, 1)
		local ScaledSmallest = Smallest * Smallest
		
		return {
			scale = 1,
			yOffset = ScaledSmallest * -24,
			transparency = ScaledSmallest,
			isComplete = p1 >= 3.4
		}
	end
end