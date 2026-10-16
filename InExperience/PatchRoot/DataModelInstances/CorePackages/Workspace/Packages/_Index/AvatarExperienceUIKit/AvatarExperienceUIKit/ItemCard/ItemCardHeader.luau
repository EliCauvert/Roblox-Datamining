local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXAddTransparencyToItemCardHeader = AvatarExperienceFlagsModule.FFlagAXAddTransparencyToItemCardHeader

local function ItemCardHeader(Frame: Frame) --[[ Line: 20 ]]
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), FFlagAXAddTransparencyToItemCardHeader (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Shimmer = UseDesignTokensResult.Color.Common.Shimmer
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = if Frame.Size then Frame.Size else UDim2.fromScale(1, 1),
		BackgroundColor3 = Shimmer.Color3,
		BackgroundTransparency = FFlagAXAddTransparencyToItemCardHeader and Frame.BackgroundTransparency or Shimmer.Transparency,
		LayoutOrder = Frame.LayoutOrder,
		ZIndex = Frame.ZIndex
	}, {
		CornerRadius = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseDesignTokensResult.Radius.Medium)
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