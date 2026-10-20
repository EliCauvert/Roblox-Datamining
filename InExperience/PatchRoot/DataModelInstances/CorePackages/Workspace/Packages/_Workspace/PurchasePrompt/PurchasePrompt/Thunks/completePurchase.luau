local Parent = script.Parent.Parent
local Workspace = game:GetService("Workspace")
local _ = require(Parent.types)
local SetPromptStateModule = require(Parent.Actions.SetPromptState)
local PurchaseCompleteRecievedModule = require(Parent.Actions.PurchaseCompleteRecieved)
local PromptStateModule = require(Parent.Enums.PromptState)
local ThunkModule = require(Parent.Thunk)
local CompleteRequestModule = require(Parent.Thunks.completeRequest)
local FFlagSkipCompletionModalForMarketplace = require(Parent.Parent.SharedFlags).FFlagSkipCompletionModalForMarketplace
local LogUnifiedPurchaseTelemetryCounterModule = require(Parent.Utils.logUnifiedPurchaseTelemetryCounter)
local UnifiedPurchaseTelemetryModule = require(Parent.Events.UnifiedPurchaseTelemetry)
local SendUnifiedPurchaseEventLogModule = require(Parent.Utils.sendUnifiedPurchaseEventLog)
local UnifiedPurchaseEventNameEnumModule = require(Parent.Enums.UnifiedPurchaseEventNameEnum)
local FFlagEnableInExperienceOffersPurchaseFlow = require(Parent.Parent.SharedFlags).FFlagEnableInExperienceOffersPurchaseFlow
local GetFeatureKeyForSurfaceModule = require(Parent.Utils.getFeatureKeyForSurface)
local FFlagRefetchBothOfferKeysAfterPurchaseModule = require(Parent.Flags.FFlagRefetchBothOfferKeysAfterPurchase)
local InExperienceOffersModule = require(Parent.Parent.InExperienceOffers)

return function(p1)
	-- upvalues: ThunkModule (copy), Workspace (copy), PurchaseCompleteRecievedModule (copy), FFlagEnableInExperienceOffersPurchaseFlow (copy), InExperienceOffersModule (copy), FFlagRefetchBothOfferKeysAfterPurchaseModule (copy), GetFeatureKeyForSurfaceModule (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy), SendUnifiedPurchaseEventLogModule (copy), UnifiedPurchaseEventNameEnumModule (copy), FFlagSkipCompletionModalForMarketplace (copy), SetPromptStateModule (copy), PromptStateModule (copy), CompleteRequestModule (copy)
	return ThunkModule.new(script.Name, {}, function(p2, _)
		-- upvalues: Workspace (upval), PurchaseCompleteRecievedModule (upval), FFlagEnableInExperienceOffersPurchaseFlow (upval), InExperienceOffersModule (upval), FFlagRefetchBothOfferKeysAfterPurchaseModule (upval), GetFeatureKeyForSurfaceModule (upval), p1 (copy), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), SendUnifiedPurchaseEventLogModule (upval), UnifiedPurchaseEventNameEnumModule (upval), FFlagSkipCompletionModalForMarketplace (upval), SetPromptStateModule (upval), PromptStateModule (upval), CompleteRequestModule (upval)
		local DistributedGameTimeDelta = Workspace.DistributedGameTime - p2:getState().purchasingStartTime
		p2:dispatch(PurchaseCompleteRecievedModule())
		p2:flush()
		
		if FFlagEnableInExperienceOffersPurchaseFlow then
			local PurchaseAnalyticsMetadata = p2:getState().purchaseAnalyticsMetadata
			
			if PurchaseAnalyticsMetadata then
				local OffersStore = InExperienceOffersModule.getOffersStore(false)
				local Offers = OffersStore.getOffers(false)
				local FeatureKeys = InExperienceOffersModule.FeatureKeys
				local GetOffersForKeyFunction = InExperienceOffersModule.Utils.getOffersForKey
				
				if FFlagRefetchBothOfferKeysAfterPurchaseModule then
					local list = { FeatureKeys.RobloxShop, FeatureKeys.DeveloperShop }
					
					if InExperienceOffersModule.Utils.hasOfferForAnyKey(Offers, list) then
						OffersStore.fetchOffers(list)
					end
				elseif GetFeatureKeyForSurfaceModule(PurchaseAnalyticsMetadata.surface) == FeatureKeys.RobloxShop then
					if GetOffersForKeyFunction(Offers, FeatureKeys.RobloxShop) ~= nil then
						OffersStore.fetchOffers({ FeatureKeys.RobloxShop })
					end
				elseif GetOffersForKeyFunction(Offers, FeatureKeys.DeveloperShop) ~= nil then
					OffersStore.fetchOffers({ FeatureKeys.DeveloperShop })
				end
			end
		end
		if p2:getState().isUserEligibleForUnifiedPurchaseFlow then
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