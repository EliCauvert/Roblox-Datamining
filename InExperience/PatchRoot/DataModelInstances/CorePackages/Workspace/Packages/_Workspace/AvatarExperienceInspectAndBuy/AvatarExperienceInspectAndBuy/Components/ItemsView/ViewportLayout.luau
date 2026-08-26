local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local backButtonModule = require(avatarExperienceInspectAndBuy.Components.Common.BackButton)
local viewTypeModule = require(avatarExperienceInspectAndBuy.Enums.ViewType)
local buyActionBarLayoutModule = require(avatarExperienceInspectAndBuy.Components.ItemsView.BuyActionBarLayout)
local _ = require(avatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local _ = require(avatarExperienceInspectAndBuy.Types)

return function(p1)
	-- upvalues: viewTypeModule (ref), useTokens (ref), reactModule (ref), backButtonModule (ref), foundationModule (ref), buyActionBarLayoutModule (ref)
	local var1 = p1.view == viewTypeModule.WideLandscape
	local var2 = useTokens()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p1.Size,
		AutomaticSize = p1.AutomaticSize
	}, {
		BackButton = if var1 or not p1.backButtonProps then nil else reactModule.createElement(backButtonModule, {
			onBackButtonClick = p1.backButtonProps and p1.backButtonProps.onBackButtonClick,
			Position = if p1.backButtonProps then p1.backButtonProps.Position else UDim2.new(0, var2.Padding.Small, 0, var2.Padding.Small)
		}),
		InnerView = reactModule.createElement(foundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalFlex = if var1 then Enum.UIFlexAlignment.SpaceBetween else nil
			}),
			Thumbnail = if not p1.tryOnState.isTryOnEnabled then reactModule.createElement(foundationModule.View, {
				LayoutOrder = 1,
				Size = if p1.viewportProps then p1.viewportProps.Size else UDim2.new(0, 200, 0, 200)
			}, {
				ImageLabel = reactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Image = p1.thumbnailUrl,
					ScaleType = if p1.viewportProps then p1.viewportProps.ScaleType else Enum.ScaleType.Fit
				}),
				UIFlexItem = if var1 then reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
				UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", {
					AspectRatio = if p1.viewportProps then p1.viewportProps.AspectRatio else 1
				}),
				UIPadding = if p1.thumbnailPadding then reactModule.createElement("UIPadding", {
					PaddingLeft = p1.thumbnailPadding.left,
					PaddingRight = p1.thumbnailPadding.right,
					PaddingTop = p1.thumbnailPadding.top,
					PaddingBottom = p1.thumbnailPadding.bottom
				}) else nil
			}) else nil,
			ViewportContainer = reactModule.createElement(foundationModule.View, {
				tag = "padding-top-medium",
				LayoutOrder = 1,
				Size = if p1.viewportProps then p1.viewportProps.Size else UDim2.new(0, 200, 0, 200),
				Visible = p1.tryOnState.isTryOnEnabled
			}, {
				UIFlexItem = if var1 then reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
				UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", {
					AspectRatio = if p1.viewportProps then p1.viewportProps.AspectRatio else 1
				}),
				Viewport = p1.renderTryOnViewport(p1.tryOnState.tryOnItem)
			}),
			BuyActionBarLayout = if var1 and p1.buyActionBarProps then reactModule.createElement(buyActionBarLayoutModule, {
				enableTopBorder = true,
				Size = UDim2.new(1, 0, 0, var2.Size.Size_1900),
				buyActionBarProps = p1.buyActionBarProps,
				purchaseButtonProps = p1.buyActionBarProps.purchaseButtonProps
			}) else nil
		})
	})
end