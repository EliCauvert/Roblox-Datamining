local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local httpService = game:GetService("HttpService")
local promiseModule = require(purchasePrompt.Promise)
local networkModule = require(purchasePrompt.Services.Network)
local thunkModule = require(purchasePrompt.Thunk)
local postCartPricingModule = require(purchasePrompt.Network.postCartPricing)
local getCartPricingRequestedItemsForCartPricingModule = require(purchasePrompt.Utils.getCartPricingRequestedItemsForCartPricing)
local getProductTypeFromRequestTypeModule = require(purchasePrompt.Utils.getProductTypeFromRequestType)
local logUnifiedPurchaseTelemetryCounterModule = require(purchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local unifiedPurchaseTelemetryModule = require(purchasePrompt.Events.UnifiedPurchaseTelemetry)
local fFlagPurchasePromptOfferMarginUpsellEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptOfferMarginUpsellEnabled)
local fFlagEnableFetchCartPricingDuringInExperience = require(purchasePrompt.Parent.SharedFlags).FFlagEnableFetchCartPricingDuringInExperience
local setCartPricingFetchingModule = require(purchasePrompt.Actions.SetCartPricingFetching)
local setCartPricingResponseModule = require(purchasePrompt.Actions.SetCartPricingResponse)
local setCartPricingFetchFailedModule = require(purchasePrompt.Actions.SetCartPricingFetchFailed)
local list = { networkModule }

local function _(p0)
	local productInfo = p0.productInfo
	
	if productInfo ~= nil and type(productInfo.collectibleItemId) == "string" and productInfo.collectibleItemId ~= "" then
		return productInfo.collectibleItemId
	end
	local promptRequest = p0.promptRequest
	local collectibleItemId = promptRequest and promptRequest.collectibleItemId
	
	return if type(collectibleItemId) == "string" and collectibleItemId ~= "" then collectibleItemId else nil
end

return function(p1, p2)
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), fFlagEnableFetchCartPricingDuringInExperience (ref), getCartPricingRequestedItemsForCartPricingModule (ref), promiseModule (ref), fFlagPurchasePromptOfferMarginUpsellEnabledModule (ref), getProductTypeFromRequestTypeModule (ref), httpService (ref), setCartPricingFetchingModule (ref), postCartPricingModule (ref), setCartPricingFetchFailedModule (ref), setCartPricingResponseModule (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref)
	return thunkModule.new(script.Name, list, function(p3, p4)
		-- upvalues: networkModule (copy), fFlagEnableFetchCartPricingDuringInExperience (copy), getCartPricingRequestedItemsForCartPricingModule (copy), p2 (ref), promiseModule (copy), fFlagPurchasePromptOfferMarginUpsellEnabledModule (copy), getProductTypeFromRequestTypeModule (copy), httpService (copy), setCartPricingFetchingModule (copy), postCartPricingModule (copy), p1 (ref), setCartPricingFetchFailedModule (copy), setCartPricingResponseModule (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy)
		local purchaseOptions
		local var16 = p4[networkModule]
		local state = p3:getState()
		
		if not fFlagEnableFetchCartPricingDuringInExperience then
			local var18, productInfo, collectibleItemId
			purchaseOptions = state.purchaseOptions
			
			if purchaseOptions == nil or not purchaseOptions.shouldFetchCartPricing then
				return nil
			elseif fFlagEnableFetchCartPricingDuringInExperience then
				var18 = p2
				
				if not var18 then
					productInfo = state.productInfo
					
					if productInfo == nil or type(productInfo.collectibleItemId) ~= "string" or productInfo.collectibleItemId == "" then
						local promptRequest = state.promptRequest
						collectibleItemId = promptRequest and promptRequest.collectibleItemId
						var18 = if type(collectibleItemId) == "string" and collectibleItemId ~= "" then collectibleItemId else nil
					else
						var18 = productInfo.collectibleItemId
					end
				end
			else
				productInfo = state.productInfo
				
				if productInfo == nil or type(productInfo.collectibleItemId) ~= "string" or productInfo.collectibleItemId == "" then
					local promptRequest = state.promptRequest
					collectibleItemId = promptRequest and promptRequest.collectibleItemId
					var18 = if type(collectibleItemId) == "string" and collectibleItemId ~= "" then collectibleItemId else nil
				else
					var18 = productInfo.collectibleItemId
				end
			end
			purchaseOptions = getCartPricingRequestedItemsForCartPricingModule(var18, state.productPayload, state.productInfo)
			
			if purchaseOptions == nil or #purchaseOptions == 0 then
				return if fFlagEnableFetchCartPricingDuringInExperience then promiseModule.resolve(nil) else nil
			end
			local purchaseAnalyticsMetadata = state.purchaseAnalyticsMetadata
			productInfo = purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.surface
			local var20 = if fFlagPurchasePromptOfferMarginUpsellEnabledModule then getProductTypeFromRequestTypeModule(state.promptRequest.requestType) else purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.productType
			collectibleItemId = httpService:GenerateGUID(false)
			p3:dispatch(setCartPricingFetchingModule(collectibleItemId))
			
			local function _()
				-- upvalues: p3 (ref), collectibleItemId (ref)
				local cartPricing = p3:getState().cartPricing
				
				return cartPricing ~= nil and cartPricing.requestId == collectibleItemId
			end
			
			return postCartPricingModule(var16, purchaseOptions, p1, productInfo, var20):andThen(function(p5)
				-- upvalues: p3 (ref), collectibleItemId (ref), setCartPricingFetchFailedModule (copy), setCartPricingResponseModule (copy)
				local cartPricing = p3:getState().cartPricing
				
				if not (cartPricing ~= nil and cartPricing.requestId == collectibleItemId) then
					return nil
				elseif p5 == nil then
					p3:dispatch(setCartPricingFetchFailedModule())
					
					return nil
				end
				p3:dispatch(setCartPricingResponseModule(p5))
				
				return p5
			end):catch(function()
				-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), productInfo (ref), var20 (ref), p3 (ref), collectibleItemId (ref), setCartPricingFetchFailedModule (copy)
				logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingHandlerErrorCounter, productInfo, var20)
				local cartPricing = p3:getState().cartPricing
				
				if cartPricing ~= nil and cartPricing.requestId == collectibleItemId then
					p3:dispatch(setCartPricingFetchFailedModule())
				end
			end)
		end
	end)
end