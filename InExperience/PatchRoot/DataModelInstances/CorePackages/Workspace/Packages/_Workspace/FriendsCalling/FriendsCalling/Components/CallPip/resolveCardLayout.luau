local _ = require(script:FindFirstAncestor("FriendsCalling").Parent.FloatingWindow)

local function _(p1, p2: number)
	return {
		bottom = math.max(p1.bottom, p2),
		left = math.max(p1.left, p2),
		right = math.max(p1.right, p2),
		top = math.max(p1.top, p2)
	}
end

local function resolveExpandedCard(p1)
	if p1.isPortrait then
		local Top = p1.deviceBounds.top
		local TopStaysOpen = p1.topStaysOpen
		
		return {
			boundsInsets = {
				bottom = 0,
				left = 0,
				right = 0,
				top = if TopStaysOpen then Top else 0
			},
			hasRoundedCorners = TopStaysOpen,
			size = UDim2.fromScale(1, 1),
			topPadding = if TopStaysOpen then 0 else Top
		}
	else
		local DeviceBounds = p1.deviceBounds
		local EdgeMargin: number = p1.edgeMargin
		
		return {
			hasRoundedCorners = true,
			topPadding = 0,
			boundsInsets = {
				bottom = math.max(DeviceBounds.bottom, EdgeMargin),
				left = math.max(DeviceBounds.left, EdgeMargin),
				right = math.max(DeviceBounds.right, EdgeMargin),
				top = math.max(DeviceBounds.top, EdgeMargin)
			},
			size = UDim2.new(0, 416, 1, 0)
		}
	end
end

return function(p1)
	-- upvalues: resolveExpandedCard (copy)
	local DeviceBounds = p1.deviceBounds
	local EdgeMargin: number = p1.edgeMargin
	
	return {
		collapsed = {
			boundsInsets = {
				bottom = math.max(DeviceBounds.bottom, EdgeMargin),
				left = math.max(DeviceBounds.left, EdgeMargin),
				right = math.max(DeviceBounds.right, EdgeMargin),
				top = math.max(DeviceBounds.top, EdgeMargin)
			}
		},
		expanded = resolveExpandedCard(p1)
	}
end