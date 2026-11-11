local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ItemDetailsViewModule = require(AvatarExperienceInspectAndBuy.Components.ItemDetails.ItemDetailsView)
local BuyActionBarLayoutModule = require(AvatarExperienceInspectAndBuy.Components.ItemsView.BuyActionBarLayout)
local _ = require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ViewTypeModule = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local CryoModule = require(Parent.Cryo)

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), CryoModule (copy), ViewTypeModule (copy), FoundationModule (copy), ItemDetailsViewModule (copy), BuyActionBarLayoutModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Size2700 = UseTokensResult.Size.Size_2700
	local IsViewMatch = p1.view == ViewTypeModule.Compact
	
	return ReactModule.createElement(FoundationModule.View, { tag = "size-full" }, {
		ItemDetailsView = ReactModule.createElement(ItemDetailsViewModule, (ReactModule.useMemo(function()
			-- upvalues: CryoModule (upval), p1 (copy), Size2700 (copy)
			return CryoModule.Dictionary.join(p1.itemDetailsViewProps, { buyActionBarOffset = Size2700 })
		end, { p1.itemDetailsViewProps, Size2700 }))),
		BuyActionBarLayout = if IsViewMatch then ReactModule.createElement(BuyActionBarLayoutModule, {
			enableTopBorder = true,
			ZIndex = 2,
			buyActionBarProps = p1.buyActionBarProps,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			padding = UDim.new(0, UseTokensResult.Padding.Medium),
			Size = UDim2.new(1, 0, 0, Size2700)
		}) else nil
	})
end