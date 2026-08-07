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

return function(p0) --[[ line: 64 | named "ViewportLayout" ]]
	-- upvalues: viewTypeModule (ref), useTokens (ref), reactModule (ref), backButtonModule (ref), foundationModule (ref), buyActionBarLayoutModule (ref)
	local var6 = p0.view == viewTypeModule.WideLandscape
	local var7 = useTokens()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = p0.Size,
		AutomaticSize = p0.AutomaticSize
	}, {
		BackButton = if var6 or not p0.backButtonProps then nil else reactModule.createElement(backButtonModule, {
			onBackButtonClick = p0.backButtonProps and p0.backButtonProps.onBackButtonClick,
			Position = if p0.backButtonProps then p0.backButtonProps.Position else UDim2.new(0, var7.Padding.Small, 0, var7.Padding.Small)
		}),
		InnerView = reactModule.createElement(foundationModule.View, { Size = UDim2.new(1, 0, 1, 0) }, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalFlex = if var6 then Enum.UIFlexAlignment.SpaceBetween else nil
			}),
			Thumbnail = if not p0.tryOnState.isTryOnEnabled then reactModule.createElement(foundationModule.View, {
				LayoutOrder = 1,
				Size = if p0.viewportProps then p0.viewportProps.Size else UDim2.new(0, 200, 0, 200)
			}, {
				ImageLabel = reactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Image = p0.thumbnailUrl,
					ScaleType = if p0.viewportProps then p0.viewportProps.ScaleType else Enum.ScaleType.Fit
				}),
				UIFlexItem = if var6 then reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
				UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", {
					AspectRatio = if p0.viewportProps then p0.viewportProps.AspectRatio else 1
				}),
				UIPadding = if p0.thumbnailPadding then reactModule.createElement("UIPadding", {
					PaddingLeft = p0.thumbnailPadding.left,
					PaddingRight = p0.thumbnailPadding.right,
					PaddingTop = p0.thumbnailPadding.top,
					PaddingBottom = p0.thumbnailPadding.bottom
				}) else nil
			}) else nil,
			ViewportContainer = reactModule.createElement(foundationModule.View, {
				tag = "padding-top-medium",
				LayoutOrder = 1,
				Size = if p0.viewportProps then p0.viewportProps.Size else UDim2.new(0, 200, 0, 200),
				Visible = p0.tryOnState.isTryOnEnabled
			}, {
				UIFlexItem = if var6 then reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
				UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", {
					AspectRatio = if p0.viewportProps then p0.viewportProps.AspectRatio else 1
				}),
				Viewport = p0.renderTryOnViewport(p0.tryOnState.tryOnItem)
			}),
			BuyActionBarLayout = if var6 and p0.buyActionBarProps then reactModule.createElement(buyActionBarLayoutModule, {
				enableTopBorder = true,
				Size = UDim2.new(1, 0, 0, var7.Size.Size_1900),
				buyActionBarProps = p0.buyActionBarProps,
				purchaseButtonProps = p0.buyActionBarProps.purchaseButtonProps
			}) else nil
		})
	})
end