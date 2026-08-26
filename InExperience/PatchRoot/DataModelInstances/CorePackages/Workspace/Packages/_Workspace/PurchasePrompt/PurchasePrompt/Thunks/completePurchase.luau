local parent = script.Parent.Parent
local workspaceService = game:GetService("Workspace")
local _ = require(parent.types)
local setPromptStateModule = require(parent.Actions.SetPromptState)
local purchaseCompleteRecievedModule = require(parent.Actions.PurchaseCompleteRecieved)
local promptStateModule = require(parent.Enums.PromptState)
local thunkModule = require(parent.Thunk)
local completeRequestModule = require(parent.Thunks.completeRequest)
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local fFlagSkipCompletionModalForMarketplace = require(parent.Parent.SharedFlags).FFlagSkipCompletionModalForMarketplace
local AXEnsureOfferBannerRefetchUnified = game:DefineFastFlag("AXEnsureOfferBannerRefetchUnified", false)
local logUnifiedPurchaseTelemetryCounterModule = require(parent.Utils.logUnifiedPurchaseTelemetryCounter)
local unifiedPurchaseTelemetryModule = require(parent.Events.UnifiedPurchaseTelemetry)
local sendUnifiedPurchaseEventLogModule = require(parent.Utils.sendUnifiedPurchaseEventLog)
local unifiedPurchaseEventNameEnumModule = require(parent.Enums.UnifiedPurchaseEventNameEnum)

return function(p1)
	-- upvalues: thunkModule (ref), workspaceService (ref), purchaseCompleteRecievedModule (ref), AXEnsureOfferBannerRefetchUnified (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref), sendUnifiedPurchaseEventLogModule (ref), unifiedPurchaseEventNameEnumModule (ref), fFlagSkipCompletionModalForMarketplace (ref), setPromptStateModule (ref), promptStateModule (ref), completeRequestModule (ref)
	return thunkModule.new(script.Name, {}, function(p2, _)
		-- upvalues: workspaceService (copy), purchaseCompleteRecievedModule (copy), AXEnsureOfferBannerRefetchUnified (copy), fFlagEnableUnifiedProductPurchaseFlow (copy), p1 (ref), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), sendUnifiedPurchaseEventLogModule (copy), unifiedPurchaseEventNameEnumModule (copy), fFlagSkipCompletionModalForMarketplace (copy), setPromptStateModule (copy), promptStateModule (copy), completeRequestModule (copy)
		local var1 = workspaceService.DistributedGameTime - p2:getState().purchasingStartTime
		p2:dispatch(purchaseCompleteRecievedModule())
		
		if AXEnsureOfferBannerRefetchUnified then
			p2:flush()
		end
		if fFlagEnableUnifiedProductPurchaseFlow and p2:getState().isUserEligibleForUnifiedPurchaseFlow then
			local state = p2:getState()
			local postPurchaseActions = state.postPurchaseActions
			local postPurchaseActionsState = state.postPurchaseActionsState or {}
			
			if postPurchaseActions then
				for i, v in ipairs(postPurchaseActions) do
					if v and v.actionKey and v.isActionSelected ~= nil then
						postPurchaseActionsState[v.actionKey] = v.isActionSelected
					end
				end
			end
			if state.purchaseCallbacks and state.purchaseCallbacks.onPurchaseSuccess then
				state.purchaseCallbacks.onPurchaseSuccess(p1, postPurchaseActionsState)
			end
			if state.purchaseAnalyticsMetadata then
				local purchaseAnalyticsMetadata = state.purchaseAnalyticsMetadata
				logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalPurchaseSuccessCounter, purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata.productType)
				sendUnifiedPurchaseEventLogModule({
					event_name = unifiedPurchaseEventNameEnumModule.ItemPurchaseSuccess,
					purchase_flow_uuid = purchaseAnalyticsMetadata.purchaseFlowUUID,
					product_id = purchaseAnalyticsMetadata.productId,
					product_type = purchaseAnalyticsMetadata.productType,
					product_target_id = purchaseAnalyticsMetadata.productTargetId,
					robux_price = purchaseAnalyticsMetadata.price,
					surface = purchaseAnalyticsMetadata.surface,
					user_roblox_balance = purchaseAnalyticsMetadata.userRobuxBalance,
					salelocation_universeid = purchaseAnalyticsMetadata.saleLocationUniverseId
				})
			end
		end
		if fFlagSkipCompletionModalForMarketplace then
			local purchaseOptions = p2:getState().purchaseOptions
			
			if purchaseOptions and purchaseOptions.skipPurchaseSuccessModal then
				p2:dispatch(setPromptStateModule(promptStateModule.PurchaseComplete))
				
				return p2:dispatch(completeRequestModule())
			elseif var1 >= 1 then
				return p2:dispatch(setPromptStateModule(promptStateModule.PurchaseComplete))
			end
			delay(1 - var1, function()
				-- upvalues: p2 (ref), setPromptStateModule (copy), promptStateModule (copy)
				return p2:dispatch(setPromptStateModule(promptStateModule.PurchaseComplete))
			end)
		end
	end)
end