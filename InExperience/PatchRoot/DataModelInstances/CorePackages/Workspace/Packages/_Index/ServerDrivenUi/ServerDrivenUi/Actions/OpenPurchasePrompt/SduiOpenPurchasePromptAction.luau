local Parent = script:FindFirstAncestor("OpenPurchasePrompt"):FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local DataHydrationModule = require(Parent.DataHydration)
local PromiseModule = require(Parent.Promise)
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local PurchasePromptLiteModule = require(Parent.PurchasePromptLite)
local ProductPurchaseSurface = PurchasePromptLiteModule.Enums.ProductPurchaseSurface
local ProductKind = PurchasePromptLiteModule.Enums.ProductKind
local SduiReportGamePlayIntentFunction = require(Parent.SduiSharedContent).sduiReportGamePlayIntent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiDevStoreSeeAllSupport = SharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local FFlagEnableHomeGameItemOwnershipUpdate = SharedFlagsModule.FFlagEnableHomeGameItemOwnershipUpdate
local FFlagEnableSearchGameItemOwnershipUpdate = SharedFlagsModule.FFlagEnableSearchGameItemOwnershipUpdate
local FFlagEnableEdpPreviewPurchaseSurface = SharedFlagsModule.FFlagEnableEdpPreviewPurchaseSurface
local FFlagEnableLaunchAfterPurchase = SharedFlagsModule.FFlagEnableLaunchAfterPurchase
local ExperienceService = game:GetService("ExperienceService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local EnableJoinAfterBuyFromEDP = game:DefineFastFlag("EnableJoinAfterBuyFromEDP", false)
local EnablePurchasePayloadForSduiPurchase = game:DefineFastFlag("EnablePurchasePayloadForSduiPurchase", false)

local function mapPriceDiscountDetails(PriceDiscountDetails) --[[ Line: 46 ]]
	if PriceDiscountDetails == nil or #PriceDiscountDetails == 0 then
		return nil
	end
	local List = {}
	
	for _, priceDiscountDetail in PriceDiscountDetails do
		table.insert(List, {
			Type = priceDiscountDetail.type,
			AmountInRobux = priceDiscountDetail.amountInRobux,
			Percent = priceDiscountDetail.percent
		})
	end
	return List
end

local function _(p1, p2) --[[ Line: 61 | Named "buildFetchProductInfo" ]]
	-- upvalues: PromiseModule (copy), mapPriceDiscountDetails (copy)
	return if p1 == nil then nil else function() --[[ Line: 65 ]]
		-- upvalues: PromiseModule (upval), p1 (copy), p2 (copy), mapPriceDiscountDetails (upval)
		return PromiseModule.resolve({
			ProductId = p1.productId,
			TargetId = p1.targetId,
			Name = p1.productName,
			Description = p1.description,
			PriceInRobux = p1.priceInRobux,
			IsForSale = p1.isForSale == nil or p1.isForSale,
			ProductType = p1.productType or p2,
			ImageUrl = p1.imageUrl,
			DisplayPrice = p1.displayPrice,
			IconImageAssetId = p1.iconImageAssetId,
			BasePriceInRobux = p1.basePriceInRobux,
			PriceDiscountDetails = mapPriceDiscountDetails(p1.priceDiscountDetails)
		})
	end
end

local function buildOnPurchaseSuccess(EDP, Kind, Id, RootPlaceId) --[[ Line: 83 ]]
	-- upvalues: ProductKind (copy), ProductPurchaseSurface (copy), FFlagEnableHomeGameItemOwnershipUpdate (copy), FFlagEnableSearchGameItemOwnershipUpdate (copy), FFlagEnableEdpPreviewPurchaseSurface (copy), DataHydrationModule (copy), FFlagSduiDevStoreSeeAllSupport (copy), Players (copy)
	return if Id then if Kind == ProductKind.Gamepass and (EDP == ProductPurchaseSurface.EDP or FFlagEnableHomeGameItemOwnershipUpdate and EDP == ProductPurchaseSurface.HomePageGameItemShop or FFlagEnableSearchGameItemOwnershipUpdate and EDP == ProductPurchaseSurface.SearchPageGameItemShop or FFlagEnableEdpPreviewPurchaseSurface and EDP == ProductPurchaseSurface.EDPPreview) then function() --[[ Line: 97 ]]
		-- upvalues: DataHydrationModule (upval), Id (copy)
		DataHydrationModule.Game.getGamePassStore(false).updateGamePassInfo(Id, { isOwned = true })
	end elseif FFlagSduiDevStoreSeeAllSupport and Kind == ProductKind.DeveloperSubscription and EDP == ProductPurchaseSurface.EDP then function() --[[ Line: 109 ]]
		-- upvalues: DataHydrationModule (upval), Id (copy)
		DataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfo(Id, { isSubscribed = true })
	end elseif Kind == ProductKind.Product and RootPlaceId and (FFlagSduiDevStoreSeeAllSupport and EDP == ProductPurchaseSurface.EDP or FFlagEnableHomeGameItemOwnershipUpdate and EDP == ProductPurchaseSurface.HomePageGameItemShop or FFlagEnableSearchGameItemOwnershipUpdate and EDP == ProductPurchaseSurface.SearchPageGameItemShop or FFlagSduiDevStoreSeeAllSupport and FFlagEnableEdpPreviewPurchaseSurface and EDP == ProductPurchaseSurface.EDPPreview) then function() --[[ Line: 137 ]]
		-- upvalues: Players (upval), DataHydrationModule (upval), RootPlaceId (copy)
		local LocalPlayer = Players.LocalPlayer
		local UserId = LocalPlayer and LocalPlayer.UserId
		
		if UserId ~= nil then
			DataHydrationModule.Game.getGameDeveloperProductStore(false).fetchStatuses(tostring(UserId), (tostring(RootPlaceId)))
			
			return
		end
	end else nil else nil
end

local _ = function(EDP, PlaceId, p1) --[[ Line: 152 | Named "buildOnPurchaseComplete" ]]
	-- upvalues: EnableJoinAfterBuyFromEDP (copy), ProductPurchaseSurface (copy), ExperienceService (copy), CloseCentralOverlayFunction (copy)
	return if EnableJoinAfterBuyFromEDP and EDP == ProductPurchaseSurface.EDP and PlaceId then function() --[[ Line: 154 ]]
		-- upvalues: ExperienceService (upval), PlaceId (copy), p1 (copy), CloseCentralOverlayFunction (upval)
		ExperienceService:LaunchExperience({ placeId = tonumber(PlaceId) })
		p1(CloseCentralOverlayFunction())
	end else nil
end

local _ = function(SduiContext, AnalyticsContext, PlaceId) --[[ Line: 165 | Named "buildOnLaunchAfterPurchase" ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), SduiCoreSystemModule (copy), SduiReportGamePlayIntentFunction (copy)
	return function() --[[ Line: 170 ]]
		-- upvalues: SduiContext (copy), PlaceId (copy), SduiErrorType (upval), SduiActionType (upval), SduiCoreSystemModule (upval), AnalyticsContext (copy), SduiReportGamePlayIntentFunction (upval)
		local Logger = SduiContext.dependencies.logger
		
		if PlaceId == nil then
			Logger.reportError(SduiErrorType.InvalidActionParams, {
				message = "Missing rootPlaceId for launch-after-purchase play attribution",
				name = SduiActionType.OpenPurchasePrompt
			}, SduiContext.appPage)
			
			return
		end
		local UniverseId = SduiCoreSystemModule.findAnalyticsFieldInAncestors("universeId", AnalyticsContext)
		
		if UniverseId == nil or tostring(UniverseId) == "" then
			Logger.reportError(SduiErrorType.InvalidActionParams, {
				message = "Missing universeId for launch-after-purchase play attribution",
				name = SduiActionType.OpenPurchasePrompt
			}, SduiContext.appPage)
			
			return
		else
			SduiReportGamePlayIntentFunction({
				actionType = "PlayAfterPurchase",
				sduiContext = SduiContext,
				analyticsContext = AnalyticsContext,
				universeId = tostring(UniverseId),
				placeId = PlaceId,
				rootPlaceId = PlaceId
			})
		end
	end
end

local _ = function(p1) --[[ Line: 200 | Named "buildOnFlowComplete" ]]
	-- upvalues: CloseCentralOverlayFunction (copy)
	return function() --[[ Line: 201 ]]
		-- upvalues: p1 (copy), CloseCentralOverlayFunction (upval)
		p1(CloseCentralOverlayFunction())
	end
end

local function normalizeProductPayload(ProductPayload, Kind) --[[ Line: 209 ]]
	-- upvalues: ProductKind (copy)
	if (Kind == ProductKind.Gamepass or Kind == ProductKind.Product) and typeof(ProductPayload.id) == "string" then
		local Number: number? = tonumber(ProductPayload.id)
		
		if Number ~= nil then
			ProductPayload.id = Number
		end
	end
	if Kind == ProductKind.DeveloperSubscription then
		local ExpectedPrice = ProductPayload.expectedPrice
		
		if typeof(ExpectedPrice) == "string" then
			ExpectedPrice = tonumber(ExpectedPrice) or 0
			ProductPayload.expectedPrice = ExpectedPrice
		end
		if ProductPayload.isSubscriptionInRobux == nil then
			ProductPayload.isSubscriptionInRobux = typeof(ExpectedPrice) == "number" and ExpectedPrice > 0
		end
	end
end

local config = {
	[ProductPurchaseSurface.HomePageGameItemShop] = "homePageGameItemShop",
	[ProductPurchaseSurface.SearchPageGameItemShop] = if FFlagEnableSearchGameItemOwnershipUpdate then "searchPageGameItemShop" else nil,
	[ProductPurchaseSurface.EDPPreview] = if FFlagEnableEdpPreviewPurchaseSurface then "experienceDetailPagePreview" else nil
}

local function buildPurchasePayload(LocationType) --[[ Line: 244 ]]
	-- upvalues: HttpService (copy)
	return HttpService:JSONEncode({
		surface = {
			scopeType = "lua",
			location = { locationType = LocationType }
		}
	})
end

return function(p1, AnalyticsContext, SduiContext) --[[ Line: 255 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), normalizeProductPayload (copy), EnablePurchasePayloadForSduiPurchase (copy), config (copy), buildPurchasePayload (copy), PurchasePromptLiteModule (copy), TimeToInteractiveTracker (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), buildOnPurchaseSuccess (copy), PromiseModule (copy), mapPriceDiscountDetails (copy), CloseCentralOverlayFunction (copy), EnableJoinAfterBuyFromEDP (copy), ProductPurchaseSurface (copy), ExperienceService (copy), FFlagEnableLaunchAfterPurchase (copy), SduiCoreSystemModule (copy), SduiReportGamePlayIntentFunction (copy)
	local Logger = SduiContext.dependencies.logger
	local AppPage = SduiContext.appPage
	local DispatchFunction: (any) -> () = SduiContext.dependencies.dispatch
	local ActionParams = p1 and p1.actionParams
	
	if ActionParams == nil then
		Logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = SduiActionType.OpenPurchasePrompt
		}, AppPage)
		
		return
	end
	local ProductPayload = ActionParams.productPayload
	local DisplayInfo = ActionParams.displayInfo
	local PurchaseOptions = ActionParams.purchaseOptions
	local PurchaseAnalyticsMetadata = ActionParams.purchaseAnalyticsMetadata
	local RootPlaceId = ActionParams.rootPlaceId
	
	if ProductPayload == nil then
		Logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing productPayload",
			name = SduiActionType.OpenPurchasePrompt
		}, AppPage)
		
		return
	end
	local Kind = ProductPayload.kind
	local Id = ProductPayload.id or ProductPayload.subscriptionId
	normalizeProductPayload(ProductPayload, Kind)
	local Surface = PurchaseAnalyticsMetadata and PurchaseAnalyticsMetadata.surface
	
	if EnablePurchasePayloadForSduiPurchase and Surface ~= nil then
		local Entry = config[Surface]
		
		if Entry ~= nil then
			ProductPayload.purchasePayload = buildPurchasePayload(Entry)
		end
	end
	if PurchaseOptions and PurchaseOptions.enablePreloadedPurchaseUi ~= nil then
		PurchaseOptions.enablePreloadedPurchaseUI = PurchaseOptions.enablePreloadedPurchaseUi
		PurchaseOptions.enablePreloadedPurchaseUi = nil
	end
	local TTIEventName = PurchasePromptLiteModule.getTTIEventName(Surface or "Unknown")
	TimeToInteractiveTracker.trackStart(TTIEventName)
	TimeToInteractiveTracker.updateMetadata(TTIEventName, { category = "unified_purchase_modal", page = Surface })
	DispatchFunction(SetCentralOverlayFunction(CentralOverlayType.UnifiedProductPurchaseModal, {
		productPayload = ProductPayload,
		purchaseCallbacks = {
			onPurchaseSuccess = buildOnPurchaseSuccess(Surface, Kind, Id, RootPlaceId),
			fetchProductInfo = if DisplayInfo == nil then nil else function() --[[ Line: 65 ]]
				-- upvalues: PromiseModule (upval), DisplayInfo (copy), Kind (copy), mapPriceDiscountDetails (upval)
				return PromiseModule.resolve({
					ProductId = DisplayInfo.productId,
					TargetId = DisplayInfo.targetId,
					Name = DisplayInfo.productName,
					Description = DisplayInfo.description,
					PriceInRobux = DisplayInfo.priceInRobux,
					IsForSale = DisplayInfo.isForSale == nil or DisplayInfo.isForSale,
					ProductType = DisplayInfo.productType or Kind,
					ImageUrl = DisplayInfo.imageUrl,
					DisplayPrice = DisplayInfo.displayPrice,
					IconImageAssetId = DisplayInfo.iconImageAssetId,
					BasePriceInRobux = DisplayInfo.basePriceInRobux,
					PriceDiscountDetails = mapPriceDiscountDetails(DisplayInfo.priceDiscountDetails)
				})
			end,
			onFlowComplete = function() --[[ Line: 201 ]]
				-- upvalues: DispatchFunction (copy), CloseCentralOverlayFunction (upval)
				DispatchFunction(CloseCentralOverlayFunction())
			end,
			onPurchaseComplete = if EnableJoinAfterBuyFromEDP and Surface == ProductPurchaseSurface.EDP and RootPlaceId then function() --[[ Line: 154 ]]
				-- upvalues: ExperienceService (upval), RootPlaceId (copy), DispatchFunction (copy), CloseCentralOverlayFunction (upval)
				ExperienceService:LaunchExperience({ placeId = tonumber(RootPlaceId) })
				DispatchFunction(CloseCentralOverlayFunction())
			end else nil,
			onLaunchAfterPurchase = if FFlagEnableLaunchAfterPurchase then function() --[[ Line: 170 ]]
				-- upvalues: SduiContext (copy), RootPlaceId (copy), SduiErrorType (upval), SduiActionType (upval), SduiCoreSystemModule (upval), AnalyticsContext (copy), SduiReportGamePlayIntentFunction (upval)
				local Logger = SduiContext.dependencies.logger
				
				if RootPlaceId == nil then
					Logger.reportError(SduiErrorType.InvalidActionParams, {
						message = "Missing rootPlaceId for launch-after-purchase play attribution",
						name = SduiActionType.OpenPurchasePrompt
					}, SduiContext.appPage)
					
					return
				end
				local UniverseId = SduiCoreSystemModule.findAnalyticsFieldInAncestors("universeId", AnalyticsContext)
				
				if UniverseId == nil or tostring(UniverseId) == "" then
					Logger.reportError(SduiErrorType.InvalidActionParams, {
						message = "Missing universeId for launch-after-purchase play attribution",
						name = SduiActionType.OpenPurchasePrompt
					}, SduiContext.appPage)
					
					return
				else
					SduiReportGamePlayIntentFunction({
						actionType = "PlayAfterPurchase",
						sduiContext = SduiContext,
						analyticsContext = AnalyticsContext,
						universeId = tostring(UniverseId),
						placeId = RootPlaceId,
						rootPlaceId = RootPlaceId
					})
				end
			end else nil
		},
		purchaseAnalyticsMetadata = PurchaseAnalyticsMetadata,
		purchaseOptions = PurchaseOptions
	}))
end