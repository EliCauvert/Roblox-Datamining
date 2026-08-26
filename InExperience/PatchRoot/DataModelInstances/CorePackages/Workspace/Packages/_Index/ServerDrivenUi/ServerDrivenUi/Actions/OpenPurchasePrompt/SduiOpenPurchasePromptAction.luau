local parent = script:FindFirstAncestor("OpenPurchasePrompt"):FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local dataHydrationModule = require(parent.DataHydration)
local promiseModule = require(parent.Promise)
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local purchasePromptLiteModule = require(parent.PurchasePromptLite)
local productPurchaseSurface = purchasePromptLiteModule.Enums.ProductPurchaseSurface
local productKind = purchasePromptLiteModule.Enums.ProductKind
local sduiReportGamePlayIntent = require(parent.SduiSharedContent).sduiReportGamePlayIntent
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiDevStoreSeeAllSupport = sharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagEnableHomeGameItemOwnershipUpdate = sharedFlagsModule.FFlagEnableHomeGameItemOwnershipUpdate
local fFlagEnableLaunchAfterPurchase = sharedFlagsModule.FFlagEnableLaunchAfterPurchase
local experienceService = game:GetService("ExperienceService")
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local enableJoinAfterBuyFromEDP = game:DefineFastFlag("EnableJoinAfterBuyFromEDP", false)
local enablePurchasePayloadForSduiPurchase = game:DefineFastFlag("EnablePurchasePayloadForSduiPurchase", false)

local function mapPriceDiscountDetails(p1)
	if p1 == nil or #p1 == 0 then
		return nil
	end
	local t = {}
	
	for i, v in p1 do
		table.insert(t, {
			Type = v.type,
			AmountInRobux = v.amountInRobux,
			Percent = v.percent
		})
	end
	return t
end

local function _(p2, p3)
	-- upvalues: promiseModule (ref), mapPriceDiscountDetails (ref)
	return if p2 == nil then nil else function()
		-- upvalues: promiseModule (copy), p2 (ref), p3 (ref), mapPriceDiscountDetails (copy)
		return promiseModule.resolve({
			ProductId = p2.productId,
			TargetId = p2.targetId,
			Name = p2.productName,
			Description = p2.description,
			PriceInRobux = p2.priceInRobux,
			IsForSale = p2.isForSale ~= nil or p2.isForSale,
			ProductType = p2.productType or p3,
			ImageUrl = p2.imageUrl,
			DisplayPrice = p2.displayPrice,
			IconImageAssetId = p2.iconImageAssetId,
			BasePriceInRobux = p2.basePriceInRobux,
			PriceDiscountDetails = mapPriceDiscountDetails(p2.priceDiscountDetails)
		})
	end
end

local function buildOnPurchaseSuccess(p2, p3, p4, p5)
	-- upvalues: productKind (ref), productPurchaseSurface (ref), fFlagEnableHomeGameItemOwnershipUpdate (ref), dataHydrationModule (ref), fFlagSduiDevStoreSeeAllSupport (ref), playersService (ref)
	return if p4 then if p3 == productKind.Gamepass and (p2 == productPurchaseSurface.EDP or fFlagEnableHomeGameItemOwnershipUpdate and p2 == productPurchaseSurface.HomePageGameItemShop) then function()
		-- upvalues: dataHydrationModule (copy), p4 (ref)
		dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfo(p4, { isOwned = true })
	end elseif fFlagSduiDevStoreSeeAllSupport and p3 == productKind.DeveloperSubscription and p2 == productPurchaseSurface.EDP then function()
		-- upvalues: dataHydrationModule (copy), p4 (ref)
		dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfo(p4, { isSubscribed = true })
	end elseif p3 == productKind.Product and (fFlagSduiDevStoreSeeAllSupport and p2 == productPurchaseSurface.EDP or fFlagEnableHomeGameItemOwnershipUpdate and p2 == productPurchaseSurface.HomePageGameItemShop) and p5 then function()
		-- upvalues: playersService (copy), dataHydrationModule (copy), p5 (ref)
		local localPlayer = playersService.LocalPlayer
		local userId = localPlayer and localPlayer.UserId
		
		if userId == nil then
			return
		end
		dataHydrationModule.Game.getGameDeveloperProductStore(false).fetchStatuses(tostring(userId), tostring(p5))
	end else nil else nil
end

local _ = function(p2, p3, p4)
	-- upvalues: enableJoinAfterBuyFromEDP (ref), productPurchaseSurface (ref), experienceService (ref), closeCentralOverlay (ref)
	return if enableJoinAfterBuyFromEDP and p2 == productPurchaseSurface.EDP and p3 then function()
		-- upvalues: experienceService (copy), p3 (ref), p4 (ref), closeCentralOverlay (copy)
		experienceService:LaunchExperience({ placeId = tonumber(p3) })
		p4(closeCentralOverlay())
	end else nil
end

local _ = function(p2, p3, p4)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), sduiCoreSystemModule (ref), sduiReportGamePlayIntent (ref)
	return function()
		-- upvalues: p2 (ref), p4 (ref), sduiErrorType (copy), sduiActionType (copy), sduiCoreSystemModule (copy), p3 (ref), sduiReportGamePlayIntent (copy)
		local logger = p2.dependencies.logger
		
		if p4 == nil then
			logger.reportError(sduiErrorType.InvalidActionParams, {
				message = "Missing rootPlaceId for launch-after-purchase play attribution",
				name = sduiActionType.OpenPurchasePrompt
			}, p2.appPage)
			
			return
		end
		local universeId = sduiCoreSystemModule.findAnalyticsFieldInAncestors("universeId", p3)
		
		if universeId == nil or tostring(universeId) == "" then
			logger.reportError(sduiErrorType.InvalidActionParams, {
				message = "Missing universeId for launch-after-purchase play attribution",
				name = sduiActionType.OpenPurchasePrompt
			}, p2.appPage)
			
			return
		end
		sduiReportGamePlayIntent({
			actionType = "PlayAfterPurchase",
			sduiContext = p2,
			analyticsContext = p3,
			universeId = tostring(universeId),
			placeId = p4,
			rootPlaceId = p4
		})
	end
end

local _ = function(p2)
	-- upvalues: closeCentralOverlay (ref)
	return function()
		-- upvalues: p2 (ref), closeCentralOverlay (copy)
		p2(closeCentralOverlay())
	end
end

local function normalizeProductPayload(p2, p3)
	-- upvalues: productKind (ref)
	if (p3 == productKind.Gamepass or p3 == productKind.Product) and typeof(p2.id) == "string" then
		local var1 = tonumber(p2.id)
		
		if var1 ~= nil then
			p2.id = var1
		end
	end
	if p3 == productKind.DeveloperSubscription then
		local expectedPrice = p2.expectedPrice
		
		if typeof(expectedPrice) == "string" then
			expectedPrice = tonumber(expectedPrice) or 0
			p2.expectedPrice = expectedPrice
		end
		if p2.isSubscriptionInRobux == nil then
			p2.isSubscriptionInRobux = typeof(expectedPrice) == "number" and expectedPrice > 0
		end
	end
end

local t = {
	[productPurchaseSurface.HomePageGameItemShop] = "homePageGameItemShop"
}

local function buildPurchasePayload(p2)
	-- upvalues: httpService (ref)
	return httpService:JSONEncode({
		surface = { scopeType = "lua", location = { locationType = p2 } }
	})
end

return function(p2, p3, p4)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), normalizeProductPayload (ref), enablePurchasePayloadForSduiPurchase (ref), t (ref), buildPurchasePayload (ref), purchasePromptLiteModule (ref), timeToInteractiveTracker (ref), setCentralOverlay (ref), centralOverlayType (ref), buildOnPurchaseSuccess (ref), promiseModule (ref), mapPriceDiscountDetails (ref), closeCentralOverlay (ref), enableJoinAfterBuyFromEDP (ref), productPurchaseSurface (ref), experienceService (ref), fFlagEnableLaunchAfterPurchase (ref), sduiCoreSystemModule (ref), sduiReportGamePlayIntent (ref)
	local logger = p4.dependencies.logger
	local appPage = p4.appPage
	local dispatch = p4.dependencies.dispatch
	local actionParams = p2 and p2.actionParams
	
	if actionParams == nil then
		logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.OpenPurchasePrompt
		}, appPage)
		
		return
	end
	local productPayload = actionParams.productPayload
	local displayInfo = actionParams.displayInfo
	local purchaseOptions = actionParams.purchaseOptions
	local purchaseAnalyticsMetadata = actionParams.purchaseAnalyticsMetadata
	local rootPlaceId = actionParams.rootPlaceId
	
	if productPayload == nil then
		logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing productPayload",
			name = sduiActionType.OpenPurchasePrompt
		}, appPage)
		
		return
	end
	local kind = productPayload.kind
	local id = productPayload.id or productPayload.subscriptionId
	
	if fFlagSduiExperienceDetailsSupport or fFlagSduiDevStoreSeeAllSupport then
		normalizeProductPayload(productPayload, kind)
	end
	local surface = purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.surface
	
	if enablePurchasePayloadForSduiPurchase and surface ~= nil then
		local var1 = t[surface]
		
		if var1 ~= nil then
			productPayload.purchasePayload = buildPurchasePayload(var1)
		end
	end
	if purchaseOptions and purchaseOptions.enablePreloadedPurchaseUi ~= nil then
		purchaseOptions.enablePreloadedPurchaseUI = purchaseOptions.enablePreloadedPurchaseUi
		purchaseOptions.enablePreloadedPurchaseUi = nil
	end
	local TTIEventName = purchasePromptLiteModule.getTTIEventName(surface or "Unknown")
	timeToInteractiveTracker.trackStart(TTIEventName)
	timeToInteractiveTracker.updateMetadata(TTIEventName, { category = "unified_purchase_modal", page = surface })
	dispatch(setCentralOverlay(centralOverlayType.UnifiedProductPurchaseModal, {
		productPayload = productPayload,
		purchaseCallbacks = {
			onPurchaseSuccess = buildOnPurchaseSuccess(surface, kind, id, rootPlaceId),
			fetchProductInfo = if displayInfo == nil then nil else function()
				-- upvalues: promiseModule (copy), displayInfo (ref), kind (ref), mapPriceDiscountDetails (copy)
				return promiseModule.resolve({
					ProductId = displayInfo.productId,
					TargetId = displayInfo.targetId,
					Name = displayInfo.productName,
					Description = displayInfo.description,
					PriceInRobux = displayInfo.priceInRobux,
					IsForSale = displayInfo.isForSale ~= nil or displayInfo.isForSale,
					ProductType = displayInfo.productType or kind,
					ImageUrl = displayInfo.imageUrl,
					DisplayPrice = displayInfo.displayPrice,
					IconImageAssetId = displayInfo.iconImageAssetId,
					BasePriceInRobux = displayInfo.basePriceInRobux,
					PriceDiscountDetails = mapPriceDiscountDetails(displayInfo.priceDiscountDetails)
				})
			end,
			onFlowComplete = function()
				-- upvalues: dispatch (ref), closeCentralOverlay (copy)
				dispatch(closeCentralOverlay())
			end,
			onPurchaseComplete = if enableJoinAfterBuyFromEDP and surface == productPurchaseSurface.EDP and rootPlaceId then function()
				-- upvalues: experienceService (copy), rootPlaceId (ref), dispatch (ref), closeCentralOverlay (copy)
				experienceService:LaunchExperience({ placeId = tonumber(rootPlaceId) })
				dispatch(closeCentralOverlay())
			end else nil,
			onLaunchAfterPurchase = if fFlagEnableLaunchAfterPurchase then function()
				-- upvalues: p4 (ref), rootPlaceId (ref), sduiErrorType (copy), sduiActionType (copy), sduiCoreSystemModule (copy), p3 (ref), sduiReportGamePlayIntent (copy)
				local logger = p4.dependencies.logger
				
				if rootPlaceId == nil then
					logger.reportError(sduiErrorType.InvalidActionParams, {
						message = "Missing rootPlaceId for launch-after-purchase play attribution",
						name = sduiActionType.OpenPurchasePrompt
					}, p4.appPage)
					
					return
				end
				local universeId = sduiCoreSystemModule.findAnalyticsFieldInAncestors("universeId", p3)
				
				if universeId == nil or tostring(universeId) == "" then
					logger.reportError(sduiErrorType.InvalidActionParams, {
						message = "Missing universeId for launch-after-purchase play attribution",
						name = sduiActionType.OpenPurchasePrompt
					}, p4.appPage)
					
					return
				end
				sduiReportGamePlayIntent({
					actionType = "PlayAfterPurchase",
					sduiContext = p4,
					analyticsContext = p3,
					universeId = tostring(universeId),
					placeId = rootPlaceId,
					rootPlaceId = rootPlaceId
				})
			end else nil
		},
		purchaseAnalyticsMetadata = purchaseAnalyticsMetadata,
		purchaseOptions = purchaseOptions
	}))
end