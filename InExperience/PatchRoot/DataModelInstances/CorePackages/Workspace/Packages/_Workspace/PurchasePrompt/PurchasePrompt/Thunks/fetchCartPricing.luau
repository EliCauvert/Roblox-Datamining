local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local httpService = game:GetService("HttpService")
local networkModule = require(purchasePrompt.Services.Network)
local thunkModule = require(purchasePrompt.Thunk)
local postCartPricingModule = require(purchasePrompt.Network.postCartPricing)
local getCartPricingRequestedItemsForCartPricingModule = require(purchasePrompt.Utils.getCartPricingRequestedItemsForCartPricing)
local logUnifiedPurchaseTelemetryCounterModule = require(purchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local unifiedPurchaseTelemetryModule = require(purchasePrompt.Events.UnifiedPurchaseTelemetry)
local setCartPricingFetchingModule = require(purchasePrompt.Actions.SetCartPricingFetching)
local setCartPricingResponseModule = require(purchasePrompt.Actions.SetCartPricingResponse)
local setCartPricingFetchFailedModule = require(purchasePrompt.Actions.SetCartPricingFetchFailed)
local list = { networkModule }

local function _(p0) --[[ line: 31 | named "resolveCollectibleItemId" ]]
	local productInfo = p0.productInfo
	
	if productInfo ~= nil and type(productInfo.collectibleItemId) == "string" and productInfo.collectibleItemId ~= "" then
		return productInfo.collectibleItemId
	end
	local promptRequest = p0.promptRequest
	local collectibleItemId = promptRequest and promptRequest.collectibleItemId
	
	return if type(collectibleItemId) == "string" and collectibleItemId ~= "" then collectibleItemId else nil
end

return function(p1) --[[ line: 48 | named "fetchCartPricing" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), getCartPricingRequestedItemsForCartPricingModule (ref), httpService (ref), setCartPricingFetchingModule (ref), postCartPricingModule (ref), setCartPricingFetchFailedModule (ref), setCartPricingResponseModule (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref)
	return thunkModule.new(script.Name, list, function(p2, p3) --[[ line: 49 ]]
		-- upvalues: networkModule (copy), getCartPricingRequestedItemsForCartPricingModule (copy), httpService (copy), setCartPricingFetchingModule (copy), postCartPricingModule (copy), p1 (ref), setCartPricingFetchFailedModule (copy), setCartPricingResponseModule (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy)
		local var13 = p3[networkModule]
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
		local var16 = getCartPricingRequestedItemsForCartPricingModule(collectibleItemId, state.productPayload, state.productInfo)
		
		if var16 == nil or #var16 == 0 then
			return nil
		end
		local purchaseAnalyticsMetadata = state.purchaseAnalyticsMetadata
		productInfo = purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.surface
		local productType = purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.productType
		collectibleItemId_1 = httpService:GenerateGUID(false)
		p2:dispatch(setCartPricingFetchingModule(collectibleItemId_1))
		
		local function _() --[[ line: 76 | named "isCurrentRequest" ]]
			-- upvalues: p2 (ref), collectibleItemId_1 (ref)
			local cartPricing = p2:getState().cartPricing
			
			return cartPricing ~= nil and cartPricing.requestId == collectibleItemId_1
		end
		
		return postCartPricingModule(var13, var16, p1, productInfo, productType):andThen(function(p4) --[[ line: 82 ]]
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
		end):catch(function() --[[ line: 96 ]]
			-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), productInfo (ref), productType (ref), p2 (ref), collectibleItemId_1 (ref), setCartPricingFetchFailedModule (copy)
			logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingHandlerErrorCounter, productInfo, productType)
			local cartPricing = p2:getState().cartPricing
			
			if cartPricing ~= nil and cartPricing.requestId == collectibleItemId_1 then
				p2:dispatch(setCartPricingFetchFailedModule())
			end
		end)
	end)
end