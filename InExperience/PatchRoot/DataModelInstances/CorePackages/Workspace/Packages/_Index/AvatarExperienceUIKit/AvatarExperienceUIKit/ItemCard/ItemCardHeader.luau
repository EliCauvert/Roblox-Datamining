local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXAddTransparencyToItemCardHeader = avatarExperienceFlagsModule.FFlagAXAddTransparencyToItemCardHeader

local function ItemCardHeader(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), fFlagAXAddTransparencyToItemCardHeader (ref)
	local var1 = useDesignTokens()
	local shimmer = var1.Color.Common.Shimmer
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = if p1.Size then p1.Size else UDim2.fromScale(1, 1),
		BackgroundColor3 = shimmer.Color3,
		BackgroundTransparency = if fFlagAXAddTransparencyToItemCardHeader then p1.BackgroundTransparency or shimmer.Transparency else shimmer.Transparency,
		LayoutOrder = p1.LayoutOrder,
		ZIndex = p1.ZIndex
	}, {
		CornerRadius = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Radius.Medium) }),
		AspectRatio = if not p1.Size then reactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = p1.aspectRatio or 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}) else nil,
		ItemCardHeaderChildren = reactModule.createElement(reactModule.Fragment, nil, p1.children),
		ItemCardHeaderOverlaySlot = p1.overlaySlot
	})
end

return if avatarExperienceFlagsModule.FFlagAXItemCardComponentsMemo then reactModule.memo(ItemCardHeader) else ItemCardHeader