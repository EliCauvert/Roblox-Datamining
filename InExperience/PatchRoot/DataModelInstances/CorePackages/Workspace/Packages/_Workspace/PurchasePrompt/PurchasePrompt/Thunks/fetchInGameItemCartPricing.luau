local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local productPurchaseSurface = require(parent.PurchasePromptLite).Enums.ProductPurchaseSurface
local promiseModule = require(purchasePrompt.Promise)
local networkModule = require(purchasePrompt.Services.Network)
local thunkModule = require(purchasePrompt.Thunk)
local _ = require(purchasePrompt.types)
local postInGameItemCartPricingModule = require(purchasePrompt.Network.postInGameItemCartPricing)
local getInGameItemCartPricingRequestedItemsModule = require(purchasePrompt.Utils.getInGameItemCartPricingRequestedItems)
local getInGameItemProductIdentifierModule = require(purchasePrompt.Utils.getInGameItemProductIdentifier)
local getProductTypeFromRequestTypeModule = require(purchasePrompt.Utils.getProductTypeFromRequestType)
local logUnifiedPurchaseTelemetryCounterModule = require(purchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local unifiedPurchaseTelemetryModule = require(purchasePrompt.Events.UnifiedPurchaseTelemetry)
local setCartPricingFetchingModule = require(purchasePrompt.Actions.SetCartPricingFetching)
local setCartPricingResponseModule = require(purchasePrompt.Actions.SetCartPricingResponse)
local setCartPricingFetchFailedModule = require(purchasePrompt.Actions.SetCartPricingFetchFailed)
local list = {
	productPurchaseSurface.InExperienceShopHome,
	productPurchaseSurface.InExperienceShopSearch,
	productPurchaseSurface.InExperienceShopDetails
}

local function _(p1)
	-- upvalues: list (ref)
	return if p1 == nil or table.find(list, p1) == nil then "DEVELOPER_SHOP" else "ROBLOX_SHOP"
end

local list_1 = { networkModule }

local function resolveProductIdentifier(p1)
	-- upvalues: getInGameItemProductIdentifierModule (ref)
	local promptRequest = p1.promptRequest
	
	return if promptRequest == nil then nil else getInGameItemProductIdentifierModule(promptRequest.infoType, promptRequest.id)
end

return function(p1)
	-- upvalues: thunkModule (ref), list_1 (ref), networkModule (ref), getInGameItemCartPricingRequestedItemsModule (ref), resolveProductIdentifier (ref), promiseModule (ref), playersService (ref), list (ref), getProductTypeFromRequestTypeModule (ref), httpService (ref), setCartPricingFetchingModule (ref), postInGameItemCartPricingModule (ref), setCartPricingFetchFailedModule (ref), setCartPricingResponseModule (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref)
	return thunkModule.new(script.Name, list_1, function(p2, p3)
		-- upvalues: networkModule (copy), getInGameItemCartPricingRequestedItemsModule (copy), resolveProductIdentifier (copy), promiseModule (copy), playersService (copy), list (copy), getProductTypeFromRequestTypeModule (copy), httpService (copy), setCartPricingFetchingModule (copy), postInGameItemCartPricingModule (copy), p1 (ref), setCartPricingFetchFailedModule (copy), setCartPricingResponseModule (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy)
		local var1 = p3[networkModule]
		local state = p2:getState()
		local var2 = getInGameItemCartPricingRequestedItemsModule(resolveProductIdentifier(state))
		
		if var2 == nil or #var2 == 0 then
			return promiseModule.resolve(nil)
		end
		local userId = playersService.LocalPlayer.UserId
		local purchaseAnalyticsMetadata = state.purchaseAnalyticsMetadata
		local surface = purchaseAnalyticsMetadata and purchaseAnalyticsMetadata.surface
		local var3 = if surface == nil or table.find(list, surface) == nil then "DEVELOPER_SHOP" else "ROBLOX_SHOP"
		local var4 = getProductTypeFromRequestTypeModule(state.promptRequest.requestType)
		local var5 = httpService:GenerateGUID(false)
		p2:dispatch(setCartPricingFetchingModule(var5))
		
		local function _()
			-- upvalues: p2 (ref), var5 (ref)
			local cartPricing = p2:getState().cartPricing
			
			return cartPricing ~= nil and cartPricing.requestId == var5
		end
		
		return postInGameItemCartPricingModule(var1, userId, var3, var2, p1, surface, var4):andThen(function(p4)
			-- upvalues: p2 (ref), var5 (ref), setCartPricingFetchFailedModule (copy), setCartPricingResponseModule (copy)
			local cartPricing = p2:getState().cartPricing
			
			if not (cartPricing ~= nil and cartPricing.requestId == var5) then
				return nil
			elseif p4 == nil then
				p2:dispatch(setCartPricingFetchFailedModule())
				
				return nil
			end
			p2:dispatch(setCartPricingResponseModule(p4))
			
			return p4
		end):catch(function()
			-- upvalues: logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), surface (ref), var4 (ref), p2 (ref), var5 (ref), setCartPricingFetchFailedModule (copy)
			logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedCartPricingHandlerErrorCounter, surface, var4)
			local cartPricing = p2:getState().cartPricing
			
			if cartPricing ~= nil and cartPricing.requestId == var5 then
				p2:dispatch(setCartPricingFetchFailedModule())
			end
		end)
	end)
end