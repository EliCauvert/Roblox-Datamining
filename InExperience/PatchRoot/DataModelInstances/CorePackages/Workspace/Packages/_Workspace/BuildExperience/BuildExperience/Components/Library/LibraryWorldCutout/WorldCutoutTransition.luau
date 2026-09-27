local t = { phase = "Home", progress = 0 }
local t_1 = { phase = "World", progress = 1 }

return {
	initialState = t,
	reduce = function(p1, p2)
		-- upvalues: t_1 (ref), t (ref)
		if p2.type == "Expand" then
			return if p1.phase == "Home" or p1.phase == "Collapsing" then { phase = "Expanding", progress = p1.progress } else p1
		elseif p2.type == "Collapse" then
			return if p1.phase == "World" or p1.phase == "Expanding" then { phase = "Collapsing", progress = p1.progress } else p1
		elseif p2.type == "Progress" then
			local clampedValue = math.clamp(p2.progress, 0, 1)
			
			return if p1.phase == "Expanding" then if clampedValue >= 1 then t_1 else { phase = "Expanding", progress = clampedValue } elseif p1.phase == "Collapsing" then if clampedValue <= 0 then t else { phase = "Collapsing", progress = clampedValue } else p1
		end
		return if p2.type == "Settle" then if p1.phase == "Expanding" then t_1 elseif p1.phase == "Collapsing" then t else p1 elseif p1.phase == "Home" then p1 else t
	end,
	isTransitioning = function(p1)
		return if p1 ~= "Expanding" then p1 == "Collapsing" else true
	end,
	getTarget = function(p1)
		return if p1 == "Expanding" or p1 == "World" then 1 else 0
	end,
	interpolateRect = function(p1, p2, p3)
		local clampedValue = math.clamp(p3, 0, 1)
		
		return Rect.new(p1.Min:Lerp(p2.Min, clampedValue), p1.Max:Lerp(p2.Max, clampedValue))
	end
}