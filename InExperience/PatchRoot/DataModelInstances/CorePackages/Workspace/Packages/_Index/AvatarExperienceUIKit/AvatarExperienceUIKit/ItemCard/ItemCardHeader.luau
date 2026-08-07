local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXAddTransparencyToItemCardHeader = avatarExperienceFlagsModule.FFlagAXAddTransparencyToItemCardHeader
local fFlagAXCatalogItemCardDarkerBackground = avatarExperienceFlagsModule.FFlagAXCatalogItemCardDarkerBackground

local function ItemCardHeader(p0) --[[ line: 21 ]]
	-- upvalues: useDesignTokens (ref), fFlagAXCatalogItemCardDarkerBackground (ref), reactModule (ref), fFlagAXAddTransparencyToItemCardHeader (ref)
	local var3 = useDesignTokens()
	local var4 = if fFlagAXCatalogItemCardDarkerBackground then var3.Color.Shift.Shift_100 else var3.Color.Common.Shimmer
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = if p0.Size then p0.Size else UDim2.fromScale(1, 1),
		BackgroundColor3 = var4.Color3,
		BackgroundTransparency = if fFlagAXAddTransparencyToItemCardHeader then p0.BackgroundTransparency or var4.Transparency else var4.Transparency,
		LayoutOrder = p0.LayoutOrder,
		ZIndex = p0.ZIndex
	}, {
		CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var3.Radius.Medium) }),
		AspectRatio = if not p0.Size then reactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = p0.aspectRatio or 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}) else nil,
		ItemCardHeaderChildren = reactModule.createElement(reactModule.Fragment, nil, p0.children),
		ItemCardHeaderOverlaySlot = p0.overlaySlot
	})
end

return if avatarExperienceFlagsModule.FFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardHeader) else ItemCardHeader