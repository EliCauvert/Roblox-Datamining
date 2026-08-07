local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local enums = foundationModule.Enums
local iconSize = enums.IconSize
local _ = require(avatarExperienceInspectAndBuy.Types)

return function(p0) --[[ line: 26 | named "ResellableInstancesLabel" ]]
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), enums (ref), iconSize (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy size-full-0",
		LayoutOrder = p0.LayoutOrder
	}, {
		UIPadding = if p0.padding then reactModule.createElement("UIPadding", {
			PaddingLeft = p0.padding.left,
			PaddingRight = p0.padding.right,
			PaddingTop = p0.padding.top,
			PaddingBottom = p0.padding.bottom
		}) else nil,
		Inner = reactModule.createElement(foundationModule.View, {
			tag = "auto-y padding-medium size-full-0 row align-x-left align-y-center gap-small radius-medium",
			backgroundStyle = useTokens().Color.Surface.Surface_300
		}, {
			Icon = reactModule.createElement(foundationModule.Icon, {
				LayoutOrder = 1,
				name = enums.IconName.ShoppingBasketCheck,
				variant = enums.IconVariant.Filled,
				size = iconSize.Medium
			}),
			Text = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-emphasis text-truncate-end",
				Text = p0.ownedItemsLabel
			})
		})
	})
end