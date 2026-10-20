local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local SessionService = game:GetService("SessionService")
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local AXCommonModule = require(Parent.AXCommon)
local ItemTypeEnum = AXCommonModule.Enums.ItemTypeEnum
local ItemCardThumbnail = require(Parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local WearTimeSelectedOptionInList = require(Parent.AvatarExperienceTimedOptions).WearTimeSelectedOptionInList
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ReactModule = require(Parent.React)
local UseConvertedItemDataModule = require(AvatarExperienceInspectAndBuy.Hooks.useConvertedItemData)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local ConstantsModule = require(AvatarExperienceInspectAndBuy.Constants)
local AssetLocalizationKeys = ConstantsModule.AssetLocalizationKeys
local BundleLocalizationKeys = ConstantsModule.BundleLocalizationKeys
local PriceStatusLocalizationKeys = ConstantsModule.PriceStatusLocalizationKeys
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local AddUnifiedEventLoggingFunction = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local _ = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local PriceStatusModule = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local GetItemThumbnailUrlModule = require(AvatarExperienceInspectAndBuy.Utils.getItemThumbnailUrl)
local GetCatalogCardItemTypeModule = require(AvatarExperienceInspectAndBuy.Utils.getCatalogCardItemType)
local GetPriceLineContentModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceLineContent)
local GetPriceInRobuxFunction = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils).getPriceInRobux
local GetPriceStatusModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)
local CryoModule = require(Parent.Cryo)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseItemSelectionStoreFunction = require(AvatarExperienceInspectAndBuy.Contexts.ItemSelectionStoreContext).useItemSelectionStore
local _ = require(AvatarExperienceInspectAndBuy.Stores.createItemSelectionStore)
local FFlagAXEnableIaBTimedOptionsBulkPurchase = require(Parent.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase
local CatalogItemCardStatusIconTypeEnum = AXCommonModule.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum

return function(p1, LayoutOrder, _, Callback, XOffset)
	-- upvalues: UseTokensFunction (copy), UseConvertedItemDataModule (copy), ItemTypeEnum (copy), BundleLocalizationKeys (copy), AssetLocalizationKeys (copy), CryoModule (copy), PriceStatusLocalizationKeys (copy), UseLocalizationFunction (copy), FFlagAXEnableIaBTimedOptionsBulkPurchase (copy), UseItemSelectionStoreFunction (copy), UseSignalStateFunction (copy), ReactModule (copy), GetPriceStatusModule (copy), PriceStatusModule (copy), GetPriceInRobuxFunction (copy), GetItemThumbnailUrlModule (copy), GetCatalogCardItemTypeModule (copy), CatalogItemCardStatusIconTypeEnum (copy), RetrievalStatus (copy), GetPriceLineContentModule (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), UnifiedLoggingSurface (copy), SessionService (copy), ItemCardThumbnail (copy), WearTimeSelectedOptionInList (copy)
	local UseTokensResult = UseTokensFunction()
	local UseConvertedItemDataModuleResult, UseConvertedItemDataModuleResult2 = UseConvertedItemDataModule(p1)
	local UseLocalizationResult = UseLocalizationFunction((CryoModule.Dictionary.join(if p1.itemType == ItemTypeEnum.Bundle then BundleLocalizationKeys else AssetLocalizationKeys, PriceStatusLocalizationKeys)))
	local UseItemSelectionStoreResult = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseItemSelectionStoreFunction() else nil
	local UseSignalStateResult = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSignalStateFunction(UseItemSelectionStoreResult.getItemData(p1.id)) else nil
	local UseMemoResult = if FFlagAXEnableIaBTimedOptionsBulkPurchase then ReactModule.useMemo(function(): boolean
		-- upvalues: GetPriceStatusModule (upval), UseConvertedItemDataModuleResult (copy), PriceStatusModule (upval)
		return GetPriceStatusModule(UseConvertedItemDataModuleResult) == PriceStatusModule.Owned
	end, { UseConvertedItemDataModuleResult }) else nil
	
	if FFlagAXEnableIaBTimedOptionsBulkPurchase then
		ReactModule.useEffect(function()
			-- upvalues: UseConvertedItemDataModuleResult (copy), GetPriceInRobuxFunction (upval), GetPriceStatusModule (upval), UseItemSelectionStoreResult (copy), p1 (copy)
			if UseConvertedItemDataModuleResult and UseConvertedItemDataModuleResult.timedOptions then
				local Copy = table.clone(UseConvertedItemDataModuleResult.timedOptions)
				table.insert(Copy, {
					days = 0,
					selected = true,
					price = GetPriceInRobuxFunction(UseConvertedItemDataModuleResult, GetPriceStatusModule(UseConvertedItemDataModuleResult)) or 0
				})
				UseItemSelectionStoreResult.setItemData(p1.id, { timedOptions = Copy })
				
				return
			end
		end, {
			UseConvertedItemDataModuleResult,
			p1.id,
			UseItemSelectionStoreResult
		})
	end
	local UseResult = if FFlagAXEnableIaBTimedOptionsBulkPurchase then ReactModule.useCallback(function(Price, Days)
		-- upvalues: UseSignalStateResult (copy), UseItemSelectionStoreResult (copy), p1 (copy)
		if not UseSignalStateResult or not UseSignalStateResult.timedOptions then return end
		local TimedOptions = {}
		
		for _, timedOption in UseSignalStateResult.timedOptions do
			table.insert(TimedOptions, {
				days = timedOption.days,
				price = timedOption.price,
				selected = timedOption.price == Price and (Days == nil or timedOption.days == Days)
			})
		end
		UseItemSelectionStoreResult.setItemData(p1.id, { timedOptions = TimedOptions })
	end, { p1.id, UseSignalStateResult, UseItemSelectionStoreResult }) else nil
	local TimedOptions = FFlagAXEnableIaBTimedOptionsBulkPurchase and (UseSignalStateResult and UseSignalStateResult.timedOptions) or nil
	local UseMemoResult1 = if FFlagAXEnableIaBTimedOptionsBulkPurchase then ReactModule.useMemo(function()
		-- upvalues: TimedOptions (copy)
		if not TimedOptions then
			return nil
		end
		for _, timedOption in TimedOptions do
			if timedOption.selected then
				return timedOption.price
			end
		end
		return nil
	end, { TimedOptions }) else nil
	
	if UseConvertedItemDataModuleResult then
		local ItemThumbnailUrlModule = GetItemThumbnailUrlModule(p1)
		local UseLocalizationResultEntry = UseLocalizationResult[UseConvertedItemDataModuleResult.itemSubType]
		local CatalogCardItemTypeModule = GetCatalogCardItemTypeModule(UseConvertedItemDataModuleResult.itemRestrictions)
		local Config = if FFlagAXEnableIaBTimedOptionsBulkPurchase and UseConvertedItemDataModuleResult.timedOptions and not UseMemoResult then {
			type = "icon",
			iconType = CatalogItemCardStatusIconTypeEnum.Durable
		} else nil
		local PriceLineContentModule = if UseConvertedItemDataModuleResult2 == RetrievalStatus.Done then GetPriceLineContentModule(UseConvertedItemDataModuleResult, UseTokensResult, UseLocalizationResult) else nil
		local Config1 = if UseConvertedItemDataModuleResult.creator then {
			name = UseConvertedItemDataModuleResult.creator.creatorName or "",
			verified = UseConvertedItemDataModuleResult.creator.creatorHasVerifiedBadge
		} else nil
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: AddUnifiedEventLoggingFunction (upval), UseRefResult (copy), UnifiedEventLogEnums (upval), UnifiedLoggingSurface (upval), p1 (copy), SessionService (upval)
			AddUnifiedEventLoggingFunction(UseRefResult, {
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				surface = UnifiedLoggingSurface.IN_EXPERIENCE_INSPECT_BUY,
				elementName = "CLICK_INSPECTBUY_ITEM_" .. p1.id
			}, { sessionTagName = SessionService:GetSessionTag("level2a") })
		end, { p1.id })
		
		return {
			title = UseConvertedItemDataModuleResult.name,
			presentationSlot = ReactModule.createElement(ItemCardThumbnail, { url = ItemThumbnailUrlModule }),
			itemSubType = UseLocalizationResultEntry,
			itemType = CatalogCardItemTypeModule,
			creator = Config1,
			priceLineContent = PriceLineContentModule,
			LayoutOrder = LayoutOrder,
			Size = UDim2.fromOffset(XOffset, 0),
			headerSize = UDim2.fromOffset(XOffset, XOffset),
			footerAutomaticSize = Enum.AutomaticSize.XY,
			AutomaticSize = Enum.AutomaticSize.XY,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: Callback (copy), p1 (copy)
				Callback(p1)
			end, { Callback, p1 }),
			ref = UseRefResult,
			itemStatus = if FFlagAXEnableIaBTimedOptionsBulkPurchase then Config else nil,
			isOwned = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseMemoResult else nil,
			timedOptions = if FFlagAXEnableIaBTimedOptionsBulkPurchase then TimedOptions else nil,
			onTimedOptionPriceChanged = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseResult else nil,
			selectedTimedOptionPrice = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseMemoResult1 else nil,
			wearTimeSelectedOptionInList = if FFlagAXEnableIaBTimedOptionsBulkPurchase then WearTimeSelectedOptionInList else nil
		}
	else
		return {}
	end
end