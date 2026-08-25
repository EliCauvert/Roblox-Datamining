local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local fFlagAXItemCardComponentsMemo = require(parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo

local function CornerSlot(p0)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = p0.AnchorPoint,
		Position = p0.Position,
		ZIndex = p0.ZIndex
	}, p0.children)
end

local function ItemCardHeaderCornersOverlay(p1)
	-- upvalues: useTokens (ref), reactModule (ref), CornerSlot (ref)
	local small = useTokens().Gap.Small
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		ItemCardHeaderTopLeftSlot = if p1.topLeftSlot then reactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromOffset(small, small),
			ZIndex = p1.ZIndex or 2
		}, p1.topLeftSlot) else nil,
		ItemCardHeaderTopRightSlot = if p1.topRightSlot then reactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -small, 0, small),
			ZIndex = p1.ZIndex or 2
		}, p1.topRightSlot) else nil,
		ItemCardHeaderBottomLeftSlot = if p1.bottomLeftSlot then reactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, small, 1, -small),
			ZIndex = p1.ZIndex or 2
		}, p1.bottomLeftSlot) else nil,
		ItemCardHeaderBottomRightSlot = if p1.bottomRightSlot then reactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -small, 1, -small),
			ZIndex = p1.ZIndex or 2
		}, p1.bottomRightSlot) else nil
	})
end

return if fFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardHeaderCornersOverlay) else ItemCardHeaderCornersOverlay