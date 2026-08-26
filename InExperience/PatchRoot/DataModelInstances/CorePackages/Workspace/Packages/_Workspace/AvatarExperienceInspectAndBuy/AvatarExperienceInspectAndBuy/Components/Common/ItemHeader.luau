local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local backButtonModule = require(avatarExperienceInspectAndBuy.Components.Common.BackButton)
local _ = require(avatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local _ = require(avatarExperienceInspectAndBuy.Types)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), backButtonModule (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy size-full-0",
		LayoutOrder = p1.LayoutOrder
	}, {
		UIPadding = if p1.padding then reactModule.createElement("UIPadding", {
			PaddingLeft = p1.padding.left,
			PaddingRight = p1.padding.right,
			PaddingTop = p1.padding.top,
			PaddingBottom = p1.padding.bottom
		}) else nil,
		UIListLayout = if p1.purchaseButtonProps then reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
		}) else nil,
		InnerFrame = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy col align-y-center",
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			BackButton = if p1.onBackButtonClick then reactModule.createElement(backButtonModule, {
				LayoutOrder = 1,
				onBackButtonClick = p1.onBackButtonClick
			}) else nil,
			HeaderAndSubheader = reactModule.createElement(foundationModule.View, { tag = "auto-xy col", LayoutOrder = 2 }, {
				UIPadding = if p1.onBackButtonClick then reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var1.Padding.Large) }) else nil,
				Header = if p1.header then p1.header else nil,
				Subheader = if p1.subheader then p1.subheader else nil
			})
		}),
		BuyButton = if p1.purchaseButtonProps then reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 2,
			size = foundationModule.Enums.InputSize.Medium,
			width = UDim.new(0, var1.Size.Size_3000),
			text = p1.purchaseButtonProps.purchaseButtonText,
			variant = p1.purchaseButtonProps.variant,
			isDisabled = p1.purchaseButtonProps.isDisabled,
			onActivated = p1.purchaseButtonProps.onPurchase
		}) else nil
	})
end