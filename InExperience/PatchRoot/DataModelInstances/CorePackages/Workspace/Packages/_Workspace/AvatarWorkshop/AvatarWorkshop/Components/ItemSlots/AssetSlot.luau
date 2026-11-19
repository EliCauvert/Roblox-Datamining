local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), ReactModule (copy), FoundationModule (copy), IconSize (copy), IconVariant (copy), IconName (copy)
	local UseTokensResult = UseTokensFunction()
	
	return if p1.assetId then ReactModule.createElement(FoundationModule.Image, {
		tag = "size-full-full",
		Image = GetRbxThumbFunction(ThumbnailType.Asset, p1.assetId, ThumbnailSize.Large)
	}) else ReactModule.createElement(ReactModule.Fragment, nil, {
		PlaceholderIcon = ReactModule.createElement(FoundationModule.Icon, {
			ZIndex = 1,
			name = p1.placeholderIcon,
			size = IconSize.Large,
			variant = IconVariant.Filled,
			style = UseTokensResult.Color.Shift.Shift_400,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}),
		PlusIconContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "size-500-500 radius-circle bg-surface-300",
			ZIndex = 2,
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			PlusIcon = ReactModule.createElement(FoundationModule.Icon, {
				name = IconName.PlusSmall,
				size = IconSize.Small,
				variant = IconVariant.Filled,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			})
		})
	})
end