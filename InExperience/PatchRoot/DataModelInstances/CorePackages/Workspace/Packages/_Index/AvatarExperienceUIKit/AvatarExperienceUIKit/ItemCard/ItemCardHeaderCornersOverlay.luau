local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXMarketplaceItemCardIndicatorStack = AvatarExperienceFlagsModule.FFlagAXMarketplaceItemCardIndicatorStack
local FFlagAXMarketplaceLicensingItemCards = AvatarExperienceFlagsModule.FFlagAXMarketplaceLicensingItemCards

local function CornerSlot(Frame)
	-- upvalues: FFlagAXMarketplaceLicensingItemCards (copy), ReactModule (copy)
	local ConstrainedWidth = if FFlagAXMarketplaceLicensingItemCards then Frame.constrainedWidth else nil
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AutomaticSize = if ConstrainedWidth then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		Size = if ConstrainedWidth then UDim2.new(ConstrainedWidth.Scale, ConstrainedWidth.Offset, 0, 0) else nil,
		ClipsDescendants = ConstrainedWidth ~= nil,
		ZIndex = Frame.ZIndex
	}, Frame.children)
end

local function ItemCardHeaderCornersOverlay(p1)
	-- upvalues: UseTokensFunction (copy), FFlagAXMarketplaceItemCardIndicatorStack (copy), ReactModule (copy), CornerSlot (copy)
	local Small: number = UseTokensFunction().Gap.Small
	local NewSmall = if FFlagAXMarketplaceItemCardIndicatorStack then Small + (p1.bottomInset or 0) else Small
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		ItemCardHeaderTopLeftSlot = if p1.topLeftSlot then ReactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromOffset(Small, Small),
			constrainedWidth = if p1.constrainTopLeftSlot then UDim.new(1, -2 * Small) else nil,
			ZIndex = p1.ZIndex or 2
		}, p1.topLeftSlot) else nil,
		ItemCardHeaderTopRightSlot = if p1.topRightSlot then ReactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -Small, 0, Small),
			ZIndex = p1.ZIndex or 2
		}, p1.topRightSlot) else nil,
		ItemCardHeaderBottomLeftSlot = if p1.bottomLeftSlot then ReactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, Small, 1, -NewSmall),
			ZIndex = p1.ZIndex or 2
		}, p1.bottomLeftSlot) else nil,
		ItemCardHeaderBottomRightSlot = if p1.bottomRightSlot then ReactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -Small, 1, -NewSmall),
			ZIndex = p1.ZIndex or 2
		}, p1.bottomRightSlot) else nil
	})
end

return if AvatarExperienceFlagsModule.FFlagAXItemCardComponentsMemo then ReactModule.memo(ItemCardHeaderCornersOverlay) else ItemCardHeaderCornersOverlay