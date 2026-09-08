local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local inExperienceOffersModule = require(parent.InExperienceOffers)
local promiseModule = require(purchasePrompt.Promise)
local networkModule = require(purchasePrompt.Services.Network)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local thunkModule = require(purchasePrompt.Thunk)
local _ = require(purchasePrompt.types)
local postInGameItemCartPricingModule = require(purchasePrompt.Network.postInGameItemCartPricing)
local mockPostInGameItemCartPricingModule = require(purchasePrompt.Mocks.MockPostInGameItemCartPricing)
local fFlagMockCartPricingResponseInStudioModule = require(purchasePrompt.Flags.FFlagMockCartPricingResponseInStudio)
local getInGameItemCartPricingRequestedItemsModule = require(purchasePrompt.Utils.getInGameItemCartPricingRequestedItems)
local getInGameItemProductIdentifierModule = require(purchasePrompt.Utils.getInGameItemProductIdentifier)
local getFeatureKeyForSurfaceModule = require(purchasePrompt.Utils.getFeatureKeyForSurface)
local getProductTypeFromRequestTypeModule = require(purchasePrompt.Utils.getProductTypeFromRequestType)
local logUnifiedPurchaseTelemetryCounterModule = require(purchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local unifiedPurchaseTelemetryModule = require(purchasePrompt.Events.UnifiedPurchaseTelemetry)
local setCartPricingFetchingModule = require(purchasePrompt.Actions.SetCartPricingFetching)
local setCartPricingResponseModule = require(purchasePrompt.Actions.SetCartPricingResponse)
local setCartPricingFetchFailedModule = require(purchasePrompt.Actions.SetCartPricingFetchFailed)
local var1 = if fFlagMockCartPricingResponseInStudioModule then { networkModule, externalSettingsModule } else { networkModule }

local function resolveProductIdentifier(p1)
	-- upvalues: getInGameItemProductIdentifierModule (ref)
	local promptRequest = p1.promptRequest
	
	return if promptRequest == nil then nil else getInGameItemProductIdentifierModule(promptRequest.infoType, promptRequest.id)
end

return function(p1)
	-- upvalues: thunkModule (ref), var1 (ref), networkModule (ref), fFlagMockCartPricingResponseInStudioModule (ref), externalSettingsModule (ref), mockPostInGameItemCartPricingModule (ref), postInGameItemCartPricingModule (ref), getInGameItemCartPricingRequestedItemsModule (ref), resolveProductIdentifier (ref), promiseModule (ref), playersService (ref), getFeatureKeyForSurfaceModule (ref), inExperienceOffersModule (ref), getProductTypeFromRequestTypeModule (ref), httpService (ref), setCartPricingFetchingModule (ref), setCartPricingFetchFailedModule (ref), setCartPricingResponseModule (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref)
	return thunkModule.new(script.Name, var1, function(p2, p3)
		-- upvalues: networkModule (copy), fFlagMockCartPricingResponseInStudioModule (copy), externalSettingsModule (copy), mockPostInGameItemCartPricingModule (copy), postInGameItemCartPricingModule (copy), getInGameItemCartPricingRequestedItemsModule (copy), resolveProductIdentifier (copy), promiseModule (copy), playersService (copy), getFeatureKeyForSurfaceModule (copy), inExperienceOffersModule (copy), getProductTypeFromRequestTypeModule (copy), httpService (copy), setCartPricingFetchingModule (copy), p1 (ref), setCartPricingFetchFailedModule (copy), setCartPricingResponseModule (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy)
		local var2 = p3[networkModule]
		local state = p2:getState()
		local var3 = fFlagMockCartPricingResponseInStudioModule and p3[externalSettingsModule].isStudio()
		local var4 = if var3 then mockPostInGameItemCartPricingModule else postInGameItemCartPricingModule
		local var5 = getInGameItemCartPricingRequestedItemsModule(resolveProductIdentifier(state))
		
		if var5 == nil or #var5 == 0 then
			return promiseModule.resolve(nil)
		end
		local userId = playersService.LocalPlayer.UserId
		local purchaseAnalyticsMetadata = state.purchaseAnalyticsMetadata
		local surface = purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.surface
		local var6 = getFeatureKeyForSurfaceModule(surface)
		
		if var3 or inExperienceOffersModule.Utils.getOffersForKey(inExperienceOffersModule.getOffersStore(false).getOffers(false), var6, inExperienceOffersModule.OfferStatuses.Available) ~= nil then
			local var7 = getProductTypeFromRequestTypeModule(state.promptRequest.requestType)
			local var8 = httpService:GenerateGUID(false)
			p2:dispatch(setCartPricingFetchingModule(var8))
			
			local function _()
				-- upvalues: p2 (ref), var8 (ref)
				local cartPricing = p2:getState().cartPricing
				
				return cartPricing ~= nil and cartPricing.requestId == var8
			end
			
			return var4(var2, userId, var6, var5, p1, surface, var7):andThen(function(p4)
				-- upvalues: p2 (ref), var8 (ref), setCartPricingFetchFailedModule (copy), setCartPricingResponseModule (copy)
				local cartPricing = p2:getState().cartPricing
				
				if not (cartPricing ~= nil and cartPricing.requestId == var8) then
					return nil
				elseif p4 == nil then
					p2:dispatch(setCartPricingFetchFailedModule())
					
					return nil
				end
				p2:dispatch(setCartPricingResponseModule(p4))
				
				return p4
			end):catch(function()
				-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), surface (ref), var7 (ref), p2 (ref), var8 (ref), setCartPricingFetchFailedModule (copy)
				logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingHandlerErrorCounter, surface, var7)
				local cartPricing = p2:getState().cartPricing
				
				if cartPricing ~= nil and cartPricing.requestId == var8 then
					p2:dispatch(setCartPricingFetchFailedModule())
				end
			end)
		end
		return promiseModule.resolve(nil)
	end)
end