local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BackButtonModule = require(AvatarExperienceInspectAndBuy.Components.Common.BackButton)
local ViewTypeModule = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local BuyActionBarLayoutModule = require(AvatarExperienceInspectAndBuy.Components.ItemsView.BuyActionBarLayout)
local _ = require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local _ = require(AvatarExperienceInspectAndBuy.Types)

return function(Frame)
	-- upvalues: ViewTypeModule (copy), UseTokensFunction (copy), ReactModule (copy), BackButtonModule (copy), FoundationModule (copy), BuyActionBarLayoutModule (copy)
	local IsViewMatch = Frame.view == ViewTypeModule.WideLandscape
	local OnBackButtonClick = Frame.backButtonProps and Frame.backButtonProps.onBackButtonClick
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Frame.Size,
		AutomaticSize = Frame.AutomaticSize
	}, {
		BackButton = if IsViewMatch or not Frame.backButtonProps then nil else ReactModule.createElement(BackButtonModule, {
			onBackButtonClick = OnBackButtonClick,
			Position = Frame.backButtonProps and Frame.backButtonProps.Position or UDim2.new(0, UseTokensResult.Padding.Small, 0, UseTokensResult.Padding.Small)
		}),
		InnerView = ReactModule.createElement(FoundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalFlex = if IsViewMatch then Enum.UIFlexAlignment.SpaceBetween else nil
			}),
			Thumbnail = if Frame.tryOnState.isTryOnEnabled then nil else ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 1,
				Size = Frame.viewportProps and Frame.viewportProps.Size or UDim2.new(0, 200, 0, 200)
			}, {
				ImageLabel = ReactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Image = Frame.thumbnailUrl,
					ScaleType = Frame.viewportProps and Frame.viewportProps.ScaleType or Enum.ScaleType.Fit
				}),
				UIFlexItem = if IsViewMatch then ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
				UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", {
					AspectRatio = Frame.viewportProps and Frame.viewportProps.AspectRatio or 1
				}),
				UIPadding = if Frame.thumbnailPadding then ReactModule.createElement("UIPadding", {
					PaddingLeft = Frame.thumbnailPadding.left,
					PaddingRight = Frame.thumbnailPadding.right,
					PaddingTop = Frame.thumbnailPadding.top,
					PaddingBottom = Frame.thumbnailPadding.bottom
				}) else nil
			}),
			ViewportContainer = ReactModule.createElement(FoundationModule.View, {
				tag = "padding-top-medium",
				LayoutOrder = 1,
				Size = Frame.viewportProps and Frame.viewportProps.Size or UDim2.new(0, 200, 0, 200),
				Visible = Frame.tryOnState.isTryOnEnabled
			}, {
				UIFlexItem = if IsViewMatch then ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
				UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", {
					AspectRatio = Frame.viewportProps and Frame.viewportProps.AspectRatio or 1
				}),
				Viewport = Frame.renderTryOnViewport(Frame.tryOnState.tryOnItem)
			}),
			BuyActionBarLayout = if IsViewMatch and Frame.buyActionBarProps then ReactModule.createElement(BuyActionBarLayoutModule, {
				enableTopBorder = true,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_1900),
				buyActionBarProps = Frame.buyActionBarProps,
				purchaseButtonProps = Frame.buyActionBarProps.purchaseButtonProps
			}) else nil
		})
	})
end