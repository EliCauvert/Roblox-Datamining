local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local HttpService = game:GetService("HttpService")
local PromiseModule = require(PurchasePrompt.Promise)
local NetworkModule = require(PurchasePrompt.Services.Network)
local ThunkModule = require(PurchasePrompt.Thunk)
local PostCartPricingModule = require(PurchasePrompt.Network.postCartPricing)
local GetCartPricingRequestedItemsForCartPricingModule = require(PurchasePrompt.Utils.getCartPricingRequestedItemsForCartPricing)
local GetProductTypeFromRequestTypeModule = require(PurchasePrompt.Utils.getProductTypeFromRequestType)
local LogUnifiedPurchaseTelemetryCounterModule = require(PurchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local UnifiedPurchaseTelemetryModule = require(PurchasePrompt.Events.UnifiedPurchaseTelemetry)
local FFlagEnableFetchCartPricingDuringInExperience = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableFetchCartPricingDuringInExperience
local DisableInExpMarketplaceOffersTemp = game:DefineFastFlag("DisableInExpMarketplaceOffersTemp", false)
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

return function(p1, CollectibleItemId)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), FFlagEnableFetchCartPricingDuringInExperience (copy), GetCartPricingRequestedItemsForCartPricingModule (copy), PromiseModule (copy), GetProductTypeFromRequestTypeModule (copy), HttpService (copy), SetCartPricingFetchingModule (copy), PostCartPricingModule (copy), DisableInExpMarketplaceOffersTemp (copy), SetCartPricingFetchFailedModule (copy), SetCartPricingResponseModule (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: NetworkModule (upval), FFlagEnableFetchCartPricingDuringInExperience (upval), GetCartPricingRequestedItemsForCartPricingModule (upval), CollectibleItemId (copy), PromiseModule (upval), GetProductTypeFromRequestTypeModule (upval), HttpService (upval), SetCartPricingFetchingModule (upval), PostCartPricingModule (upval), p1 (copy), DisableInExpMarketplaceOffersTemp (upval), SetCartPricingFetchFailedModule (upval), SetCartPricingResponseModule (upval), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval)
		local v1 = p3[NetworkModule]
		local State = p2:getState()
		
		if not FFlagEnableFetchCartPricingDuringInExperience then
			local PurchaseOptions = State.purchaseOptions
			
			if PurchaseOptions == nil or not PurchaseOptions.shouldFetchCartPricing then
				return nil
			end
		end
		local CollectibleItemId1 = nil
		if FFlagEnableFetchCartPricingDuringInExperience then
			CollectibleItemId1 = CollectibleItemId
			
			if not CollectibleItemId1 then
				local ProductInfo1 = State.productInfo
				
				if ProductInfo1 == nil or type(ProductInfo1.collectibleItemId) ~= "string" or ProductInfo1.collectibleItemId == "" then
					local PromptRequest = State.promptRequest
					local CollectibleItemId2 = PromptRequest and PromptRequest.collectibleItemId
					CollectibleItemId1 = if type(CollectibleItemId2) == "string" and CollectibleItemId2 ~= "" then CollectibleItemId2 else nil
				else
					CollectibleItemId1 = ProductInfo1.collectibleItemId
				end
			end
		else
			local ProductInfo = State.productInfo
			
			if ProductInfo == nil or type(ProductInfo.collectibleItemId) ~= "string" or ProductInfo.collectibleItemId == "" then
				local PromptRequest = State.promptRequest
				local CollectibleItemId3 = PromptRequest and PromptRequest.collectibleItemId
				CollectibleItemId1 = if type(CollectibleItemId3) == "string" and CollectibleItemId3 ~= "" then CollectibleItemId3 else nil
			else
				CollectibleItemId1 = ProductInfo.collectibleItemId
			end
		end
		local CartPricingRequestedItemsForCartPricingModule = GetCartPricingRequestedItemsForCartPricingModule(CollectibleItemId1, State.productPayload, State.productInfo)
		
		if CartPricingRequestedItemsForCartPricingModule == nil or #CartPricingRequestedItemsForCartPricingModule == 0 then
			return if FFlagEnableFetchCartPricingDuringInExperience then PromiseModule.resolve(nil) else nil
		else
			local PurchaseAnalyticsMetadata = State.purchaseAnalyticsMetadata
			local Surface = PurchaseAnalyticsMetadata and PurchaseAnalyticsMetadata.surface
			local ProductTypeFromRequestTypeModule = GetProductTypeFromRequestTypeModule(State.promptRequest.requestType)
			local Guid = HttpService:GenerateGUID(false)
			p2:dispatch(SetCartPricingFetchingModule(Guid))
			
			local function _(): boolean
				-- upvalues: p2 (copy), Guid (copy)
				local CartPricing = p2:getState().cartPricing
				
				return CartPricing ~= nil and CartPricing.requestId == Guid
			end
			
			return PostCartPricingModule(v1, CartPricingRequestedItemsForCartPricingModule, p1, Surface, ProductTypeFromRequestTypeModule):andThen(function(Result)
				-- upvalues: DisableInExpMarketplaceOffersTemp (upval), CollectibleItemId (upval), p2 (copy), SetCartPricingFetchFailedModule (upval), Guid (copy), SetCartPricingResponseModule (upval)
				if DisableInExpMarketplaceOffersTemp and CollectibleItemId then
					p2:dispatch(SetCartPricingFetchFailedModule())
					
					return nil
				end
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
				-- upvalues: LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), Surface (copy), ProductTypeFromRequestTypeModule (copy), p2 (copy), Guid (copy), SetCartPricingFetchFailedModule (upval)
				LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedCartPricingHandlerErrorCounter, Surface, ProductTypeFromRequestTypeModule)
				local CartPricing = p2:getState().cartPricing
				
				if CartPricing ~= nil and CartPricing.requestId == Guid then
					p2:dispatch(SetCartPricingFetchFailedModule())
				end
			end)
		end
	end)
end