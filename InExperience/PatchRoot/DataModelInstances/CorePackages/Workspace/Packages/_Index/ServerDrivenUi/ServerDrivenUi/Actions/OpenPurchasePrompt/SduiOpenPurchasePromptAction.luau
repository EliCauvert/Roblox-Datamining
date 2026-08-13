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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiDevStoreSeeAllSupport = sharedFlagsModule.FFlagSduiDevStoreSeeAllSupport
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagEnableHomeGameItemOwnershipUpdate = sharedFlagsModule.FFlagEnableHomeGameItemOwnershipUpdate
local experienceService = game:GetService("ExperienceService")
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local enableJoinAfterBuyFromEDP = game:DefineFastFlag("EnableJoinAfterBuyFromEDP", false)
local enablePurchasePayloadForSduiPurchase = game:DefineFastFlag("EnablePurchasePayloadForSduiPurchase", false)

local function mapPriceDiscountDetails(p0) --[[ line: 43 ]]
	if p0 == nil or #p0 == 0 then
		return nil
	end
	local t = {}
	
	for i, v in p0 do
		table.insert(t, {
			Type = v.type,
			AmountInRobux = v.amountInRobux,
			Percent = v.percent
		})
	end
	return t
end

local function _(p1, p2) --[[ line: 58 | named "buildFetchProductInfo" ]]
	-- upvalues: promiseModule (ref), mapPriceDiscountDetails (ref)
	return if p1 == nil then nil else function() --[[ line: 62 ]]
		-- upvalues: promiseModule (copy), p1 (ref), p2 (ref), mapPriceDiscountDetails (copy)
		return promiseModule.resolve({
			ProductId = p1.productId,
			TargetId = p1.targetId,
			Name = p1.productName,
			Description = p1.description,
			PriceInRobux = p1.priceInRobux,
			IsForSale = p1.isForSale ~= nil or p1.isForSale,
			ProductType = p1.productType or p2,
			ImageUrl = p1.imageUrl,
			DisplayPrice = p1.displayPrice,
			IconImageAssetId = p1.iconImageAssetId,
			BasePriceInRobux = p1.basePriceInRobux,
			PriceDiscountDetails = mapPriceDiscountDetails(p1.priceDiscountDetails)
		})
	end
end

local function buildOnPurchaseSuccess(p3, p4, p5, p6) --[[ line: 80 ]]
	-- upvalues: productKind (ref), productPurchaseSurface (ref), fFlagEnableHomeGameItemOwnershipUpdate (ref), dataHydrationModule (ref), fFlagSduiDevStoreSeeAllSupport (ref), playersService (ref)
	return if p5 then if p4 == productKind.Gamepass and (p3 == productPurchaseSurface.EDP or fFlagEnableHomeGameItemOwnershipUpdate and p3 == productPurchaseSurface.HomePageGameItemShop) then function() --[[ line: 92 ]]
		-- upvalues: dataHydrationModule (copy), p5 (ref)
		dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfo(p5, { isOwned = true })
	end elseif fFlagSduiDevStoreSeeAllSupport and p4 == productKind.DeveloperSubscription and p3 == productPurchaseSurface.EDP then function() --[[ line: 104 ]]
		-- upvalues: dataHydrationModule (copy), p5 (ref)
		dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfo(p5, { isSubscribed = true })
	end elseif p4 == productKind.Product and (fFlagSduiDevStoreSeeAllSupport and p3 == productPurchaseSurface.EDP or fFlagEnableHomeGameItemOwnershipUpdate and p3 == productPurchaseSurface.HomePageGameItemShop) and p6 then function() --[[ line: 123 ]]
		-- upvalues: playersService (copy), dataHydrationModule (copy), p6 (ref)
		local localPlayer = playersService.LocalPlayer
		local userId = localPlayer and localPlayer.UserId
		
		if userId == nil then
			return
		end
		dataHydrationModule.Game.getGameDeveloperProductStore(false).fetchStatuses(tostring(userId), tostring(p6))
	end else nil else nil
end

local _ = function(p7, p8, p9) --[[ line: 138 | named "buildOnPurchaseComplete" ]]
	-- upvalues: enableJoinAfterBuyFromEDP (ref), productPurchaseSurface (ref), experienceService (ref), closeCentralOverlay (ref)
	return if enableJoinAfterBuyFromEDP and p7 == productPurchaseSurface.EDP and p8 then function() --[[ line: 140 ]]
		-- upvalues: experienceService (copy), p8 (ref), p9 (ref), closeCentralOverlay (copy)
		experienceService:LaunchExperience({ placeId = tonumber(p8) })
		p9(closeCentralOverlay())
	end else nil
end

local _ = function(p10) --[[ line: 148 | named "buildOnFlowComplete" ]]
	-- upvalues: closeCentralOverlay (ref)
	return function() --[[ line: 149 ]]
		-- upvalues: p10 (ref), closeCentralOverlay (copy)
		p10(closeCentralOverlay())
	end
end

local function normalizeProductPayload(p11, p12) --[[ line: 157 ]]
	-- upvalues: productKind (ref)
	if (p12 == productKind.Gamepass or p12 == productKind.Product) and typeof(p11.id) == "string" then
		local var17 = tonumber(p11.id)
		
		if var17 ~= nil then
			p11.id = var17
		end
	end
	if p12 == productKind.DeveloperSubscription then
		local expectedPrice = p11.expectedPrice
		
		if typeof(expectedPrice) == "string" then
			expectedPrice = tonumber(expectedPrice) or 0
			p11.expectedPrice = expectedPrice
		end
		if p11.isSubscriptionInRobux == nil then
			p11.isSubscriptionInRobux = typeof(expectedPrice) == "number" and expectedPrice > 0
		end
	end
end

local t = {
	[productPurchaseSurface.HomePageGameItemShop] = "homePageGameItemShop"
}

local function buildPurchasePayload(p13) --[[ line: 183 ]]
	-- upvalues: httpService (ref)
	return httpService:JSONEncode({
		surface = { scopeType = "lua", location = { locationType = p13 } }
	})
end

return function(p14, _, p15) --[[ line: 194 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), normalizeProductPayload (ref), enablePurchasePayloadForSduiPurchase (ref), t (ref), buildPurchasePayload (ref), purchasePromptLiteModule (ref), timeToInteractiveTracker (ref), setCentralOverlay (ref), centralOverlayType (ref), buildOnPurchaseSuccess (ref), promiseModule (ref), mapPriceDiscountDetails (ref), closeCentralOverlay (ref), enableJoinAfterBuyFromEDP (ref), productPurchaseSurface (ref), experienceService (ref)
	local logger = p15.dependencies.logger
	local appPage = p15.appPage
	local dispatch = p15.dependencies.dispatch
	local actionParams = p14 and p14.actionParams
	
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
		local var21 = t[surface]
		
		if var21 ~= nil then
			productPayload.purchasePayload = buildPurchasePayload(var21)
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
			fetchProductInfo = if displayInfo == nil then nil else function() --[[ line: 62 ]]
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
			onFlowComplete = function() --[[ line: 149 ]]
				-- upvalues: dispatch (ref), closeCentralOverlay (copy)
				dispatch(closeCentralOverlay())
			end,
			onPurchaseComplete = if enableJoinAfterBuyFromEDP and surface == productPurchaseSurface.EDP and rootPlaceId then function() --[[ line: 140 ]]
				-- upvalues: experienceService (copy), rootPlaceId (ref), dispatch (ref), closeCentralOverlay (copy)
				experienceService:LaunchExperience({ placeId = tonumber(rootPlaceId) })
				dispatch(closeCentralOverlay())
			end else nil
		},
		purchaseAnalyticsMetadata = purchaseAnalyticsMetadata,
		purchaseOptions = purchaseOptions
	}))
end