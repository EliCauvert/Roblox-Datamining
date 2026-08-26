local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local sessionService = game:GetService("SessionService")
local useTokens = require(parent.Foundation).Hooks.useTokens
local localizationModule = require(parent.Localization)
local AXCommonModule = require(parent.AXCommon)
local itemTypeEnum = AXCommonModule.Enums.ItemTypeEnum
local itemCardThumbnail = require(parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local wearTimeSelectedOptionInList = require(parent.AvatarExperienceTimedOptions).WearTimeSelectedOptionInList
local useLocalization = localizationModule.Hooks.useLocalization
local reactModule = require(parent.React)
local useConvertedItemDataModule = require(avatarExperienceInspectAndBuy.Hooks.useConvertedItemData)
local _ = require(avatarExperienceInspectAndBuy.Types)
local constantsModule = require(avatarExperienceInspectAndBuy.Constants)
local assetLocalizationKeys = constantsModule.AssetLocalizationKeys
local bundleLocalizationKeys = constantsModule.BundleLocalizationKeys
local priceStatusLocalizationKeys = constantsModule.PriceStatusLocalizationKeys
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local addUnifiedEventLogging = avatarExperienceAnalyticsModule.addUnifiedEventLogging
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local _ = require(avatarExperienceInspectAndBuy.Enums.ViewType)
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local retrievalStatus = require(parent.Http).Enum.RetrievalStatus
local getItemThumbnailUrlModule = require(avatarExperienceInspectAndBuy.Utils.getItemThumbnailUrl)
local getCatalogCardItemTypeModule = require(avatarExperienceInspectAndBuy.Utils.getCatalogCardItemType)
local getPriceLineContentModule = require(avatarExperienceInspectAndBuy.Utils.getPriceLineContent)
local getPriceInRobux = require(avatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getPriceInRobux
local getPriceStatusModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatus)
local cryoModule = require(parent.Cryo)
local useSignalState = require(parent.SignalsReact).useSignalState
local useItemSelectionStore = require(avatarExperienceInspectAndBuy.Contexts.ItemSelectionStoreContext).useItemSelectionStore
local _ = require(avatarExperienceInspectAndBuy.Stores.createItemSelectionStore)
local fFlagAXEnableIaBTimedOptionsBulkPurchase = require(parent.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase
local catalogItemCardStatusIconTypeEnum = AXCommonModule.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum

return function(p1, p2, _, p3, p4)
	-- upvalues: useTokens (ref), useConvertedItemDataModule (ref), itemTypeEnum (ref), bundleLocalizationKeys (ref), assetLocalizationKeys (ref), cryoModule (ref), priceStatusLocalizationKeys (ref), useLocalization (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), useItemSelectionStore (ref), useSignalState (ref), reactModule (ref), getPriceStatusModule (ref), priceStatusModule (ref), getPriceInRobux (ref), getItemThumbnailUrlModule (ref), getCatalogCardItemTypeModule (ref), catalogItemCardStatusIconTypeEnum (ref), retrievalStatus (ref), getPriceLineContentModule (ref), addUnifiedEventLogging (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), sessionService (ref), itemCardThumbnail (ref), wearTimeSelectedOptionInList (ref)
	local var1 = useTokens()
	local var2, var3 = useConvertedItemDataModule(p1)
	local var4 = useLocalization(cryoModule.Dictionary.join(if p1.itemType == itemTypeEnum.Bundle then bundleLocalizationKeys else assetLocalizationKeys, priceStatusLocalizationKeys))
	local var5 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useItemSelectionStore() else nil
	local var6 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSignalState(var5.getItemData(p1.id)) else nil
	local var7 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then reactModule.useMemo(function()
		-- upvalues: getPriceStatusModule (copy), var2 (ref), priceStatusModule (copy)
		return getPriceStatusModule(var2) == priceStatusModule.Owned
	end, { var2 }) else nil
	
	if fFlagAXEnableIaBTimedOptionsBulkPurchase then
		reactModule.useEffect(function()
			-- upvalues: var2 (ref), getPriceInRobux (copy), getPriceStatusModule (copy), var5 (ref), p1 (ref)
			if var2 and var2.timedOptions then
				local cloned = table.clone(var2.timedOptions)
				table.insert(cloned, {
					days = 0,
					selected = true,
					price = getPriceInRobux(var2, getPriceStatusModule(var2)) or 0
				})
				var5.setItemData(p1.id, { timedOptions = cloned })
				
				return
			end
		end, { var2, p1.id, var5 })
	end
	local var8 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then reactModule.useCallback(function(p5, p6)
		-- upvalues: var6 (ref), var5 (ref), p1 (ref)
		if not var6 or not var6.timedOptions then return end
		local t = {}
		
		for i, v in var6.timedOptions do
			table.insert(t, {
				days = v.days,
				price = v.price,
				selected = v.price == p5 and (if p6 ~= nil then v.days == p6 else true)
			})
		end
		var5.setItemData(p1.id, { timedOptions = t })
	end, { p1.id, var6, var5 }) else nil
	local var9 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then if var6 then var6.timedOptions else nil else nil
	local var10 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then reactModule.useMemo(function()
		-- upvalues: var9 (ref)
		if not var9 then
			return nil
		end
		for i, v in var9 do
			if v.selected then
				return v.price
			end
		end
		return nil
	end, { var9 }) else nil
	
	if not var2 then
		return {}
	end
	local var11 = getItemThumbnailUrlModule(p1)
	local itemSubType = var4[var2.itemSubType]
	local var12 = getCatalogCardItemTypeModule(var2.itemRestrictions)
	local var13 = if fFlagAXEnableIaBTimedOptionsBulkPurchase and var2.timedOptions and not var7 then {
		type = "icon",
		iconType = catalogItemCardStatusIconTypeEnum.Durable
	} else nil
	local var14 = if var3 == retrievalStatus.Done then getPriceLineContentModule(var2, var1, var4) else nil
	local var15 = if var2.creator then {
		name = var2.creator.creatorName or "",
		verified = var2.creator.creatorHasVerifiedBadge
	} else nil
	local var16 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: addUnifiedEventLogging (copy), var16 (ref), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), p1 (ref), sessionService (copy)
		addUnifiedEventLogging(var16, {
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.IN_EXPERIENCE_INSPECT_BUY,
			elementName = "CLICK_INSPECTBUY_ITEM_" .. p0.id
		}, { sessionTagName = sessionService:GetSessionTag("level2a") })
	end, { p1.id })
	
	return {
		title = var2.name,
		presentationSlot = reactModule.createElement(itemCardThumbnail, { url = var11 }),
		itemSubType = itemSubType,
		itemType = var12,
		creator = var15,
		priceLineContent = var14,
		LayoutOrder = p2,
		Size = UDim2.fromOffset(p4, 0),
		headerSize = UDim2.fromOffset(p4, p4),
		footerAutomaticSize = Enum.AutomaticSize.XY,
		AutomaticSize = Enum.AutomaticSize.XY,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p3 (ref), p1 (ref)
			p3(p1)
		end, { p3, p1 }),
		ref = var16,
		itemStatus = if fFlagAXEnableIaBTimedOptionsBulkPurchase then var13 else nil,
		isOwned = if fFlagAXEnableIaBTimedOptionsBulkPurchase then var7 else nil,
		timedOptions = if fFlagAXEnableIaBTimedOptionsBulkPurchase then var9 else nil,
		onTimedOptionPriceChanged = if fFlagAXEnableIaBTimedOptionsBulkPurchase then var8 else nil,
		selectedTimedOptionPrice = if fFlagAXEnableIaBTimedOptionsBulkPurchase then var10 else nil,
		wearTimeSelectedOptionInList = if fFlagAXEnableIaBTimedOptionsBulkPurchase then wearTimeSelectedOptionInList else nil
	}
end