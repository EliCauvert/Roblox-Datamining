local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local HttpService = game:GetService("HttpService")
local NetworkModule = require(PurchasePrompt.Services.Network)
local ThunkModule = require(PurchasePrompt.Thunk)
local PostCartPricingModule = require(PurchasePrompt.Network.postCartPricing)
local GetCartPricingRequestedItemsForCartPricingModule = require(PurchasePrompt.Utils.getCartPricingRequestedItemsForCartPricing)
local LogUnifiedPurchaseTelemetryCounterModule = require(PurchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local UnifiedPurchaseTelemetryModule = require(PurchasePrompt.Events.UnifiedPurchaseTelemetry)
local SetCartPricingFetchingModule = require(PurchasePrompt.Actions.SetCartPricingFetching)
local SetCartPricingResponseModule = require(PurchasePrompt.Actions.SetCartPricingResponse)
local SetCartPricingFetchFailedModule = require(PurchasePrompt.Actions.SetCartPricingFetchFailed)
local list = { NetworkModule }

local function _(p1)
	local ProductInfo = p1.productInfo
	
	if ProductInfo == nil or type(ProductInfo.collectibleItemId) ~= "string" or ProductInfo.collectibleItemId == "" then
		local PromptRequest = p1.promptRequest
		local CollectibleItemId = PromptRequest and PromptRequest.collectibleItemId
		
		return if type(CollectibleItemId) == "string" and CollectibleItemId ~= "" then CollectibleItemId else nil
	else
		return ProductInfo.collectibleItemId
	end
end

return function(p1)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), GetCartPricingRequestedItemsForCartPricingModule (copy), HttpService (copy), SetCartPricingFetchingModule (copy), PostCartPricingModule (copy), SetCartPricingFetchFailedModule (copy), SetCartPricingResponseModule (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: NetworkModule (upval), GetCartPricingRequestedItemsForCartPricingModule (upval), HttpService (upval), SetCartPricingFetchingModule (upval), PostCartPricingModule (upval), p1 (copy), SetCartPricingFetchFailedModule (upval), SetCartPricingResponseModule (upval), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval)
		local v1 = p3[NetworkModule]
		local State = p2:getState()
		local PurchaseOptions = State.purchaseOptions
		
		if PurchaseOptions == nil or not PurchaseOptions.shouldFetchCartPricing then
			return nil
		end
		local ProductInfo = State.productInfo
		local CollectibleItemId1 = nil
		
		if ProductInfo == nil or type(ProductInfo.collectibleItemId) ~= "string" or ProductInfo.collectibleItemId == "" then
			local PromptRequest = State.promptRequest
			local CollectibleItemId = PromptRequest and PromptRequest.collectibleItemId
			CollectibleItemId1 = if type(CollectibleItemId) == "string" and CollectibleItemId ~= "" then CollectibleItemId else nil
		else
			CollectibleItemId1 = ProductInfo.collectibleItemId
		end
		local CartPricingRequestedItemsForCartPricingModule = GetCartPricingRequestedItemsForCartPricingModule(CollectibleItemId1, State.productPayload, State.productInfo)
		
		if CartPricingRequestedItemsForCartPricingModule == nil or #CartPricingRequestedItemsForCartPricingModule == 0 then
			return nil
		else
			local PurchaseAnalyticsMetadata = State.purchaseAnalyticsMetadata
			local Surface = PurchaseAnalyticsMetadata and PurchaseAnalyticsMetadata.surface
			local ProductType = PurchaseAnalyticsMetadata and PurchaseAnalyticsMetadata.productType
			local Guid = HttpService:GenerateGUID(false)
			p2:dispatch(SetCartPricingFetchingModule(Guid))
			
			local function _(): boolean
				-- upvalues: p2 (copy), Guid (copy)
				local CartPricing = p2:getState().cartPricing
				
				return CartPricing ~= nil and CartPricing.requestId == Guid
			end
			
			return PostCartPricingModule(v1, CartPricingRequestedItemsForCartPricingModule, p1, Surface, ProductType):andThen(function(Result)
				-- upvalues: p2 (copy), Guid (copy), SetCartPricingFetchFailedModule (upval), SetCartPricingResponseModule (upval)
				local CartPricing = p2:getState().cartPricing
				
				if CartPricing == nil or CartPricing.requestId ~= Guid then
					return nil
				elseif Result == nil then
					p2:dispatch(SetCartPricingFetchFailedModule())
					
					return nil
				else
					p2:dispatch(SetCartPricingResponseModule(Result))
					
					return Result
				end
			end):catch(function()
				-- upvalues: LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), Surface (copy), ProductType (copy), p2 (copy), Guid (copy), SetCartPricingFetchFailedModule (upval)
				LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedCartPricingHandlerErrorCounter, Surface, ProductType)
				local CartPricing = p2:getState().cartPricing
				
				if CartPricing ~= nil and CartPricing.requestId == Guid then
					p2:dispatch(SetCartPricingFetchFailedModule())
				end
			end)
		end
	end)
end