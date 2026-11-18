local Edge = require(script:FindFirstAncestor("FriendsCalling").Parent.FloatingWindow).Edge
local config = {
	minimumHiddenFraction = 0.25,
	visiblePixels = 28,
	edges = { Edge.Left, Edge.Right }
}
local config1 = {
	minimumHiddenFraction = 0.25,
	visiblePixels = 28,
	edges = { Edge.Left }
}
local config2 = {
	minimumHiddenFraction = 0.25,
	visiblePixels = 28,
	edges = { Edge.Right }
}

local function _(p1, p2: number)
	return {
		bottom = math.max(p1.bottom, p2),
		left = math.max(p1.left, p2),
		right = math.max(p1.right, p2),
		top = math.max(p1.top, p2)
	}
end

local _ = function(p1, p2)
	-- upvalues: config (copy), config2 (copy), config1 (copy)
	local IsRightBelow: boolean = p2 < p1.left and p1.right < p1.left
	local IsRightAbove: boolean = p2 < p1.right and p1.right > p1.left
	
	return if IsRightBelow or IsRightAbove then if IsRightBelow then config2 else config1 else config
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
	-- upvalues: config (copy), config2 (copy), config1 (copy), resolveExpandedCard (copy)
	local DeviceBounds = p1.deviceBounds
	local EdgeMargin: number = p1.edgeMargin
	local DeviceBounds1 = p1.deviceBounds
	local EdgeMargin1 = p1.edgeMargin
	local IsRightBelow: boolean = EdgeMargin1 < DeviceBounds1.left and DeviceBounds1.right < DeviceBounds1.left
	local IsRightAbove: boolean = EdgeMargin1 < DeviceBounds1.right and DeviceBounds1.right > DeviceBounds1.left
	
	return {
		collapsed = {
			boundsInsets = {
				bottom = math.max(DeviceBounds.bottom, EdgeMargin),
				left = math.max(DeviceBounds.left, EdgeMargin),
				right = math.max(DeviceBounds.right, EdgeMargin),
				top = math.max(DeviceBounds.top, EdgeMargin)
			},
			stashOptions = if IsRightBelow or IsRightAbove then if IsRightBelow then config2 else config1 else config
		},
		expanded = resolveExpandedCard(p1)
	}
end