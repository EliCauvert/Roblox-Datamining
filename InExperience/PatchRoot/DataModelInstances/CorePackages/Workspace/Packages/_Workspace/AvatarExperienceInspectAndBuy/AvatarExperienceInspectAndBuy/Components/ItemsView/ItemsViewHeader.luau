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

return function(p0) --[[ line: 50 | named "ItemsViewHeader" ]]
	-- upvalues: useTokens (ref), viewTypeModule (ref), reactModule (ref), foundationModule (ref), backButtonModule (ref), subheaderLabelPriceModule (ref)
	local var6 = useTokens()
	local var7 = p0.view == viewTypeModule.WideLandscape
	local var8 = p0.view == viewTypeModule.Compact
	
	return reactModule.createElement(foundationModule.View, { Size = UDim2.new(1, 0, 0, p0.headerHeight) }, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, if var7 or var8 then var6.Padding.Medium else var6.Margin.Large * 2),
			HorizontalFlex = if not var7 then Enum.UIFlexAlignment.SpaceBetween else nil
		}),
		UIPadding = if p0.padding then reactModule.createElement("UIPadding", {
			PaddingLeft = p0.padding.left,
			PaddingRight = p0.padding.right,
			PaddingTop = p0.padding.top,
			PaddingBottom = p0.padding.bottom
		}) else nil,
		BackButton = if var7 then reactModule.createElement(backButtonModule, {
			onBackButtonClick = p0.onBackButtonClick,
			Position = UDim2.new(0, var6.Padding.Small, 0, var6.Padding.Small)
		}) else nil,
		HeaderTextAndSubheader = reactModule.createElement(foundationModule.View, {
			BackgroundTransparency = 1,
			tag = "size-0-full auto-x col align-y-center",
			LayoutOrder = 2
		}, {
			HeaderText = reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
				Text = p0.headerText
			}),
			SubheaderText = if p0.subheaderText and not var7 and not var8 then reactModule.createElement(subheaderLabelPriceModule, { LayoutOrder = 2, subheaderText = p0.subheaderText }) else nil
		}),
		BuyButton = if var7 or var8 then nil else reactModule.createElement(foundationModule.Button, {
			LayoutOrder = 3,
			size = foundationModule.Enums.InputSize.Medium,
			width = if var8 then UDim.new(0, var6.Size.Size_2100) else UDim.new(0, var6.Size.Size_3000),
			text = p0.purchaseButtonProps.purchaseButtonText,
			variant = foundationModule.Enums.ButtonVariant.Emphasis,
			isDisabled = p0.purchaseButtonProps.isDisabled,
			onActivated = p0.purchaseButtonProps.onPurchase
		})
	})
end