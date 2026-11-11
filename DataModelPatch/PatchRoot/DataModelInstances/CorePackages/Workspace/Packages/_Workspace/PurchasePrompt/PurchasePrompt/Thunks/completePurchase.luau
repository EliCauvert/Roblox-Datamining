local Parent = script.Parent.Parent
local Workspace = game:GetService("Workspace")
local _ = require(Parent.types)
local SetPromptStateModule = require(Parent.Actions.SetPromptState)
local PurchaseCompleteRecievedModule = require(Parent.Actions.PurchaseCompleteRecieved)
local PromptStateModule = require(Parent.Enums.PromptState)
local ThunkModule = require(Parent.Thunk)
local CompleteRequestModule = require(Parent.Thunks.completeRequest)
local FFlagEnableUnifiedProductPurchaseFlow = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local FFlagSkipCompletionModalForMarketplace = require(Parent.Parent.SharedFlags).FFlagSkipCompletionModalForMarketplace
local LogUnifiedPurchaseTelemetryCounterModule = require(Parent.Utils.logUnifiedPurchaseTelemetryCounter)
local UnifiedPurchaseTelemetryModule = require(Parent.Events.UnifiedPurchaseTelemetry)
local SendUnifiedPurchaseEventLogModule = require(Parent.Utils.sendUnifiedPurchaseEventLog)
local UnifiedPurchaseEventNameEnumModule = require(Parent.Enums.UnifiedPurchaseEventNameEnum)

return function(p1)
	-- upvalues: ThunkModule (copy), Workspace (copy), PurchaseCompleteRecievedModule (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy), SendUnifiedPurchaseEventLogModule (copy), UnifiedPurchaseEventNameEnumModule (copy), FFlagSkipCompletionModalForMarketplace (copy), SetPromptStateModule (copy), PromptStateModule (copy), CompleteRequestModule (copy)
	return ThunkModule.new(script.Name, {}, function(p2, _)
		-- upvalues: Workspace (upval), PurchaseCompleteRecievedModule (upval), FFlagEnableUnifiedProductPurchaseFlow (upval), p1 (copy), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), SendUnifiedPurchaseEventLogModule (upval), UnifiedPurchaseEventNameEnumModule (upval), FFlagSkipCompletionModalForMarketplace (upval), SetPromptStateModule (upval), PromptStateModule (upval), CompleteRequestModule (upval)
		local DistributedGameTimeDelta = Workspace.DistributedGameTime - p2:getState().purchasingStartTime
		p2:dispatch(PurchaseCompleteRecievedModule())
		
		if FFlagEnableUnifiedProductPurchaseFlow and p2:getState().isUserEligibleForUnifiedPurchaseFlow then
			local State = p2:getState()
			local PostPurchaseActions = State.postPurchaseActions
			local PostPurchaseActionsState = State.postPurchaseActionsState or {}
			
			if PostPurchaseActions then
				for _, postPurchaseAction in ipairs(PostPurchaseActions) do
					if postPurchaseAction and postPurchaseAction.actionKey and postPurchaseAction.isActionSelected ~= nil then
						PostPurchaseActionsState[postPurchaseAction.actionKey] = postPurchaseAction.isActionSelected
					end
				end
			end
			if State.purchaseCallbacks and State.purchaseCallbacks.onPurchaseSuccess then
				State.purchaseCallbacks.onPurchaseSuccess(p1, PostPurchaseActionsState)
			end
			if State.purchaseAnalyticsMetadata then
				local PurchaseAnalyticsMetadata = State.purchaseAnalyticsMetadata
				LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedProductPurchaseModalPurchaseSuccessCounter, PurchaseAnalyticsMetadata.surface, PurchaseAnalyticsMetadata.productType)
				SendUnifiedPurchaseEventLogModule({
					event_name = UnifiedPurchaseEventNameEnumModule.ItemPurchaseSuccess,
					purchase_flow_uuid = PurchaseAnalyticsMetadata.purchaseFlowUUID,
					product_id = PurchaseAnalyticsMetadata.productId,
					product_type = PurchaseAnalyticsMetadata.productType,
					product_target_id = PurchaseAnalyticsMetadata.productTargetId,
					robux_price = PurchaseAnalyticsMetadata.price,
					surface = PurchaseAnalyticsMetadata.surface,
					user_roblox_balance = PurchaseAnalyticsMetadata.userRobuxBalance,
					salelocation_universeid = PurchaseAnalyticsMetadata.saleLocationUniverseId
				})
			end
		end
		if FFlagSkipCompletionModalForMarketplace then
			local PurchaseOptions = p2:getState().purchaseOptions
			
			if PurchaseOptions and PurchaseOptions.skipPurchaseSuccessModal then
				p2:dispatch(SetPromptStateModule(PromptStateModule.PurchaseComplete))
				
				return p2:dispatch(CompleteRequestModule())
			end
		end
		if DistributedGameTimeDelta >= 1 then
			return p2:dispatch(SetPromptStateModule(PromptStateModule.PurchaseComplete))
		else
			delay(1 - DistributedGameTimeDelta, function()
				-- upvalues: p2 (copy), SetPromptStateModule (upval), PromptStateModule (upval)
				return p2:dispatch(SetPromptStateModule(PromptStateModule.PurchaseComplete))
			end)
		end
	end)
end