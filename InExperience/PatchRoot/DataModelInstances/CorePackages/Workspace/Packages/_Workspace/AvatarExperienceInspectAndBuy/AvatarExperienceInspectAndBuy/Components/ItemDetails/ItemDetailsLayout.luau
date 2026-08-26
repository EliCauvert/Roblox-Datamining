local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local itemDetailsViewModule = require(avatarExperienceInspectAndBuy.Components.ItemDetails.ItemDetailsView)
local buyActionBarLayoutModule = require(avatarExperienceInspectAndBuy.Components.ItemsView.BuyActionBarLayout)
local _ = require(avatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local useTokens = foundationModule.Hooks.useTokens
local viewTypeModule = require(avatarExperienceInspectAndBuy.Enums.ViewType)
local cryoModule = require(parent.Cryo)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), cryoModule (ref), viewTypeModule (ref), foundationModule (ref), itemDetailsViewModule (ref), buyActionBarLayoutModule (ref)
	local var1 = useTokens()
	local size2700 = var1.Size.Size_2700
	
	return reactModule.createElement(foundationModule.View, { tag = "size-full" }, {
		ItemDetailsView = reactModule.createElement(itemDetailsViewModule, reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), p1 (ref), size2700 (ref)
			return cryoModule.Dictionary.join(p1.itemDetailsViewProps, { buyActionBarOffset = size2700 })
		end, { p1.itemDetailsViewProps, size2700 })),
		BuyActionBarLayout = if p1.view == viewTypeModule.Compact then reactModule.createElement(buyActionBarLayoutModule, {
			enableTopBorder = true,
			ZIndex = 2,
			buyActionBarProps = p1.buyActionBarProps,
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			padding = UDim.new(0, var1.Padding.Medium),
			Size = UDim2.new(1, 0, 0, size2700)
		}) else nil
	})
end