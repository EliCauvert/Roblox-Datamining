local t = {
	[Enum.KeyCode.Up] = "VerticalPagerPrevious",
	[Enum.KeyCode.PageUp] = "VerticalPagerPrevious",
	[Enum.KeyCode.Down] = "VerticalPagerNext",
	[Enum.KeyCode.PageDown] = "VerticalPagerNext"
}
local t_1 = {
	[Enum.KeyCode.DPadUp] = "VerticalPagerPrevious",
	[Enum.KeyCode.DPadDown] = "VerticalPagerNext"
}

return {
	PREVIOUS_EVENT = "VerticalPagerPrevious",
	NEXT_EVENT = "VerticalPagerNext",
	KEYBOARD_KEY_EVENTS = t,
	DPAD_KEY_EVENTS = t_1,
	buildEventMap = function(p0, p1) --[[ line: 40 ]]
		-- upvalues: t_1 (ref), t (ref)
		if not p0 then
			return {}
		end
		local cloned = table.clone(t_1)
		
		if p1 == "focused" then
			for i, v in t do
				cloned[i] = v
			end
		end
		return cloned
	end,
	thumbstickDirection = function(p2, p3) --[[ line: 59 ]]
		return if math.abs(p2) < p3 then nil elseif p3 <= p2 then "previous" else "next"
	end,
	resolveWheelGesture = function(p4, p5, p6) --[[ line: 81 ]]
		return p6 <= p4 - p5, p4
	end
}