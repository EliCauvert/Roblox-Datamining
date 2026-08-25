local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local avatarExperienceUIKitModule = require(parent.AvatarExperienceUIKit)
local itemCardThumbnail = avatarExperienceUIKitModule.ItemCardComponents.ItemCardThumbnail
local itemCardHeader = avatarExperienceUIKitModule.ItemCardComponents.ItemCardHeader
local itemCard = avatarExperienceUIKitModule.ItemCardComponents.ItemCard
local viewTypeModule = require(avatarExperienceInspectAndBuy.Enums.ViewType)
local _ = require(avatarExperienceInspectAndBuy.Types)
local getItemWidth = require(avatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getItemWidth

return function(value)
	-- upvalues: useTokens (ref), viewTypeModule (ref), reactModule (ref), itemCard (ref), getItemWidth (ref), itemCardHeader (ref), itemCardThumbnail (ref), foundationModule (ref)
	local var5 = useTokens()
	local itemData = value.itemData
	local var6 = value.view == viewTypeModule.WideLandscape
	local var7 = value.view == viewTypeModule.Compact
	local var8, var9 = reactModule.useBinding(Vector2.new(0, 0))
	local t = {}
	local var11 = if var6 or var7 then 4 else 6
	
	if itemData.assetsInBundle then
		for i, v in itemData.assetsInBundle do
			t["AssetItemCard" .. i] = reactModule.createElement(itemCard, {
				Size = var8:map(function(p0)
					-- upvalues: getItemWidth (copy), var11 (ref), var5 (ref)
					return UDim2.new(0, getItemWidth(p0.X, var11, var5.Gap.Medium), 1, 0)
				end),
				AutomaticSize = Enum.AutomaticSize.Y,
				headerSlot = reactModule.createElement(itemCardHeader, { LayoutOrder = 1 }, reactModule.createElement(itemCardThumbnail, {
					url = "rbxthumb://type=Asset&id=" .. v.id .. "&w=420&h=420"
				})),
				footerSlot = if v.name then reactModule.createElement(foundationModule.Text, {
					tag = "auto-y text-body-small content-emphasis text-truncate-split text-align-x-left size-full-0 text-wrap",
					LayoutOrder = 2,
					Text = v.name
				}) else nil
			})
		end
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-y size-full-0 col align-x-left align-y-top gap-small",
		LayoutOrder = value.LayoutOrder or 5,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p1)
			-- upvalues: var9 (ref)
			var9(p1.AbsoluteSize)
		end, {})
	}, {
		IncludedPartsLabel = reactModule.createElement(foundationModule.View, { tag = "auto-xy padding-top-xxlarge", LayoutOrder = 1 }, {
			Label = reactModule.createElement(foundationModule.Text, {
				tag = "text-title-medium text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = value.headerLabel
			})
		}),
		BundleAssets = reactModule.createElement(foundationModule.View, {
			tag = "auto-y size-full-0 padding-y-small row align-x-left align-y-top gap-medium wrap",
			LayoutOrder = 2
		}, t)
	})
end