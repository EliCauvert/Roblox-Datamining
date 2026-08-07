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

return function(p0, p1, _, p2, p3) --[[ line: 54 ]]
	-- upvalues: useTokens (ref), useConvertedItemDataModule (ref), itemTypeEnum (ref), bundleLocalizationKeys (ref), assetLocalizationKeys (ref), cryoModule (ref), priceStatusLocalizationKeys (ref), useLocalization (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), useItemSelectionStore (ref), useSignalState (ref), reactModule (ref), getPriceStatusModule (ref), priceStatusModule (ref), getPriceInRobux (ref), getItemThumbnailUrlModule (ref), getCatalogCardItemTypeModule (ref), catalogItemCardStatusIconTypeEnum (ref), retrievalStatus (ref), getPriceLineContentModule (ref), addUnifiedEventLogging (ref), unifiedEventLogEnums (ref), unifiedLoggingSurface (ref), sessionService (ref), itemCardThumbnail (ref), wearTimeSelectedOptionInList (ref)
	local var14 = useTokens()
	local var15, var16 = useConvertedItemDataModule(p0)
	local var17 = useLocalization(cryoModule.Dictionary.join(if p0.itemType == itemTypeEnum.Bundle then bundleLocalizationKeys else assetLocalizationKeys, priceStatusLocalizationKeys))
	local var18 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useItemSelectionStore() else nil
	local var19 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSignalState(var18.getItemData(p0.id)) else nil
	local var20 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then reactModule.useMemo(function() --[[ line: 76 ]]
		-- upvalues: getPriceStatusModule (copy), var15 (ref), priceStatusModule (copy)
		return getPriceStatusModule(var15) == priceStatusModule.Owned
	end, { var15 }) else nil
	
	if fFlagAXEnableIaBTimedOptionsBulkPurchase then
		reactModule.useEffect(function() --[[ line: 86 ]]
			-- upvalues: var15 (ref), getPriceInRobux (copy), getPriceStatusModule (copy), var18 (ref), p0 (ref)
			if var15 and var15.timedOptions then
				local cloned = table.clone(var15.timedOptions)
				table.insert(cloned, {
					days = 0,
					selected = true,
					price = getPriceInRobux(var15, getPriceStatusModule(var15)) or 0
				})
				var18.setItemData(p0.id, { timedOptions = cloned })
				
				return
			end
		end, { var15, p0.id, var18 })
	end
	local var21 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then reactModule.useCallback(function(p4, p5) --[[ line: 107 ]]
		-- upvalues: var19 (ref), var18 (ref), p0 (ref)
		if not var19 or not var19.timedOptions then return end
		local t = {}
		
		for i, v in var19.timedOptions do
			table.insert(t, {
				days = v.days,
				price = v.price,
				selected = v.price == p4 and (if p5 ~= nil then v.days == p5 else true)
			})
		end
		var18.setItemData(p0.id, { timedOptions = t })
	end, { p0.id, var19, var18 }) else nil
	local var22 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then if var19 then var19.timedOptions else nil else nil
	local var23 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then reactModule.useMemo(function() --[[ line: 134 ]]
		-- upvalues: var22 (ref)
		if not var22 then
			return nil
		end
		for i, v in var22 do
			if v.selected then
				return v.price
			end
		end
		return nil
	end, { var22 }) else nil
	
	if not var15 then
		return {}
	end
	local var24 = getItemThumbnailUrlModule(p0)
	local itemSubType = var17[var15.itemSubType]
	local var25 = getCatalogCardItemTypeModule(var15.itemRestrictions)
	local var26 = if fFlagAXEnableIaBTimedOptionsBulkPurchase and var15.timedOptions and not var20 then {
		type = "icon",
		iconType = catalogItemCardStatusIconTypeEnum.Durable
	} else nil
	local var27 = if var16 == retrievalStatus.Done then getPriceLineContentModule(var15, var14, var17) else nil
	local var28 = if var15.creator then {
		name = var15.creator.creatorName or "",
		verified = var15.creator.creatorHasVerifiedBadge
	} else nil
	local var29 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 171 ]]
		-- upvalues: addUnifiedEventLogging (copy), var29 (ref), unifiedEventLogEnums (copy), unifiedLoggingSurface (copy), p0 (ref), sessionService (copy)
		addUnifiedEventLogging(var29, {
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
			surface = unifiedLoggingSurface.IN_EXPERIENCE_INSPECT_BUY,
			elementName = "CLICK_INSPECTBUY_ITEM_" .. p0.id
		}, { sessionTagName = sessionService:GetSessionTag("level2a") })
	end, { p0.id })
	
	return {
		title = var15.name,
		presentationSlot = reactModule.createElement(itemCardThumbnail, { url = var24 }),
		itemSubType = itemSubType,
		itemType = var25,
		creator = var28,
		priceLineContent = var27,
		LayoutOrder = p1,
		Size = UDim2.fromOffset(p3, 0),
		headerSize = UDim2.fromOffset(p3, p3),
		footerAutomaticSize = Enum.AutomaticSize.XY,
		AutomaticSize = Enum.AutomaticSize.XY,
		onActivated = reactModule.useCallback(function() --[[ line: 181 ]]
			-- upvalues: p2 (ref), p0 (ref)
			p2(p0)
		end, { p2, p0 }),
		ref = var29,
		itemStatus = if fFlagAXEnableIaBTimedOptionsBulkPurchase then var26 else nil,
		isOwned = if fFlagAXEnableIaBTimedOptionsBulkPurchase then var20 else nil,
		timedOptions = if fFlagAXEnableIaBTimedOptionsBulkPurchase then var22 else nil,
		onTimedOptionPriceChanged = if fFlagAXEnableIaBTimedOptionsBulkPurchase then var21 else nil,
		selectedTimedOptionPrice = if fFlagAXEnableIaBTimedOptionsBulkPurchase then var23 else nil,
		wearTimeSelectedOptionInList = if fFlagAXEnableIaBTimedOptionsBulkPurchase then wearTimeSelectedOptionInList else nil
	}
end