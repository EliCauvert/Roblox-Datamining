local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local httpService = game:GetService("HttpService")
local networkModule = require(purchasePrompt.Services.Network)
local thunkModule = require(purchasePrompt.Thunk)
local postCartPricingModule = require(purchasePrompt.Network.postCartPricing)
local getCartPricingRequestedItemsForCartPricingModule = require(purchasePrompt.Utils.getCartPricingRequestedItemsForCartPricing)
local getProductTypeFromRequestTypeModule = require(purchasePrompt.Utils.getProductTypeFromRequestType)
local logUnifiedPurchaseTelemetryCounterModule = require(purchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local unifiedPurchaseTelemetryModule = require(purchasePrompt.Events.UnifiedPurchaseTelemetry)
local fFlagPurchasePromptOfferMarginUpsellEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptOfferMarginUpsellEnabled)
local setCartPricingFetchingModule = require(purchasePrompt.Actions.SetCartPricingFetching)
local setCartPricingResponseModule = require(purchasePrompt.Actions.SetCartPricingResponse)
local setCartPricingFetchFailedModule = require(purchasePrompt.Actions.SetCartPricingFetchFailed)
local list = { networkModule }

local function _(p0) --[[ line: 33 | named "resolveCollectibleItemId" ]]
	local productInfo = p0.productInfo
	
	if productInfo ~= nil and type(productInfo.collectibleItemId) == "string" and productInfo.collectibleItemId ~= "" then
		return productInfo.collectibleItemId
	end
	local promptRequest = p0.promptRequest
	local collectibleItemId = promptRequest and promptRequest.collectibleItemId
	
	return if type(collectibleItemId) == "string" and collectibleItemId ~= "" then collectibleItemId else nil
end

return function(p1) --[[ line: 50 | named "fetchCartPricing" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), getCartPricingRequestedItemsForCartPricingModule (ref), fFlagPurchasePromptOfferMarginUpsellEnabledModule (ref), getProductTypeFromRequestTypeModule (ref), httpService (ref), setCartPricingFetchingModule (ref), postCartPricingModule (ref), setCartPricingFetchFailedModule (ref), setCartPricingResponseModule (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3) --[[ line: 51 ]]
		-- upvalues: networkModule (copy), getCartPricingRequestedItemsForCartPricingModule (copy), fFlagPurchasePromptOfferMarginUpsellEnabledModule (copy), getProductTypeFromRequestTypeModule (copy), httpService (copy), setCartPricingFetchingModule (copy), postCartPricingModule (copy), p1 (ref), setCartPricingFetchFailedModule (copy), setCartPricingResponseModule (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy)
		local var15 = p3[networkModule]
		local state = p2:getState()
		local purchaseOptions = state.purchaseOptions
		
		if purchaseOptions == nil or not purchaseOptions.shouldFetchCartPricing then
			return nil
		end
		local collectibleItemId_1, collectibleItemId
		local productInfo = state.productInfo
		
		if productInfo == nil or type(productInfo.collectibleItemId) ~= "string" or productInfo.collectibleItemId == "" then
			local promptRequest = state.promptRequest
			collectibleItemId_1 = promptRequest and promptRequest.collectibleItemId
			collectibleItemId = if type(collectibleItemId_1) == "string" and collectibleItemId_1 ~= "" then collectibleItemId_1 else nil
		else
			collectibleItemId = productInfo.collectibleItemId
		end
		local var18 = getCartPricingRequestedItemsForCartPricingModule(collectibleItemId, state.productPayload, state.productInfo)
		
		if var18 == nil or #var18 == 0 then
			return nil
		end
		local purchaseAnalyticsMetadata = state.purchaseAnalyticsMetadata
		productInfo = purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.surface
		local var19 = if fFlagPurchasePromptOfferMarginUpsellEnabledModule then getProductTypeFromRequestTypeModule(state.promptRequest.requestType) else purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.productType
		collectibleItemId_1 = httpService:GenerateGUID(false)
		p2:dispatch(setCartPricingFetchingModule(collectibleItemId_1))
		
		local function _() --[[ line: 83 | named "isCurrentRequest" ]]
			-- upvalues: p2 (ref), collectibleItemId_1 (ref)
			local cartPricing = p2:getState().cartPricing
			
			return cartPricing ~= nil and cartPricing.requestId == collectibleItemId_1
		end
		
		return postCartPricingModule(var15, var18, p1, productInfo, var19):andThen(function(p4) --[[ line: 89 ]]
			-- upvalues: p2 (ref), collectibleItemId_1 (ref), setCartPricingFetchFailedModule (copy), setCartPricingResponseModule (copy)
			local cartPricing = p2:getState().cartPricing
			
			if not (cartPricing ~= nil and cartPricing.requestId == collectibleItemId_1) then
				return nil
			elseif p4 == nil then
				p2:dispatch(setCartPricingFetchFailedModule())
				
				return nil
			end
			p2:dispatch(setCartPricingResponseModule(p4))
			
			return p4
		end):catch(function() --[[ line: 103 ]]
			-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), productInfo (ref), var19 (ref), p2 (ref), collectibleItemId_1 (ref), setCartPricingFetchFailedModule (copy)
			logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingHandlerErrorCounter, productInfo, var19)
			local cartPricing = p2:getState().cartPricing
			
			if cartPricing ~= nil and cartPricing.requestId == collectibleItemId_1 then
				p2:dispatch(setCartPricingFetchFailedModule())
			end
		end)
	end)
end