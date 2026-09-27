local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXItemCardComponentsMemo = avatarExperienceFlagsModule.FFlagAXItemCardComponentsMemo
local fFlagAXMarketplaceItemCardIndicatorStack = avatarExperienceFlagsModule.FFlagAXMarketplaceItemCardIndicatorStack
local fFlagAXMarketplaceLicensingItemCards = avatarExperienceFlagsModule.FFlagAXMarketplaceLicensingItemCards

local function CornerSlot(p1)
	-- upvalues: fFlagAXMarketplaceLicensingItemCards (ref), reactModule (ref)
	local var1 = if fFlagAXMarketplaceLicensingItemCards then p1.constrainedWidth else nil
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		AutomaticSize = if var1 then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
		AnchorPoint = p1.AnchorPoint,
		Position = p1.Position,
		Size = if var1 then UDim2.new(var1.Scale, var1.Offset, 0, 0) else nil,
		ClipsDescendants = var1 ~= nil,
		ZIndex = p1.ZIndex
	}, p1.children)
end

local function ItemCardHeaderCornersOverlay(p1)
	-- upvalues: useTokens (ref), fFlagAXMarketplaceItemCardIndicatorStack (ref), reactModule (ref), CornerSlot (ref)
	local small = useTokens().Gap.Small
	local var1 = if fFlagAXMarketplaceItemCardIndicatorStack then small + (p1.bottomInset or 0) else small
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		ItemCardHeaderTopLeftSlot = if p1.topLeftSlot then reactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromOffset(small, small),
			constrainedWidth = if p1.constrainTopLeftSlot then UDim.new(1, -2 * small) else nil,
			ZIndex = p1.ZIndex or 2
		}, p1.topLeftSlot) else nil,
		ItemCardHeaderTopRightSlot = if p1.topRightSlot then reactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.new(1, -small, 0, small),
			ZIndex = p1.ZIndex or 2
		}, p1.topRightSlot) else nil,
		ItemCardHeaderBottomLeftSlot = if p1.bottomLeftSlot then reactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, small, 1, -var1),
			ZIndex = p1.ZIndex or 2
		}, p1.bottomLeftSlot) else nil,
		ItemCardHeaderBottomRightSlot = if p1.bottomRightSlot then reactModule.createElement(CornerSlot, {
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -small, 1, -var1),
			ZIndex = p1.ZIndex or 2
		}, p1.bottomRightSlot) else nil
	})
end

return if fFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardHeaderCornersOverlay) else ItemCardHeaderCornersOverlay