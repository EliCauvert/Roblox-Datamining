local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ViewTypeModule = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local BackButtonModule = require(AvatarExperienceInspectAndBuy.Components.Common.BackButton)
local _ = require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local SubheaderLabelPriceModule = require(AvatarExperienceInspectAndBuy.Components.Common.SubheaderLabelPrice)
local _ = require(AvatarExperienceInspectAndBuy.Types)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ViewTypeModule (copy), ReactModule (copy), FoundationModule (copy), BackButtonModule (copy), SubheaderLabelPriceModule (copy)
	local UseTokensResult = UseTokensFunction()
	local IsViewMatch = p1.view == ViewTypeModule.WideLandscape
	local IsViewMatch1 = p1.view == ViewTypeModule.Compact
	
	return ReactModule.createElement(FoundationModule.View, { Size = UDim2.new(1, 0, 0, p1.headerHeight) }, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, if IsViewMatch or IsViewMatch1 then UseTokensResult.Padding.Medium else UseTokensResult.Margin.Large * 2),
			HorizontalFlex = if IsViewMatch then nil else Enum.UIFlexAlignment.SpaceBetween
		}),
		UIPadding = if p1.padding then ReactModule.createElement("UIPadding", {
			PaddingLeft = p1.padding.left,
			PaddingRight = p1.padding.right,
			PaddingTop = p1.padding.top,
			PaddingBottom = p1.padding.bottom
		}) else nil,
		BackButton = if IsViewMatch then ReactModule.createElement(BackButtonModule, {
			onBackButtonClick = p1.onBackButtonClick,
			Position = UDim2.new(0, UseTokensResult.Padding.Small, 0, UseTokensResult.Padding.Small)
		}) else nil,
		HeaderTextAndSubheader = ReactModule.createElement(FoundationModule.View, {
			BackgroundTransparency = 1,
			tag = "size-0-full auto-x col align-y-center",
			LayoutOrder = 2
		}, {
			HeaderText = ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
				Text = p1.headerText
			}),
			SubheaderText = if p1.subheaderText and not IsViewMatch and not IsViewMatch1 then ReactModule.createElement(SubheaderLabelPriceModule, { LayoutOrder = 2, subheaderText = p1.subheaderText }) else nil
		}),
		BuyButton = if IsViewMatch or IsViewMatch1 then nil else ReactModule.createElement(FoundationModule.Button, {
			LayoutOrder = 3,
			size = FoundationModule.Enums.InputSize.Medium,
			width = if IsViewMatch1 then UDim.new(0, UseTokensResult.Size.Size_2100) else UDim.new(0, UseTokensResult.Size.Size_3000),
			text = p1.purchaseButtonProps.purchaseButtonText,
			variant = FoundationModule.Enums.ButtonVariant.Emphasis,
			isDisabled = p1.purchaseButtonProps.isDisabled,
			onActivated = p1.purchaseButtonProps.onPurchase
		})
	})
end