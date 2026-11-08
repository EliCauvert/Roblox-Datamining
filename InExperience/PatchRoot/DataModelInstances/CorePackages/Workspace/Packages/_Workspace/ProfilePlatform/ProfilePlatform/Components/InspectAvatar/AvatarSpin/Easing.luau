return {
	smoothstep = function(p1, p2, p3): number
		local ClampedValue = math.clamp((p3 - p1) / (p2 - p1), 0, 1)
		
		return ClampedValue * ClampedValue * (3 - ClampedValue * 2)
	end
}