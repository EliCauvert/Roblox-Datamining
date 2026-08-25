local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local itemsViewHeaderModule = require(avatarExperienceInspectAndBuy.Components.ItemsView.ItemsViewHeader)
local avatarItemsViewModule = require(avatarExperienceInspectAndBuy.Components.ItemsView.AvatarItemsView)
local buyActionBarLayoutModule = require(avatarExperienceInspectAndBuy.Components.ItemsView.BuyActionBarLayout)
local _ = require(avatarExperienceInspectAndBuy.Components.Common.SubheaderLabelPrice)
local _ = require(avatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local _ = require(avatarExperienceInspectAndBuy.Types)
local viewTypeModule = require(avatarExperienceInspectAndBuy.Enums.ViewType)
local useTokens = foundationModule.Hooks.useTokens

local var7 = function(p0, p1)
	-- upvalues: viewTypeModule (ref)
	return if p0 == viewTypeModule.Compact then {
		left = UDim.new(0, p1.Padding.Medium),
		right = UDim.new(0, p1.Padding.Medium)
	} elseif p0 == viewTypeModule.Wide then {
		top = UDim.new(0, p1.Padding.XLarge),
		left = UDim.new(0, p1.Margin.Large * 2),
		right = UDim.new(0, p1.Margin.Large * 2),
		bottom = UDim.new(0, p1.Padding.XLarge)
	} elseif p0 == viewTypeModule.WideLandscape then {
		left = UDim.new(0, p1.Padding.Small),
		right = UDim.new(0, p1.Padding.Medium),
		top = UDim.new(0, p1.Padding.XSmall)
	} else nil
end

return reactModule.forwardRef(function(p2, p3)
	-- upvalues: useTokens (ref), viewTypeModule (ref), reactModule (ref), itemsViewHeaderModule (ref), var7 (ref), avatarItemsViewModule (ref), buyActionBarLayoutModule (ref)
	local view = p2.view
	local var8 = useTokens()
	local onInspectMenuClosed = p2.onInspectMenuClosed
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		Header = reactModule.createElement(itemsViewHeaderModule, {
			view = view,
			headerHeight = var8.Size.Size_1300,
			padding = var7(view, var8),
			headerText = p2.headerText,
			subheaderText = p2.subheaderText,
			onBackButtonClick = function()
				-- upvalues: onInspectMenuClosed (ref)
				onInspectMenuClosed()
			end,
			purchaseButtonProps = p2.buyActionBarProps.purchaseButtonProps
		}),
		List = reactModule.createElement(avatarItemsViewModule, {
			items = p2.items,
			view = view,
			headerHeightOffset = var8.Size.Size_1300,
			actionBarHeightOffset = var8.Size.Size_2700,
			onItemCardActivated = p2.onItemCardActivated,
			ref = p3
		}),
		BuyActionBarLayout = if p2.view == viewTypeModule.Compact then reactModule.createElement(buyActionBarLayoutModule, {
			enableTopBorder = true,
			ZIndex = 2,
			buyActionBarProps = p2.buyActionBarProps,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			padding = UDim.new(0, var8.Padding.Medium),
			Size = UDim2.new(1, 0, 0, var8.Size.Size_2700)
		}) else nil
	})
end)