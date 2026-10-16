local _ = require(script:FindFirstAncestor("FriendsCalling").Parent.FloatingWindow)

local function _(p1, p2: number) --[[ Line: 41 | Named "safeAreaInsets" ]]
	return {
		bottom = math.max(p1.bottom, p2),
		left = math.max(p1.left, p2),
		right = math.max(p1.right, p2),
		top = math.max(p1.top, p2)
	}
end

local function resolveExpanded(p1) --[[ Line: 62 ]]
	local DeviceInsets = p1.deviceInsets
	
	if p1.isPortrait then
		return if p1.exposesTopSafeArea then {
			hasRoundedCorners = true,
			topPadding = 0,
			boundsInsets = { bottom = 0, left = 0, right = 0, top = DeviceInsets.top },
			size = UDim2.fromScale(1, 1)
		} else {
			hasRoundedCorners = false,
			boundsInsets = { bottom = 0, left = 0, right = 0, top = 0 },
			size = UDim2.fromScale(1, 1),
			topPadding = DeviceInsets.top
		}
	else
		local Margin: number = p1.margin
		
		return {
			hasRoundedCorners = true,
			topPadding = 0,
			boundsInsets = {
				bottom = math.max(DeviceInsets.bottom, Margin),
				left = math.max(DeviceInsets.left, Margin),
				right = math.max(DeviceInsets.right, Margin),
				top = math.max(DeviceInsets.top, Margin)
			},
			size = UDim2.new(0, 416, 1, 0)
		}
	end
end

return function(p1) --[[ Line: 93 | Named "resolveGeometry" ]]
	-- upvalues: resolveExpanded (copy)
	local DeviceInsets = p1.deviceInsets
	local Margin: number = p1.margin
	
	return {
		collapsed = {
			boundsInsets = {
				bottom = math.max(DeviceInsets.bottom, Margin),
				left = math.max(DeviceInsets.left, Margin),
				right = math.max(DeviceInsets.right, Margin),
				top = math.max(DeviceInsets.top, Margin)
			}
		},
		expanded = resolveExpanded(p1)
	}
end