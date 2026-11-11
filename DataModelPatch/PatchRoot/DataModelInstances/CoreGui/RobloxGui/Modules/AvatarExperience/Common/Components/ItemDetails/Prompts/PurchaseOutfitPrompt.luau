local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local TutilsModule = require(CorePackages.Packages.tutils)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local PromiseModule = require(CorePackages.Packages.Promise)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local PurchaseProductModule = require(Modules.AvatarExperience.Catalog.Thunks.PurchaseProduct)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AnalyticsModule1 = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local WearAfterOutfitPurchaseModule = require(Modules.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local PurchasePromptInteractiveAlertModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePromptInteractiveAlert)
local _ = require(Modules.AvatarExperience.Common.Types)
local _ = require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local EconomicRestrictionsCounter = IAPExperienceModule.Counters.EconomicRestrictionsCounter
local UniversalEconomicRestrictionsCounter = EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter
local EconomicRestrictionsSurface = EconomicRestrictionsCounter.EconomicRestrictionsSurface
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local OpenCentralOverlayForEconomicRestrictionPromptModule = require(Modules.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt)
local ParseEconomicRestrictionsFailureReasonFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsFailureReason
local ParseEconomicRestrictionsExpirationTimeInMinutesFunction = IAPExperienceModule.Utility.parseEconomicRestrictionsExpirationTimeInMinutes
local PurchaseOutfitPrompt = RoactModule.PureComponent:extend("PurchaseOutfitPrompt")
PurchaseOutfitPrompt.validateProps = TModule.strictInterface({
	navigation = TModule.table,
	itemsToPurchase = TModule.table,
	ownedTryOnItems = TModule.table,
	totalOutfitPrice = TModule.integer,
	entryPoint = TModule.optional(TModule.string),
	itemDataTable = TModule.table,
	userAssets = TModule.table,
	collectiblesItemInfo = TModule.table,
	collectiblesResellersInstances = TModule.table,
	collectiblesResellableInstances = TModule.table,
	purchaseProduct = TModule.callback,
	setCurrentToastMessage = TModule.callback,
	wearAfterOutfitPurchase = TModule.callback,
	economicRestrictionErrorHandler = TModule.callback,
	networking = TModule.callback,
	analytics = TModule.table,
	aeAnalytics = TModule.table,
	localization = TModule.table,
	enablePurchasePromptIncludingWarning = TModule.boolean,
	focusController = TModule.optional(TModule.table),
	defaultChildRef = TModule.optional(TModule.table),
	onOverlayClosed = TModule.optional(TModule.callback)
})

local function _(p1)
	-- upvalues: NavigationUtilsModule (copy)
	NavigationUtilsModule.closeOverlay(p1)
end

local _ = function(p1)
	-- upvalues: NavigationUtilsModule (copy)
	NavigationUtilsModule.closeOverlay(p1)
	NavigationUtilsModule.closeFocusedScreen(p1)
end

local v1 = nil
local MemoizeResult = MemoizeFunction(function(p1, List)
	-- upvalues: ItemDataModule (copy)
	local t = {}
	
	for i, value in List do
		t[i] = ItemDataModule(p1, i, value.itemType)
	end
	return t
end)

v1 = function(p2, ItemsToPurchase)
	-- upvalues: MemoizeResult (copy)
	return MemoizeResult(p2.AvatarExperience.Common, ItemsToPurchase)
end

function PurchaseOutfitPrompt.getToast(p2, NumItems, p3, _)
	-- upvalues: ToastTypeModule (copy)
	local Localization = p2.props.localization
	local config = { numItems = NumItems }
	local FeatureAvatarLabelOutfitPurchaseSuccess = Localization:Format("Feature.Avatar.Label.OutfitPurchaseSuccess", config)
	local FeatureAvatarLabelOutfitPurchaseFailure = Localization:Format("Feature.Avatar.Label.OutfitPurchaseFailure", config)
	local InformationMessage = nil
	local ToastMessage = nil
	
	if p3 then
		ToastMessage = FeatureAvatarLabelOutfitPurchaseSuccess
		InformationMessage = ToastTypeModule.InformationMessage
	else
		ToastMessage = FeatureAvatarLabelOutfitPurchaseFailure
		InformationMessage = ToastTypeModule.NetworkingError
	end
	return {
		isLocalized = true,
		toastMessage = ToastMessage,
		toastType = InformationMessage
	}
end

local _ = function(List)
	local Count = 0
	local Count1 = 0
	
	for _, value in List do
		if value == true then
			Count += 1
		else
			Count1 += 1
		end
	end
	return Count, Count1
end

function PurchaseOutfitPrompt.showToasts(p2, List, p3)
	local Count = 0
	local Count1 = 0
	
	for _, value in List do
		if value == true then
			Count += 1
		else
			Count1 += 1
		end
	end
	local NumItems: number = Count
	local NumItems1: number = Count1
	
	if NumItems > 0 then
		p2.props.setCurrentToastMessage(p2:getToast(NumItems, true, p3))
	end
	if NumItems1 > 0 then
		p2.props.setCurrentToastMessage(p2:getToast(NumItems1, false, p3))
	end
end

function PurchaseOutfitPrompt:formatOwnedItemForWearAfterPurchase(p4, p5)
	-- upvalues: ConstantsModule (copy)
	local IsItemTypeMatch = p5.itemType == ConstantsModule.ItemType.Bundle
	
	return {
		purchased = false,
		owned = true,
		assetIsWearable = not IsItemTypeMatch,
		bundleId = IsItemTypeMatch and p4 or nil,
		tryOnBundleInfo = IsItemTypeMatch and p5.bundleInfo or nil,
		assetId = if IsItemTypeMatch then nil else p4 or nil,
		assetType = IsItemTypeMatch and ConstantsModule.ItemType.Bundle or nil,
		overrideOrder = p5.order,
		itemSubType = p5.itemSubType
	}
end

function PurchaseOutfitPrompt.handleWearAfterPurchase(p4, List, p5)
	if not p4.state.isWearAfterPurchaseChecked then return end
	local List1 = {}
	
	for i, ownedTryOnItem in p4.props.ownedTryOnItems do
		table.insert(List1, p4:formatOwnedItemForWearAfterPurchase(i, ownedTryOnItem))
	end
	for i1, value in List do
		if value == true and p5[i1].purchased == true then
			table.insert(List1, p5[i1])
		end
	end
	p4.props.wearAfterOutfitPurchase(List1, p4.props.navigation, p4.props.aeAnalytics)
end

function PurchaseOutfitPrompt.init(p6)
	-- upvalues: NavigationUtilsModule (copy), CatalogUtilsModule (copy), PromiseModule (copy)
	p6.isMounted = false
	p6.state = { isWearAfterPurchaseChecked = true, isPurchasing = false }
	
	function p6.onCancel()
		-- upvalues: p6 (copy), NavigationUtilsModule (upval)
		if not p6.state.isPurchasing then
			NavigationUtilsModule.closeOverlay(p6.props.navigation)
			
			return
		end
	end
	
	function p6.onConfirm(p7)
		-- upvalues: p6 (copy), CatalogUtilsModule (upval), PromiseModule (upval), NavigationUtilsModule (upval)
		if p6.state.isPurchasing then return end
		local Networking = p6.props.networking
		local Analytics = p6.props.analytics
		local Navigation = p6.props.navigation
		local List = {}
		local EntryPoint = p6.props.entryPoint
		
		for i, value in p6.props.itemsToPurchase do
			local ItemType = value.itemType
			local ItemSubType = value.itemSubType
			local ExpectedPrice = value.expectedPrice
			local ItemData = p6.props.itemDataTable[i]
			local Id = ItemData.product.id
			local ExpectedSellerId = ItemData.expectedSellerId
			local ResellerUserAssetIds = ItemData.resellerUserAssetIds
			local IsResellable = CatalogUtilsModule.IsResellable(ItemData)
			local CollectibleItemId = ItemData and ItemData.collectibleItemId
			local Type = ItemData and (ItemData.creator and ItemData.creator.type)
			local UserAsset = p6.props.userAssets[ResellerUserAssetIds and ResellerUserAssetIds[1]]
			local UserAssetId = nil
			
			if IsResellable and UserAsset then
				UserAssetId = UserAsset.userAssetId
				ExpectedSellerId = UserAsset.userId
			end
			local CollectibleInstanceId = nil
			
			if CollectibleItemId then
				local CheapestCollectiblePurchaseInfoV2 = CatalogUtilsModule.findCheapestCollectiblePurchaseInfoV2(CollectibleItemId, IsResellable, p6.props.collectiblesItemInfo, p6.props.collectiblesResellersInstances, p6.props.collectiblesResellableInstances)
				
				if CheapestCollectiblePurchaseInfoV2.price then
					ExpectedPrice = CheapestCollectiblePurchaseInfoV2.price
				end
				if CheapestCollectiblePurchaseInfoV2.collectibleInstanceId then
					CollectibleInstanceId = CheapestCollectiblePurchaseInfoV2.collectibleInstanceId
					ExpectedSellerId = CheapestCollectiblePurchaseInfoV2.expectedSellerId
				end
			end
			table.insert(List, p6.props.purchaseProduct(Networking, Id, ExpectedPrice or 0, ExpectedSellerId, i, ItemType, ItemSubType, false, UserAssetId, Analytics, Navigation, false, true, EntryPoint, CollectibleItemId, CollectibleInstanceId, Type, p6.props.economicRestrictionErrorHandler))
		end
		p6:setState({ isPurchasing = true })
		PromiseModule.new(function(Callback: (any, any) -> (), _)
			-- upvalues: List (copy)
			local List1 = {}
			local List2 = {}
			
			for _, Promise in List do
				local v2, v3 = Promise:await()
				table.insert(List1, v2)
				table.insert(List2, v3)
			end
			Callback(List1, List2)
		end):andThen(function(Result, p8)
			-- upvalues: p6 (upval), p7 (copy), NavigationUtilsModule (upval)
			if p6.isMounted then
				p6:setState({ isPurchasing = false })
				p6:showToasts(Result, p7)
				p6:handleWearAfterPurchase(Result, p8)
				local Navigation = p6.props.navigation
				NavigationUtilsModule.closeOverlay(Navigation)
				NavigationUtilsModule.closeFocusedScreen(Navigation)
				
				return
			else
				p6:showToasts(Result, p7)
				p6:handleWearAfterPurchase(Result, p8)
			end
		end)
	end
	
	function p6.toggleWearAfterPurchase()
		-- upvalues: p6 (copy)
		p6:setState({
			isWearAfterPurchaseChecked = not p6.state.isWearAfterPurchaseChecked
		})
	end
end

function PurchaseOutfitPrompt.renderAlertLocalized(p8, p9)
	-- upvalues: TutilsModule (copy), RoactModule (copy), PurchasePromptInteractiveAlertModule (copy)
	local TotalOutfitPrice = p8.props.totalOutfitPrice
	local FieldCountResult: number = TutilsModule.fieldCount(p8.props.itemsToPurchase)
	local BuyOutfitLuobuSingle = nil
	local Localization = p8.props.localization
	local config = { numItems = FieldCountResult }
	local FeatureAvatarLabelGetOutfitMultiple = Localization:Format("Feature.Avatar.Label.GetOutfitMultiple", config)
	local FeatureAvatarLabelBuyOutfitMultiple = Localization:Format("Feature.Avatar.Label.BuyOutfitMultiple", config)
	local FeatureAvatarLabelBuyOutfitLuobuMultiple = Localization:Format("Feature.Avatar.Label.BuyOutfitLuobuMultiple", config)
	local GetOutfit = nil
	local Get = nil
	
	if TotalOutfitPrice == 0 then
		GetOutfit = p9.getOutfit
		
		if FieldCountResult > 1 then
			BuyOutfitLuobuSingle = FeatureAvatarLabelGetOutfitMultiple
		elseif FieldCountResult == 1 then
			BuyOutfitLuobuSingle = p9.getOutfitOne
		end
		Get = p9.get
	else
		GetOutfit = p9.buyOutfit
		
		if p8.props.enablePurchasePromptIncludingWarning then
			if FieldCountResult > 1 then
				BuyOutfitLuobuSingle = FeatureAvatarLabelBuyOutfitLuobuMultiple
			elseif FieldCountResult == 1 then
				BuyOutfitLuobuSingle = p9.buyOutfitLuobuSingle
			end
		elseif FieldCountResult > 1 then
			BuyOutfitLuobuSingle = FeatureAvatarLabelBuyOutfitMultiple
		elseif FieldCountResult == 1 then
			BuyOutfitLuobuSingle = p9.buyOutfitSingle
		end
		Get = p9.buyOutfit
	end
	return RoactModule.createElement(PurchasePromptInteractiveAlertModule, {
		showWearAfterPurchase = true,
		priceInRobux = TotalOutfitPrice,
		isWearAfterPurchaseChecked = p8.state.isWearAfterPurchaseChecked,
		toggleWearAfterPurchase = p8.toggleWearAfterPurchase,
		titleText = GetOutfit,
		bodyText = BuyOutfitLuobuSingle,
		confirmButtonText = Get,
		onConfirm = function()
			-- upvalues: p8 (copy), p9 (copy)
			return p8.onConfirm(p9)
		end,
		onCancel = p8.onCancel,
		isLoading = p8.state.isPurchasing,
		defaultChildRef = p8.props.defaultChildRef
	})
end

function PurchaseOutfitPrompt.render(p8)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		getOutfit = "Feature.Avatar.Title.GetOutfit",
		buyOutfit = "Feature.Avatar.Title.BuyOutfit",
		get = "Feature.Catalog.Label.Get",
		getOutfitOne = "Feature.Avatar.Label.GetOutfitOne",
		buyOutfitSingle = "Feature.Avatar.Label.BuyOutfitSingle",
		buyOutfitLuobuSingle = "Feature.Avatar.Label.BuyOutfitLuobuSingle"
	})(function(p9)
		-- upvalues: p8 (copy)
		return p8:renderAlertLocalized(p9)
	end)
end

function PurchaseOutfitPrompt.didMount(p8)
	p8.isMounted = true
end

function PurchaseOutfitPrompt.willUnmount(p8)
	p8.isMounted = false
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactServices.connect({
	networking = RoactNetworkingModule,
	analytics = AnalyticsModule,
	aeAnalytics = AnalyticsModule1,
	localization = RoactLocalizationModule
})((RoactRoduxModule.connect(function(p8, p9)
	-- upvalues: v1 (ref)
	return {
		itemDataTable = v1(p8, p9.itemsToPurchase),
		userAssets = p8.AvatarExperience.Catalog.UserAssets,
		collectiblesItemInfo = p8.AvatarExperience.Common.Collectibles.CollectiblesItemInfo,
		collectiblesResellersInstances = p8.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances,
		collectiblesResellableInstances = p8.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances
	}
end, function(Callback)
	-- upvalues: SetCurrentToastMessageModule (copy), PurchaseProductModule (copy), WearAfterOutfitPurchaseModule (copy), ParseEconomicRestrictionsFailureReasonFunction (copy), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (copy), Default (copy), UniversalEconomicRestrictionsCounter (copy), EconomicRestrictionsSurface (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (copy)
	return {
		setCurrentToastMessage = function(p8)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval)
			Callback(SetCurrentToastMessageModule(p8))
		end,
		purchaseProduct = function(p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26)
			-- upvalues: Callback (copy), PurchaseProductModule (upval)
			return Callback(PurchaseProductModule(p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26))
		end,
		wearAfterOutfitPurchase = function(p8, p9, p10)
			-- upvalues: Callback (copy), WearAfterOutfitPurchaseModule (upval)
			return Callback(WearAfterOutfitPurchaseModule(p8, p9, p10))
		end,
		economicRestrictionErrorHandler = function(p8)
			-- upvalues: ParseEconomicRestrictionsFailureReasonFunction (upval), ParseEconomicRestrictionsExpirationTimeInMinutesFunction (upval), Default (upval), UniversalEconomicRestrictionsCounter (upval), EconomicRestrictionsSurface (upval), Callback (copy), OpenCentralOverlayForEconomicRestrictionPromptModule (upval)
			local ParseEconomicRestrictionsFailureReasonResult = ParseEconomicRestrictionsFailureReasonFunction(p8)
			local ParseEconomicRestrictionsExpirationTimeInMinutesResult = ParseEconomicRestrictionsExpirationTimeInMinutesFunction(p8)
			Default:logRobloxTelemetryCounter(UniversalEconomicRestrictionsCounter, 1, {
				surface = EconomicRestrictionsSurface.AvatarExperience,
				failureReason = ParseEconomicRestrictionsFailureReasonResult
			})
			
			return Callback(OpenCentralOverlayForEconomicRestrictionPromptModule(ParseEconomicRestrictionsFailureReasonResult, ParseEconomicRestrictionsExpirationTimeInMinutesResult))
		end
	}
end)((RoactAppPolicy.connect(function(p8, _)
	return {
		enablePurchasePromptIncludingWarning = p8.getPurchasePromptIncludingWarning()
	}
end)(PurchaseOutfitPrompt))))))))))