local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local InExperienceOffersModule = require(PurchasePrompt.Parent.InExperienceOffers)
local PromiseModule = require(PurchasePrompt.Promise)
local NetworkModule = require(PurchasePrompt.Services.Network)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local ThunkModule = require(PurchasePrompt.Thunk)
local _ = require(PurchasePrompt.types)
local PostInGameItemCartPricingModule = require(PurchasePrompt.Network.postInGameItemCartPricing)
local MockPostInGameItemCartPricingModule = require(PurchasePrompt.Mocks.MockPostInGameItemCartPricing)
local FFlagMockCartPricingResponseInStudioModule = require(PurchasePrompt.Flags.FFlagMockCartPricingResponseInStudio)
local GetInGameItemCartPricingRequestedItemsModule = require(PurchasePrompt.Utils.getInGameItemCartPricingRequestedItems)
local GetInGameItemProductIdentifierModule = require(PurchasePrompt.Utils.getInGameItemProductIdentifier)
local GetFeatureKeyForSurfaceModule = require(PurchasePrompt.Utils.getFeatureKeyForSurface)
local GetProductTypeFromRequestTypeModule = require(PurchasePrompt.Utils.getProductTypeFromRequestType)
local LogUnifiedPurchaseTelemetryCounterModule = require(PurchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local UnifiedPurchaseTelemetryModule = require(PurchasePrompt.Events.UnifiedPurchaseTelemetry)
local SetCartPricingFetchingModule = require(PurchasePrompt.Actions.SetCartPricingFetching)
local SetCartPricingResponseModule = require(PurchasePrompt.Actions.SetCartPricingResponse)
local SetCartPricingFetchFailedModule = require(PurchasePrompt.Actions.SetCartPricingFetchFailed)
local List = if FFlagMockCartPricingResponseInStudioModule then { NetworkModule, ExternalSettingsModule } else { NetworkModule }

local function resolveProductIdentifier(State)
	-- upvalues: GetInGameItemProductIdentifierModule (copy)
	local PromptRequest = State.promptRequest
	
	return if PromptRequest == nil then nil else GetInGameItemProductIdentifierModule(PromptRequest.infoType, PromptRequest.id)
end

return function(p1)
	-- upvalues: ThunkModule (copy), List (copy), NetworkModule (copy), FFlagMockCartPricingResponseInStudioModule (copy), ExternalSettingsModule (copy), MockPostInGameItemCartPricingModule (copy), PostInGameItemCartPricingModule (copy), GetInGameItemCartPricingRequestedItemsModule (copy), resolveProductIdentifier (copy), PromiseModule (copy), Players (copy), GetFeatureKeyForSurfaceModule (copy), InExperienceOffersModule (copy), GetProductTypeFromRequestTypeModule (copy), HttpService (copy), SetCartPricingFetchingModule (copy), SetCartPricingFetchFailedModule (copy), SetCartPricingResponseModule (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy)
	return ThunkModule.new(script.Name, List, function(p2, p3)
		-- upvalues: NetworkModule (upval), FFlagMockCartPricingResponseInStudioModule (upval), ExternalSettingsModule (upval), MockPostInGameItemCartPricingModule (upval), PostInGameItemCartPricingModule (upval), GetInGameItemCartPricingRequestedItemsModule (upval), resolveProductIdentifier (upval), PromiseModule (upval), Players (upval), GetFeatureKeyForSurfaceModule (upval), InExperienceOffersModule (upval), GetProductTypeFromRequestTypeModule (upval), HttpService (upval), SetCartPricingFetchingModule (upval), p1 (copy), SetCartPricingFetchFailedModule (upval), SetCartPricingResponseModule (upval), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval)
		local v1 = p3[NetworkModule]
		local State = p2:getState()
		local IsStudio = FFlagMockCartPricingResponseInStudioModule and p3[ExternalSettingsModule].isStudio()
		local MockPostInGameItemCartPricingModule1 = if IsStudio then MockPostInGameItemCartPricingModule else PostInGameItemCartPricingModule
		local InGameItemCartPricingRequestedItemsModule = GetInGameItemCartPricingRequestedItemsModule(resolveProductIdentifier(State))
		
		if InGameItemCartPricingRequestedItemsModule == nil or #InGameItemCartPricingRequestedItemsModule == 0 then
			return PromiseModule.resolve(nil)
		end
		local UserId = Players.LocalPlayer.UserId
		local PurchaseAnalyticsMetadata = State.purchaseAnalyticsMetadata
		local Surface = PurchaseAnalyticsMetadata and PurchaseAnalyticsMetadata.surface
		local FeatureKeyForSurfaceModule = GetFeatureKeyForSurfaceModule(Surface)
		
		if IsStudio or InExperienceOffersModule.Utils.getOffersForKey(InExperienceOffersModule.getOffersStore(false).getOffers(false), FeatureKeyForSurfaceModule, InExperienceOffersModule.OfferStatuses.Available) ~= nil then
			local ProductTypeFromRequestTypeModule = GetProductTypeFromRequestTypeModule(State.promptRequest.requestType)
			local Guid = HttpService:GenerateGUID(false)
			p2:dispatch(SetCartPricingFetchingModule(Guid))
			
			local function _(): boolean
				-- upvalues: p2 (copy), Guid (copy)
				local CartPricing = p2:getState().cartPricing
				
				return CartPricing ~= nil and CartPricing.requestId == Guid
			end
			
			return MockPostInGameItemCartPricingModule1(v1, UserId, FeatureKeyForSurfaceModule, InGameItemCartPricingRequestedItemsModule, p1, Surface, ProductTypeFromRequestTypeModule):andThen(function(Result)
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
				-- upvalues: LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), Surface (copy), ProductTypeFromRequestTypeModule (copy), p2 (copy), Guid (copy), SetCartPricingFetchFailedModule (upval)
				LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedCartPricingHandlerErrorCounter, Surface, ProductTypeFromRequestTypeModule)
				local CartPricing = p2:getState().cartPricing
				
				if CartPricing ~= nil and CartPricing.requestId == Guid then
					p2:dispatch(SetCartPricingFetchFailedModule())
				end
			end)
		else
			return PromiseModule.resolve(nil)
		end
	end)
end