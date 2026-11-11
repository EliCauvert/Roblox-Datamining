local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXAddTransparencyToItemCardHeader = AvatarExperienceFlagsModule.FFlagAXAddTransparencyToItemCardHeader
local FFlagAXCatalogItemCardDarkerBackground = AvatarExperienceFlagsModule.FFlagAXCatalogItemCardDarkerBackground

local function ItemCardHeader(Frame: Frame)
	-- upvalues: UseDesignTokensFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), FFlagAXCatalogItemCardDarkerBackground (copy), ReactModule (copy), FFlagAXAddTransparencyToItemCardHeader (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Shift100 = if FFlagAXCatalogItemCardDarkerBackground then UseDesignTokensResult.Color.Shift.Shift_100 elseif FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Common.Shimmer else UseDesignTokensResult.Semantic.Color.Common.Placeholder
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = if Frame.Size then Frame.Size else UDim2.fromScale(1, 1),
		BackgroundColor3 = Shift100.Color3,
		BackgroundTransparency = FFlagAXAddTransparencyToItemCardHeader and Frame.BackgroundTransparency or Shift100.Transparency,
		LayoutOrder = Frame.LayoutOrder,
		ZIndex = Frame.ZIndex
	}, {
		CornerRadius = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Radius.Medium else UseDesignTokensResult.Semantic.Radius.Medium)
		}),
		AspectRatio = if Frame.Size then nil else ReactModule.createElement("UIAspectRatioConstraint", {
			AspectRatio = Frame.aspectRatio or 1,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}),
		ItemCardHeaderChildren = ReactModule.createElement(ReactModule.Fragment, nil, Frame.children),
		ItemCardHeaderOverlaySlot = Frame.overlaySlot
	})
end

return if AvatarExperienceFlagsModule.FFlagAXItemCardComponentsMemo then ReactModule.memo(ItemCardHeader) else ItemCardHeader