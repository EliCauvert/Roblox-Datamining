local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Enums = FoundationModule.Enums
local IconName = Enums.IconName
local IconSize = Enums.IconSize
local IconVariant = Enums.IconVariant

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy), IconName (copy), IconVariant (copy), IconSize (copy)
	return if Frame.favoritesCount == nil then ReactModule.createElement(FoundationModule.Skeleton, {
		testId = "FavoritePillSkeleton",
		Size = UDim2.fromOffset(120, 36),
		LayoutOrder = Frame.LayoutOrder
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = "row align-x-center align-y-center gap-xsmall auto-xy padding-small radius-circle bg-surface-300",
		Text = "",
		onActivated = Frame.onActivated,
		isDisabled = Frame.isDisabled,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId or "FavoritePillView"
	}, {
		Icon = ReactModule.createElement(FoundationModule.Icon, {
			LayoutOrder = 1,
			testId = "FavoritePillIcon",
			name = IconName.Star,
			variant = if Frame.isFavorited == true then IconVariant.Filled else IconVariant.Regular,
			size = IconSize.Medium
		}),
		Label = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-caption-large text-align-x-left text-truncate-none content-emphasis",
			LayoutOrder = 2,
			Text = `{Frame.formatCount(Frame.favoritesCount)} {Frame.favoritesLabel}`
		})
	})
end)