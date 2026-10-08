local _ = require(script:FindFirstAncestor("FriendsCalling").Parent.FloatingWindow)

local function _(value, p1)
	return {
		bottom = math.max(value.bottom, p1),
		left = math.max(value.left, p1),
		right = math.max(value.right, p1),
		top = math.max(value.top, p1)
	}
end

local function resolveExpanded(p1)
	local deviceInsets = p1.deviceInsets
	
	if p1.isPortrait then
		return if p1.exposesTopSafeArea then {
			hasRoundedCorners = true,
			topPadding = 0,
			boundsInsets = { bottom = 0, left = 0, right = 0, top = deviceInsets.top },
			size = UDim2.fromScale(1, 1)
		} else {
			hasRoundedCorners = false,
			boundsInsets = { bottom = 0, left = 0, right = 0, top = 0 },
			size = UDim2.fromScale(1, 1),
			topPadding = deviceInsets.top
		}
	end
	local t = { hasRoundedCorners = true, topPadding = 0 }
	local margin = p1.margin
	t.boundsInsets = {
		bottom = math.max(deviceInsets.bottom, margin),
		left = math.max(deviceInsets.left, margin),
		right = math.max(deviceInsets.right, margin),
		top = math.max(deviceInsets.top, margin)
	}
	t.size = UDim2.new(0, 416, 1, 0)
	
	return t
end

return function(p1)
	-- upvalues: resolveExpanded (ref)
	local t = {}
	local t_1 = {}
	local deviceInsets = p1.deviceInsets
	local margin = p1.margin
	t_1.boundsInsets = {
		bottom = math.max(deviceInsets.bottom, margin),
		left = math.max(deviceInsets.left, margin),
		right = math.max(deviceInsets.right, margin),
		top = math.max(deviceInsets.top, margin)
	}
	t.collapsed = t_1
	t.expanded = resolveExpanded(p1)
	
	return t
end