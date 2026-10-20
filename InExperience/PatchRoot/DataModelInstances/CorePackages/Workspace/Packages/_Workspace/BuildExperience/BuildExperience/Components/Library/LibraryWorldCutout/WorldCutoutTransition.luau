local InitialState = { phase = "Home", progress = 0 }
local config = { phase = "World", progress = 1 }

return {
	initialState = InitialState,
	reduce = function(InitialState1, p1)
		-- upvalues: config (copy), InitialState (copy)
		if p1.type == "Expand" then
			return if InitialState1.phase == "Home" or InitialState1.phase == "Collapsing" then { phase = "Expanding", progress = InitialState1.progress } else InitialState1
		elseif p1.type == "Collapse" then
			return if InitialState1.phase == "World" or InitialState1.phase == "Expanding" then { phase = "Collapsing", progress = InitialState1.progress } else InitialState1
		elseif p1.type == "Progress" then
			local ClampedValue = math.clamp(p1.progress, 0, 1)
			
			return if InitialState1.phase == "Expanding" then if ClampedValue >= 1 then config else { phase = "Expanding", progress = ClampedValue } elseif InitialState1.phase == "Collapsing" then if ClampedValue <= 0 then InitialState else { phase = "Collapsing", progress = ClampedValue } else InitialState1
		else
			return if p1.type == "Settle" then if InitialState1.phase == "Expanding" then config elseif InitialState1.phase == "Collapsing" then InitialState else InitialState1 elseif InitialState1.phase == "Home" then InitialState1 else InitialState
		end
	end,
	isTransitioning = function(p1): boolean
		return p1 == "Expanding" or p1 == "Collapsing"
	end,
	getTarget = function(p1): number
		return if p1 == "Expanding" or p1 == "World" then 1 else 0
	end,
	interpolateRect = function(p1, p2, Value: number): Rect
		local ClampedValue = math.clamp(Value, 0, 1)
		
		return Rect.new(p1.Min:Lerp(p2.Min, ClampedValue), p1.Max:Lerp(p2.Max, ClampedValue))
	end
}