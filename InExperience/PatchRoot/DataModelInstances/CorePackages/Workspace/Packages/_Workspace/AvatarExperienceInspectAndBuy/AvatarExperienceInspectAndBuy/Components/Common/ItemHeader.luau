local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BackButtonModule = require(AvatarExperienceInspectAndBuy.Components.Common.BackButton)
local _ = require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local _ = require(AvatarExperienceInspectAndBuy.Types)

return function(Frame) --[[ Line: 39 | Named "ItemHeader" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), BackButtonModule (copy)
	local UseTokensResult = UseTokensFunction()
	
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
		UIListLayout = if Frame.purchaseButtonProps then ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
		}) else nil,
		InnerFrame = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy col align-y-center",
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			BackButton = if Frame.onBackButtonClick then ReactModule.createElement(BackButtonModule, {
				LayoutOrder = 1,
				onBackButtonClick = Frame.onBackButtonClick
			}) else nil,
			HeaderAndSubheader = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy col", LayoutOrder = 2 }, {
				UIPadding = if Frame.onBackButtonClick then ReactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, UseTokensResult.Padding.Large) }) else nil,
				Header = if Frame.header then Frame.header else nil,
				Subheader = if Frame.subheader then Frame.subheader else nil
			})
		}),
		BuyButton = if Frame.purchaseButtonProps then ReactModule.createElement(FoundationModule.Button, {
			LayoutOrder = 2,
			size = FoundationModule.Enums.InputSize.Medium,
			width = UDim.new(0, UseTokensResult.Size.Size_3000),
			text = Frame.purchaseButtonProps.purchaseButtonText,
			variant = Frame.purchaseButtonProps.variant,
			isDisabled = Frame.purchaseButtonProps.isDisabled,
			onActivated = Frame.purchaseButtonProps.onPurchase
		}) else nil
	})
end