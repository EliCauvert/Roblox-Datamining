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
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiDevStoreSeeAllSupport = SharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local FFlagSduiExperienceDetailsSupport = SharedFlagsModule.FFlagSduiExperienceDetailsSupport
local ExperienceService = game:GetService("ExperienceService")
local Players = game:GetService("Players")
local EnableJoinAfterBuyFromEDP = game:DefineFastFlag("EnableJoinAfterBuyFromEDP", false)

local function mapPriceDiscountDetails(PriceDiscountDetails)
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

local function _(p1, p2)
	-- upvalues: PromiseModule (copy), mapPriceDiscountDetails (copy)
	return if p1 == nil then nil else function()
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

local function buildOnPurchaseSuccess(EDP, Kind, Id, RootPlaceId)
	-- upvalues: ProductKind (copy), ProductPurchaseSurface (copy), DataHydrationModule (copy), FFlagSduiDevStoreSeeAllSupport (copy), Players (copy)
	return if Id then if Kind == ProductKind.Gamepass and EDP == ProductPurchaseSurface.EDP then function()
		-- upvalues: DataHydrationModule (upval), Id (copy)
		DataHydrationModule.Game.getGamePassStore(false).updateGamePassInfo(Id, { isOwned = true })
	end elseif FFlagSduiDevStoreSeeAllSupport and Kind == ProductKind.DeveloperSubscription and EDP == ProductPurchaseSurface.EDP then function()
		-- upvalues: DataHydrationModule (upval), Id (copy)
		DataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfo(Id, { isSubscribed = true })
	end elseif FFlagSduiDevStoreSeeAllSupport and Kind == ProductKind.Product and EDP == ProductPurchaseSurface.EDP and RootPlaceId then function()
		-- upvalues: Players (upval), DataHydrationModule (upval), RootPlaceId (copy)
		local LocalPlayer = Players.LocalPlayer
		local UserId = LocalPlayer and LocalPlayer.UserId
		
		if UserId ~= nil then
			DataHydrationModule.Game.getGameDeveloperProductStore(false).fetchStatuses(tostring(UserId), (tostring(RootPlaceId)))
			
			return
		end
	end else nil else nil
end

local _ = function(EDP, p1, p2)
	-- upvalues: EnableJoinAfterBuyFromEDP (copy), ProductPurchaseSurface (copy), ExperienceService (copy), CloseCentralOverlayFunction (copy)
	return if EnableJoinAfterBuyFromEDP and EDP == ProductPurchaseSurface.EDP and p1 then function()
		-- upvalues: ExperienceService (upval), p1 (copy), p2 (copy), CloseCentralOverlayFunction (upval)
		ExperienceService:LaunchExperience({ placeId = tonumber(p1) })
		p2(CloseCentralOverlayFunction())
	end else nil
end

local _ = function(p1)
	-- upvalues: CloseCentralOverlayFunction (copy)
	return function()
		-- upvalues: p1 (copy), CloseCentralOverlayFunction (upval)
		p1(CloseCentralOverlayFunction())
	end
end

local function normalizeProductPayload(ProductPayload, Kind)
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

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiDevStoreSeeAllSupport (copy), normalizeProductPayload (copy), PurchasePromptLiteModule (copy), TimeToInteractiveTracker (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), buildOnPurchaseSuccess (copy), PromiseModule (copy), mapPriceDiscountDetails (copy), CloseCentralOverlayFunction (copy), EnableJoinAfterBuyFromEDP (copy), ProductPurchaseSurface (copy), ExperienceService (copy)
	local Logger = p2.dependencies.logger
	local AppPage = p2.appPage
	local DispatchFunction: (any) -> () = p2.dependencies.dispatch
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
	
	if FFlagSduiExperienceDetailsSupport or FFlagSduiDevStoreSeeAllSupport then
		normalizeProductPayload(ProductPayload, Kind)
	end
	local Surface = PurchaseAnalyticsMetadata and PurchaseAnalyticsMetadata.surface
	
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
			fetchProductInfo = if DisplayInfo == nil then nil else function()
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
			onFlowComplete = function()
				-- upvalues: DispatchFunction (copy), CloseCentralOverlayFunction (upval)
				DispatchFunction(CloseCentralOverlayFunction())
			end,
			onPurchaseComplete = if EnableJoinAfterBuyFromEDP and Surface == ProductPurchaseSurface.EDP and RootPlaceId then function()
				-- upvalues: ExperienceService (upval), RootPlaceId (copy), DispatchFunction (copy), CloseCentralOverlayFunction (upval)
				ExperienceService:LaunchExperience({ placeId = tonumber(RootPlaceId) })
				DispatchFunction(CloseCentralOverlayFunction())
			end else nil
		},
		purchaseAnalyticsMetadata = PurchaseAnalyticsMetadata,
		purchaseOptions = PurchaseOptions
	}))
end