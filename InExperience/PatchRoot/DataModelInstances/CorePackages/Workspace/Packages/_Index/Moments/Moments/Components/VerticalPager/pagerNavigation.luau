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
	buildEventMap = function(p1, p2)
		-- upvalues: t_1 (ref), t (ref)
		if not p1 then
			return {}
		end
		local cloned = table.clone(t_1)
		
		if p2 == "focused" then
			for i, v in t do
				cloned[i] = v
			end
		end
		return cloned
	end,
	thumbstickDirection = function(p3, p4)
		return if math.abs(p3) < p4 then nil elseif p4 <= p3 then "previous" else "next"
	end,
	shouldTrackDrag = function(p3, p4)
		return if p3 then p4 else true
	end,
	resolveWheelGesture = function(p3, p4, p5)
		return p5 <= p3 - p4, p3
	end
}