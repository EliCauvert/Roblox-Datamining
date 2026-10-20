local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local ItemCardThumbnail = require(Parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local _ = require(AvatarExperienceInspectAndBuy.Types)
local PriceStatusModule = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local GetItemThumbnailUrlModule = require(AvatarExperienceInspectAndBuy.Utils.getItemThumbnailUrl)
local GetCatalogCardItemTypeModule = require(AvatarExperienceInspectAndBuy.Utils.getCatalogCardItemType)
local GetPriceLineContentModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceLineContent)
local GetPriceStatusModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(script.Parent.SelectableItemCardRowView)

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), GetPriceStatusModule (copy), PriceStatusModule (copy), GetItemThumbnailUrlModule (copy), ItemCardThumbnail (copy), GetCatalogCardItemTypeModule (copy), GetPriceLineContentModule (copy)
	local UseTokensResult = UseTokensFunction()
	local ItemData = Frame.itemData
	local ItemCardWidthDelta = if Frame.isSelectionEnabled then Frame.itemCardWidth - (UseTokensResult.Size.Size_400 + UseTokensResult.Gap.Medium) else Frame.itemCardWidth
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ItemData (copy), GetItemThumbnailUrlModule (upval)
		return if ItemData.id == nil or ItemData.itemType == nil then nil else GetItemThumbnailUrlModule({ id = ItemData.id, itemType = ItemData.itemType })
	end, { ItemData })
	local OnItemCardActivatedFunction = Frame.onItemCardActivated
	local IsSelected = Frame.isSelected
	local OnSelectionChangedFunction = Frame.onSelectionChanged
	
	return {
		cardProps = {
			LayoutOrder = 2,
			title = ItemData.name,
			presentationSlot = if UseMemoResult then ReactModule.createElement(ItemCardThumbnail, { url = UseMemoResult }) else nil,
			itemSubType = Frame.itemSubTypeLabel,
			itemType = GetCatalogCardItemTypeModule(ItemData.itemRestrictions),
			creator = if ItemData.creator then {
				name = ItemData.creator.creatorName or "",
				verified = ItemData.creator.creatorHasVerifiedBadge
			} else nil,
			priceLineContent = GetPriceLineContentModule(ItemData, UseTokensResult, Frame.priceStatusLabels, Frame.priceOptions),
			isOwned = ReactModule.useMemo(function(): boolean
				-- upvalues: GetPriceStatusModule (upval), ItemData (copy), PriceStatusModule (upval)
				return GetPriceStatusModule(ItemData) == PriceStatusModule.Owned
			end, { ItemData }),
			onActivated = ReactModule.useCallback(function()
				-- upvalues: OnItemCardActivatedFunction (copy), ItemData (copy)
				OnItemCardActivatedFunction(ItemData)
			end, { ItemData, OnItemCardActivatedFunction }),
			headerSize = UDim2.fromOffset(ItemCardWidthDelta, ItemCardWidthDelta),
			footerAutomaticSize = Enum.AutomaticSize.XY,
			AutomaticSize = Enum.AutomaticSize.XY
		},
		isSelectionEnabled = Frame.isSelectionEnabled,
		isSelected = IsSelected,
		onSelectionToggled = ReactModule.useCallback(function()
			-- upvalues: OnSelectionChangedFunction (copy), ItemData (copy), IsSelected (copy)
			OnSelectionChangedFunction(ItemData, not IsSelected)
		end, { ItemData, IsSelected, OnSelectionChangedFunction }),
		isSelectionDisabled = Frame.isSelectionDisabled,
		checkboxSize = Frame.checkboxSize,
		LayoutOrder = Frame.LayoutOrder
	}
end