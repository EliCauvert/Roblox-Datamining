local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local backButtonModule = require(avatarExperienceInspectAndBuy.Components.Common.BackButton)
local _ = require(avatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local _ = require(avatarExperienceInspectAndBuy.Types)

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), backButtonModule (ref)
	local var4 = useTokens()
	
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
		UIListLayout = if p0.purchaseButtonProps then reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
		}) else nil,
		InnerFrame = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy col align-y-center",
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			BackButton = if p0.onBackButtonClick then reactModule.createElement(backButtonModule, {
				LayoutOrder = 1,
				onBackButtonClick = p0.onBackButtonClick
			}) else nil,
			HeaderAndSubheader = reactModule.createElement(foundationModule.View, { tag = "auto-xy col", LayoutOrder = 2 }, {
				UIPadding = if p0.onBackButtonClick then reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var4.Padding.Large) }) else nil,
				Header = if p0.header then p0.header else nil,
				Subheader = if p0.subheader then p0.subheader else nil
			})
		}),
		BuyButton = if p0.purchaseButtonProps then reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 2,
			size = foundationModule.Enums.InputSize.Medium,
			width = UDim.new(0, var4.Size.Size_3000),
			text = p0.purchaseButtonProps.purchaseButtonText,
			variant = p0.purchaseButtonProps.variant,
			isDisabled = p0.purchaseButtonProps.isDisabled,
			onActivated = p0.purchaseButtonProps.onPurchase
		}) else nil
	})
end