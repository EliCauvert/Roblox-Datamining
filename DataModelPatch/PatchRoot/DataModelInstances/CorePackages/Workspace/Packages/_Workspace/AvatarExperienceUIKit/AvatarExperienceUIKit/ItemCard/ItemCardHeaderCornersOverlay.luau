local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

local function CornerSlot(Frame)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		ZIndex = Frame.ZIndex
	}, Frame.children)
end

local function ItemCardHeaderCornersOverlay(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), CornerSlot (copy)
	local Small = UseTokensFunction().Gap.Small
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		ItemCardHeaderTopLeftSlot = if p1.topLeftSlot then ReactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromOffset(Small, Small),
			ZIndex = p1.ZIndex or 2
		}, p1.topLeftSlot) else nil,
		ItemCardHeaderTopRightSlot = if p1.topRightSlot then ReactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -Small, 0, Small),
			ZIndex = p1.ZIndex or 2
		}, p1.topRightSlot) else nil,
		ItemCardHeaderBottomLeftSlot = if p1.bottomLeftSlot then ReactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, Small, 1, -Small),
			ZIndex = p1.ZIndex or 2
		}, p1.bottomLeftSlot) else nil,
		ItemCardHeaderBottomRightSlot = if p1.bottomRightSlot then ReactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -Small, 1, -Small),
			ZIndex = p1.ZIndex or 2
		}, p1.bottomRightSlot) else nil
	})
end

return if require(Parent.AvatarExperienceFlags).FFlagAXItemCardComponentsMemo then ReactModule.memo(ItemCardHeaderCornersOverlay) else ItemCardHeaderCornersOverlay