local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local itemCardThumbnail = require(parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local _ = require(avatarExperienceInspectAndBuy.Types)
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local getItemThumbnailUrlModule = require(avatarExperienceInspectAndBuy.Utils.getItemThumbnailUrl)
local getCatalogCardItemTypeModule = require(avatarExperienceInspectAndBuy.Utils.getCatalogCardItemType)
local getPriceLineContentModule = require(avatarExperienceInspectAndBuy.Utils.getPriceLineContent)
local getPriceStatusModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(script.Parent.SelectableItemCardRowView)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), getPriceStatusModule (ref), priceStatusModule (ref), getItemThumbnailUrlModule (ref), itemCardThumbnail (ref), getCatalogCardItemTypeModule (ref), getPriceLineContentModule (ref)
	local var1 = useTokens()
	local itemData = p1.itemData
	local var2 = if p1.isSelectionEnabled then p1.itemCardWidth - (var1.Size.Size_400 + var1.Gap.Medium) else p1.itemCardWidth
	local var3 = reactModule.useMemo(function()
		-- upvalues: getPriceStatusModule (copy), itemData (ref), priceStatusModule (copy)
		return getPriceStatusModule(itemData) == priceStatusModule.Owned
	end, { itemData })
	local var4 = reactModule.useMemo(function()
		-- upvalues: itemData (ref), getItemThumbnailUrlModule (copy)
		return if itemData.id == nil or itemData.itemType == nil then nil else getItemThumbnailUrlModule({ id = itemData.id, itemType = itemData.itemType })
	end, { itemData })
	local onItemCardActivated = p1.onItemCardActivated
	local var5 = reactModule.useCallback(function()
		-- upvalues: onItemCardActivated (ref), itemData (ref)
		onItemCardActivated(itemData)
	end, { itemData, onItemCardActivated })
	local isSelected = p1.isSelected
	local onSelectionChanged = p1.onSelectionChanged
	
	return {
		cardProps = {
			LayoutOrder = 2,
			title = itemData.name,
			presentationSlot = if var4 then reactModule.createElement(itemCardThumbnail, { url = var4 }) else nil,
			itemSubType = p1.itemSubTypeLabel,
			itemType = getCatalogCardItemTypeModule(itemData.itemRestrictions),
			creator = if itemData.creator then {
				name = itemData.creator.creatorName or "",
				verified = itemData.creator.creatorHasVerifiedBadge
			} else nil,
			priceLineContent = getPriceLineContentModule(itemData, var1, p1.priceStatusLabels, p1.priceOptions),
			isOwned = var3,
			onActivated = var5,
			headerSize = UDim2.fromOffset(var2, var2),
			footerAutomaticSize = Enum.AutomaticSize.XY,
			AutomaticSize = Enum.AutomaticSize.XY
		},
		isSelectionEnabled = p1.isSelectionEnabled,
		isSelected = isSelected,
		onSelectionToggled = reactModule.useCallback(function()
			-- upvalues: onSelectionChanged (ref), itemData (ref), isSelected (ref)
			onSelectionChanged(itemData, not isSelected)
		end, { itemData, isSelected, onSelectionChanged }),
		isSelectionDisabled = p1.isSelectionDisabled,
		checkboxSize = p1.checkboxSize,
		LayoutOrder = p1.LayoutOrder
	}
end