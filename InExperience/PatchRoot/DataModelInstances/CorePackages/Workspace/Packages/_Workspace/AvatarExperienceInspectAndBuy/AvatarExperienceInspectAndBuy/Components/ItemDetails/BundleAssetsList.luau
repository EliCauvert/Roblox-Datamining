local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AvatarExperienceUIKitModule = require(Parent.AvatarExperienceUIKit)
local ItemCardThumbnail = AvatarExperienceUIKitModule.ItemCardComponents.ItemCardThumbnail
local ItemCardHeader = AvatarExperienceUIKitModule.ItemCardComponents.ItemCardHeader
local ItemCard = AvatarExperienceUIKitModule.ItemCardComponents.ItemCard
local ViewTypeModule = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local GetItemWidthFunction = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getItemWidth

return function(Frame) --[[ Line: 44 | Named "BundleAssetsList" ]]
	-- upvalues: UseTokensFunction (copy), ViewTypeModule (copy), ReactModule (copy), ItemCard (copy), GetItemWidthFunction (copy), ItemCardHeader (copy), ItemCardThumbnail (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local ItemData = Frame.itemData
	local IsViewMatch = Frame.view == ViewTypeModule.WideLandscape
	local IsViewMatch1 = Frame.view == ViewTypeModule.Compact
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local Elements = {}
	local v1: number = if IsViewMatch or IsViewMatch1 then 4 else 6
	
	if ItemData.assetsInBundle then
		for i, value in ItemData.assetsInBundle do
			Elements["AssetItemCard" .. i] = ReactModule.createElement(ItemCard, {
				Size = UseBindingResult:map(function(p1): UDim2 --[[ Line: 57 ]]
					-- upvalues: GetItemWidthFunction (upval), v1 (copy), UseTokensResult (copy)
					return UDim2.new(0, GetItemWidthFunction(p1.X, v1, UseTokensResult.Gap.Medium), 1, 0)
				end),
				AutomaticSize = Enum.AutomaticSize.Y,
				headerSlot = ReactModule.createElement(ItemCardHeader, { LayoutOrder = 1 }, ReactModule.createElement(ItemCardThumbnail, {
					url = "rbxthumb://type=Asset&id=" .. value.id .. "&w=420&h=420"
				})),
				footerSlot = if value.name then ReactModule.createElement(FoundationModule.Text, {
					tag = "auto-y text-body-small content-emphasis text-truncate-split text-align-x-left size-full-0 text-wrap",
					LayoutOrder = 2,
					Text = value.name
				}) else nil
			})
		end
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-y size-full-0 col align-x-left align-y-top gap-small",
		LayoutOrder = Frame.LayoutOrder or 5,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame) --[[ Line: 81 ]]
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(Frame.AbsoluteSize)
		end, {})
	}, {
		IncludedPartsLabel = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy padding-top-xxlarge", LayoutOrder = 1 }, {
			Label = ReactModule.createElement(FoundationModule.Text, {
				tag = "text-title-medium text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = Frame.headerLabel
			})
		}),
		BundleAssets = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-y size-full-0 padding-y-small row align-x-left align-y-top gap-medium wrap",
			LayoutOrder = 2
		}, Elements)
	})
end