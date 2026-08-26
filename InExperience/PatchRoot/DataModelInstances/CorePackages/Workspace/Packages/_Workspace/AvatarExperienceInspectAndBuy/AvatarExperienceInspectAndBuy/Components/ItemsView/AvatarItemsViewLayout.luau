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

local var1 = function(p1, p2)
	-- upvalues: viewTypeModule (ref)
	return if p1 == viewTypeModule.Compact then {
		left = UDim.new(0, p2.Padding.Medium),
		right = UDim.new(0, p2.Padding.Medium)
	} elseif p1 == viewTypeModule.Wide then {
		top = UDim.new(0, p2.Padding.XLarge),
		left = UDim.new(0, p2.Margin.Large * 2),
		right = UDim.new(0, p2.Margin.Large * 2),
		bottom = UDim.new(0, p2.Padding.XLarge)
	} elseif p1 == viewTypeModule.WideLandscape then {
		left = UDim.new(0, p2.Padding.Small),
		right = UDim.new(0, p2.Padding.Medium),
		top = UDim.new(0, p2.Padding.XSmall)
	} else nil
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), viewTypeModule (ref), reactModule (ref), itemsViewHeaderModule (ref), var1 (ref), avatarItemsViewModule (ref), buyActionBarLayoutModule (ref)
	local view = p1.view
	local var2 = useTokens()
	local onInspectMenuClosed = p1.onInspectMenuClosed
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		Header = reactModule.createElement(itemsViewHeaderModule, {
			view = view,
			headerHeight = var2.Size.Size_1300,
			padding = var1(view, var2),
			headerText = p1.headerText,
			subheaderText = p1.subheaderText,
			onBackButtonClick = function()
				-- upvalues: onInspectMenuClosed (ref)
				onInspectMenuClosed()
			end,
			purchaseButtonProps = p1.buyActionBarProps.purchaseButtonProps
		}),
		List = reactModule.createElement(avatarItemsViewModule, {
			items = p1.items,
			view = view,
			headerHeightOffset = var2.Size.Size_1300,
			actionBarHeightOffset = var2.Size.Size_2700,
			onItemCardActivated = p1.onItemCardActivated,
			ref = p2
		}),
		BuyActionBarLayout = if p1.view == viewTypeModule.Compact then reactModule.createElement(buyActionBarLayoutModule, {
			enableTopBorder = true,
			ZIndex = 2,
			buyActionBarProps = p1.buyActionBarProps,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			padding = UDim.new(0, var2.Padding.Medium),
			Size = UDim2.new(1, 0, 0, var2.Size.Size_2700)
		}) else nil
	})
end)