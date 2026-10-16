local config = {
	[Enum.KeyCode.Up] = "VerticalPagerPrevious",
	[Enum.KeyCode.PageUp] = "VerticalPagerPrevious",
	[Enum.KeyCode.Down] = "VerticalPagerNext",
	[Enum.KeyCode.PageDown] = "VerticalPagerNext"
}
local config1 = {
	[Enum.KeyCode.DPadUp] = "VerticalPagerPrevious",
	[Enum.KeyCode.DPadDown] = "VerticalPagerNext"
}

return {
	PREVIOUS_EVENT = "VerticalPagerPrevious",
	NEXT_EVENT = "VerticalPagerNext",
	KEYBOARD_KEY_EVENTS = config,
	DPAD_KEY_EVENTS = config1,
	buildEventMap = function(p1, p2) --[[ Line: 40 ]]
		-- upvalues: config1 (copy), config (copy)
		if not p1 then
			return {}
		end
		local Copy = table.clone(config1)
		
		if p2 == "focused" then
			for i, value in config do
				Copy[i] = value
			end
		end
		return Copy
	end,
	thumbstickDirection = function(Value: number, p3) --[[ Line: 59 ]]
		return if math.abs(Value) < p3 then nil elseif p3 <= Value then "previous" else "next"
	end,
	shouldTrackDrag = function(p3, p4) --[[ Line: 77 ]]
		return not p3 or p4
	end,
	resolveWheelGesture = function(p3, p4, p5) --[[ Line: 99 ]]
		return p5 <= p3 - p4, p3
	end
}