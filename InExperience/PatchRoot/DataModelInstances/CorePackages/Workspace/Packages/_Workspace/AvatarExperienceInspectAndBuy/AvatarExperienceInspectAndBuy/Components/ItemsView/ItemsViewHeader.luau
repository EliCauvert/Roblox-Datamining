local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local viewTypeModule = require(avatarExperienceInspectAndBuy.Enums.ViewType)
local backButtonModule = require(avatarExperienceInspectAndBuy.Components.Common.BackButton)
local _ = require(avatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local subheaderLabelPriceModule = require(avatarExperienceInspectAndBuy.Components.Common.SubheaderLabelPrice)
local _ = require(avatarExperienceInspectAndBuy.Types)

return function(p1)
	-- upvalues: useTokens (ref), viewTypeModule (ref), reactModule (ref), foundationModule (ref), backButtonModule (ref), subheaderLabelPriceModule (ref)
	local var1 = useTokens()
	local var2 = p1.view == viewTypeModule.WideLandscape
	local var3 = p1.view == viewTypeModule.Compact
	
	return reactModule.createElement(foundationModule.View, { Size = UDim2.new(1, 0, 0, p1.headerHeight) }, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, if var2 or var3 then var1.Padding.Medium else var1.Margin.Large * 2),
			HorizontalFlex = if not var2 then Enum.UIFlexAlignment.SpaceBetween else nil
		}),
		UIPadding = if p1.padding then reactModule.createElement("UIPadding", {
			PaddingLeft = p1.padding.left,
			PaddingRight = p1.padding.right,
			PaddingTop = p1.padding.top,
			PaddingBottom = p1.padding.bottom
		}) else nil,
		BackButton = if var2 then reactModule.createElement(backButtonModule, {
			onBackButtonClick = p1.onBackButtonClick,
			Position = UDim2.new(0, var1.Padding.Small, 0, var1.Padding.Small)
		}) else nil,
		HeaderTextAndSubheader = reactModule.createElement(foundationModule.View, {
			BackgroundTransparency = 1,
			tag = "size-0-full auto-x col align-y-center",
			LayoutOrder = 2
		}, {
			HeaderText = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
				Text = p1.headerText
			}),
			SubheaderText = if p1.subheaderText and not var2 and not var3 then reactModule.createElement(subheaderLabelPriceModule, { LayoutOrder = 2, subheaderText = p1.subheaderText }) else nil
		}),
		BuyButton = if var2 or var3 then nil else reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 3,
			size = foundationModule.Enums.InputSize.Medium,
			width = if var3 then UDim.new(0, var1.Size.Size_2100) else UDim.new(0, var1.Size.Size_3000),
			text = p1.purchaseButtonProps.purchaseButtonText,
			variant = foundationModule.Enums.ButtonVariant.Emphasis,
			isDisabled = p1.purchaseButtonProps.isDisabled,
			onActivated = p1.purchaseButtonProps.onPurchase
		})
	})
end