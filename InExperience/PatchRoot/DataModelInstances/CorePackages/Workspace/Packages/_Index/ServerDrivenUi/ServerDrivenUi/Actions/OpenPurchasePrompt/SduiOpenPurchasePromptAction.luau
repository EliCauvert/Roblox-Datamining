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

local function mapPriceDiscountDetails(p0) --[[ line: 45 ]]
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

local function _(p1, p2) --[[ line: 60 | named "buildFetchProductInfo" ]]
	-- upvalues: promiseModule (ref), mapPriceDiscountDetails (ref)
	return if p1 == nil then nil else function() --[[ line: 64 ]]
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

local function buildOnPurchaseSuccess(p3, p4, p5, p6) --[[ line: 82 ]]
	-- upvalues: productKind (ref), productPurchaseSurface (ref), fFlagEnableHomeGameItemOwnershipUpdate (ref), dataHydrationModule (ref), fFlagSduiDevStoreSeeAllSupport (ref), playersService (ref)
	return if p5 then if p4 == productKind.Gamepass and (p3 == productPurchaseSurface.EDP or fFlagEnableHomeGameItemOwnershipUpdate and p3 == productPurchaseSurface.HomePageGameItemShop) then function() --[[ line: 94 ]]
		-- upvalues: dataHydrationModule (copy), p5 (ref)
		dataHydrationModule.Game.getGamePassStore(false).updateGamePassInfo(p5, { isOwned = true })
	end elseif fFlagSduiDevStoreSeeAllSupport and p4 == productKind.DeveloperSubscription and p3 == productPurchaseSurface.EDP then function() --[[ line: 106 ]]
		-- upvalues: dataHydrationModule (copy), p5 (ref)
		dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfo(p5, { isSubscribed = true })
	end elseif p4 == productKind.Product and (fFlagSduiDevStoreSeeAllSupport and p3 == productPurchaseSurface.EDP or fFlagEnableHomeGameItemOwnershipUpdate and p3 == productPurchaseSurface.HomePageGameItemShop) and p6 then function() --[[ line: 125 ]]
		-- upvalues: playersService (copy), dataHydrationModule (copy), p6 (ref)
		local localPlayer = playersService.LocalPlayer
		local userId = localPlayer and localPlayer.UserId
		
		if userId == nil then
			return
		end
		dataHydrationModule.Game.getGameDeveloperProductStore(false).fetchStatuses(tostring(userId), tostring(p6))
	end else nil else nil
end

local _ = function(p7, p8, p9) --[[ line: 140 | named "buildOnPurchaseComplete" ]]
	-- upvalues: enableJoinAfterBuyFromEDP (ref), productPurchaseSurface (ref), experienceService (ref), closeCentralOverlay (ref)
	return if enableJoinAfterBuyFromEDP and p7 == productPurchaseSurface.EDP and p8 then function() --[[ line: 142 ]]
		-- upvalues: experienceService (copy), p8 (ref), p9 (ref), closeCentralOverlay (copy)
		experienceService:LaunchExperience({ placeId = tonumber(p8) })
		p9(closeCentralOverlay())
	end else nil
end

local _ = function(p10, p11, p12) --[[ line: 153 | named "buildOnLaunchAfterPurchase" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), sduiCoreSystemModule (ref), sduiReportGamePlayIntent (ref)
	return function() --[[ line: 158 ]]
		-- upvalues: p10 (ref), p12 (ref), sduiErrorType (copy), sduiActionType (copy), sduiCoreSystemModule (copy), p11 (ref), sduiReportGamePlayIntent (copy)
		local logger = p10.dependencies.logger
		
		if p12 == nil then
			logger.reportError(sduiErrorType.InvalidActionParams, {
				message = "Missing rootPlaceId for launch-after-purchase play attribution",
				name = sduiActionType.OpenPurchasePrompt
			}, p10.appPage)
			
			return
		end
		local universeId = sduiCoreSystemModule.findAnalyticsFieldInAncestors("universeId", p11)
		
		if universeId == nil or tostring(universeId) == "" then
			logger.reportError(sduiErrorType.InvalidActionParams, {
				message = "Missing universeId for launch-after-purchase play attribution",
				name = sduiActionType.OpenPurchasePrompt
			}, p10.appPage)
			
			return
		end
		sduiReportGamePlayIntent({
			actionType = "PlayAfterPurchase",
			sduiContext = p10,
			analyticsContext = p11,
			universeId = tostring(universeId),
			placeId = p12,
			rootPlaceId = p12
		})
	end
end

local _ = function(p13) --[[ line: 188 | named "buildOnFlowComplete" ]]
	-- upvalues: closeCentralOverlay (ref)
	return function() --[[ line: 189 ]]
		-- upvalues: p13 (ref), closeCentralOverlay (copy)
		p13(closeCentralOverlay())
	end
end

local function normalizeProductPayload(p14, p15) --[[ line: 197 ]]
	-- upvalues: productKind (ref)
	if (p15 == productKind.Gamepass or p15 == productKind.Product) and typeof(p14.id) == "string" then
		local var18 = tonumber(p14.id)
		
		if var18 ~= nil then
			p14.id = var18
		end
	end
	if p15 == productKind.DeveloperSubscription then
		local expectedPrice = p14.expectedPrice
		
		if typeof(expectedPrice) == "string" then
			expectedPrice = tonumber(expectedPrice) or 0
			p14.expectedPrice = expectedPrice
		end
		if p14.isSubscriptionInRobux == nil then
			p14.isSubscriptionInRobux = typeof(expectedPrice) == "number" and expectedPrice > 0
		end
	end
end

local t = {
	[productPurchaseSurface.HomePageGameItemShop] = "homePageGameItemShop"
}

local function buildPurchasePayload(p16) --[[ line: 223 ]]
	-- upvalues: httpService (ref)
	return httpService:JSONEncode({
		surface = { scopeType = "lua", location = { locationType = p16 } }
	})
end

return function(p17, p18, p19) --[[ line: 234 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiDevStoreSeeAllSupport (ref), normalizeProductPayload (ref), enablePurchasePayloadForSduiPurchase (ref), t (ref), buildPurchasePayload (ref), purchasePromptLiteModule (ref), timeToInteractiveTracker (ref), setCentralOverlay (ref), centralOverlayType (ref), buildOnPurchaseSuccess (ref), promiseModule (ref), mapPriceDiscountDetails (ref), closeCentralOverlay (ref), enableJoinAfterBuyFromEDP (ref), productPurchaseSurface (ref), experienceService (ref), fFlagEnableLaunchAfterPurchase (ref), sduiCoreSystemModule (ref), sduiReportGamePlayIntent (ref)
	local logger = p19.dependencies.logger
	local appPage = p19.appPage
	local dispatch = p19.dependencies.dispatch
	local actionParams = p17 and p17.actionParams
	
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
		local var22 = t[surface]
		
		if var22 ~= nil then
			productPayload.purchasePayload = buildPurchasePayload(var22)
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
			fetchProductInfo = if displayInfo == nil then nil else function() --[[ line: 64 ]]
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
			onFlowComplete = function() --[[ line: 189 ]]
				-- upvalues: dispatch (ref), closeCentralOverlay (copy)
				dispatch(closeCentralOverlay())
			end,
			onPurchaseComplete = if enableJoinAfterBuyFromEDP and surface == productPurchaseSurface.EDP and rootPlaceId then function() --[[ line: 142 ]]
				-- upvalues: experienceService (copy), rootPlaceId (ref), dispatch (ref), closeCentralOverlay (copy)
				experienceService:LaunchExperience({ placeId = tonumber(rootPlaceId) })
				dispatch(closeCentralOverlay())
			end else nil,
			onLaunchAfterPurchase = if fFlagEnableLaunchAfterPurchase then function() --[[ line: 158 ]]
				-- upvalues: p19 (ref), rootPlaceId (ref), sduiErrorType (copy), sduiActionType (copy), sduiCoreSystemModule (copy), p18 (ref), sduiReportGamePlayIntent (copy)
				local logger = p19.dependencies.logger
				
				if rootPlaceId == nil then
					logger.reportError(sduiErrorType.InvalidActionParams, {
						message = "Missing rootPlaceId for launch-after-purchase play attribution",
						name = sduiActionType.OpenPurchasePrompt
					}, p19.appPage)
					
					return
				end
				local universeId = sduiCoreSystemModule.findAnalyticsFieldInAncestors("universeId", p18)
				
				if universeId == nil or tostring(universeId) == "" then
					logger.reportError(sduiErrorType.InvalidActionParams, {
						message = "Missing universeId for launch-after-purchase play attribution",
						name = sduiActionType.OpenPurchasePrompt
					}, p19.appPage)
					
					return
				end
				sduiReportGamePlayIntent({
					actionType = "PlayAfterPurchase",
					sduiContext = p19,
					analyticsContext = p18,
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