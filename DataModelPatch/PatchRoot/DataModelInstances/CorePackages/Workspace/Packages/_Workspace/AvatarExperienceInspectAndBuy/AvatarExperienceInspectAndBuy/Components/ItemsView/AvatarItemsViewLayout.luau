local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local ItemsViewHeaderModule = require(AvatarExperienceInspectAndBuy.Components.ItemsView.ItemsViewHeader)
local AvatarItemsViewModule = require(AvatarExperienceInspectAndBuy.Components.ItemsView.AvatarItemsView)
local BuyActionBarLayoutModule = require(AvatarExperienceInspectAndBuy.Components.ItemsView.BuyActionBarLayout)
local _ = require(AvatarExperienceInspectAndBuy.Components.Common.SubheaderLabelPrice)
local _ = require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local ViewTypeModule = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

local function v10(View, p1)
	-- upvalues: ViewTypeModule (copy)
	return if View == ViewTypeModule.Compact then {
		left = UDim.new(0, p1.Padding.Medium),
		right = UDim.new(0, p1.Padding.Medium)
	} elseif View == ViewTypeModule.Wide then {
		top = UDim.new(0, p1.Padding.XLarge),
		left = UDim.new(0, p1.Margin.Large * 2),
		right = UDim.new(0, p1.Margin.Large * 2),
		bottom = UDim.new(0, p1.Padding.XLarge)
	} elseif View == ViewTypeModule.WideLandscape then {
		left = UDim.new(0, p1.Padding.Small),
		right = UDim.new(0, p1.Padding.Medium),
		top = UDim.new(0, p1.Padding.XSmall)
	} else nil
end

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensFunction (copy), ViewTypeModule (copy), ReactModule (copy), ItemsViewHeaderModule (copy), v10 (copy), AvatarItemsViewModule (copy), BuyActionBarLayoutModule (copy)
	local View = p1.view
	local UseTokensResult = UseTokensFunction()
	local OnInspectMenuClosedFunction = p1.onInspectMenuClosed
	local IsViewMatch = p1.view == ViewTypeModule.Compact
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		Header = ReactModule.createElement(ItemsViewHeaderModule, {
			view = View,
			headerHeight = UseTokensResult.Size.Size_1300,
			padding = v10(View, UseTokensResult),
			headerText = p1.headerText,
			subheaderText = p1.subheaderText,
			onBackButtonClick = function()
				-- upvalues: OnInspectMenuClosedFunction (copy)
				OnInspectMenuClosedFunction()
			end,
			purchaseButtonProps = p1.buyActionBarProps.purchaseButtonProps
		}),
		List = ReactModule.createElement(AvatarItemsViewModule, {
			items = p1.items,
			view = View,
			headerHeightOffset = UseTokensResult.Size.Size_1300,
			actionBarHeightOffset = UseTokensResult.Size.Size_2700,
			onItemCardActivated = p1.onItemCardActivated,
			ref = Ref
		}),
		BuyActionBarLayout = if IsViewMatch then ReactModule.createElement(BuyActionBarLayoutModule, {
			enableTopBorder = true,
			ZIndex = 2,
			buyActionBarProps = p1.buyActionBarProps,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			padding = UDim.new(0, UseTokensResult.Padding.Medium),
			Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_2700)
		}) else nil
	})
end))