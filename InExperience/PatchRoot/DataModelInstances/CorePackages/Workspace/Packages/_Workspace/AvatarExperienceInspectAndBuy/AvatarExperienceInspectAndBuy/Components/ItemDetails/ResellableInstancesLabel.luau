local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Enums = FoundationModule.Enums
local IconSize = Enums.IconSize
local _ = require(AvatarExperienceInspectAndBuy.Types)

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), Enums (copy), IconSize (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy size-full-0",
		LayoutOrder = Frame.LayoutOrder
	}, {
		UIPadding = if Frame.padding then ReactModule.createElement("UIPadding", {
			PaddingLeft = Frame.padding.left,
			PaddingRight = Frame.padding.right,
			PaddingTop = Frame.padding.top,
			PaddingBottom = Frame.padding.bottom
		}) else nil,
		Inner = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-y padding-medium size-full-0 row align-x-left align-y-center gap-small radius-medium",
			backgroundStyle = UseTokensFunction().Color.Surface.Surface_300
		}, {
			Icon = ReactModule.createElement(FoundationModule.Icon, {
				LayoutOrder = 1,
				name = Enums.IconName.ShoppingBasketCheck,
				variant = Enums.IconVariant.Filled,
				size = IconSize.Medium
			}),
			Text = ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-emphasis text-truncate-end",
				Text = Frame.ownedItemsLabel
			})
		})
	})
end