local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local SetPromptStateModule = require(PurchasePrompt.Actions.SetPromptState)
local BalanceInfoRecievedModule = require(PurchasePrompt.Actions.BalanceInfoRecieved)
local PurchaseCompleteRecievedModule = require(PurchasePrompt.Actions.PurchaseCompleteRecieved)
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local PromptNativeUpsellSuggestionsModule = require(PurchasePrompt.Actions.PromptNativeUpsellSuggestions)
local _ = require(PurchasePrompt.types)
local PurchaseFlowModule = require(PurchasePrompt.Enums.PurchaseFlow)
local UpsellFlowModule = require(PurchasePrompt.Enums.UpsellFlow)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local RequestTypeModule = require(PurchasePrompt.Enums.RequestType)
local CounterModule = require(PurchasePrompt.Enums.Counter)
local SendCounterModule = require(PurchasePrompt.Thunks.sendCounter)
local _ = require(PurchasePrompt.Models.RobuxUpsell)
local GetRobuxUpsellSuggestionsModule = require(PurchasePrompt.Network.getRobuxUpsellSuggestions)
local GetBalanceInfoModule = require(PurchasePrompt.Network.getBalanceInfo)
local NetworkModule = require(PurchasePrompt.Services.Network)
local AnalyticsModule = require(PurchasePrompt.Services.Analytics)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local CompleteRequestModule = require(PurchasePrompt.Thunks.completeRequest)
local GetPlayerPriceModule = require(PurchasePrompt.Utils.getPlayerPrice)
local HasPendingRequestModule = require(PurchasePrompt.Utils.hasPendingRequest)
local GetPaymentPlatformModule = require(PurchasePrompt.Utils.getPaymentPlatform)
local IsEligibleForRobuxUpsellPlusButtonModule = require(PurchasePrompt.Utils.isEligibleForRobuxUpsellPlusButton)
local SelectPriceModule = require(PurchasePrompt.Selectors.selectPrice)
local GetUpsellFlowModule = require(PurchasePrompt.NativeUpsell.getUpsellFlow)
local ThunkModule = require(PurchasePrompt.Thunk)
local FFlagAXMISWithBlackbird = require(PurchasePrompt.Parent.SharedFlags).FFlagAXMISWithBlackbird
local AddUnifiedPurchaseRobuxUpsellCompletedTelemetry = game:DefineFastFlag("AddUnifiedPurchaseRobuxUpsellCompletedTelemetry", false)
local LogUnifiedPurchaseTelemetryCounterModule = require(PurchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local UnifiedPurchaseTelemetryModule = require(PurchasePrompt.Events.UnifiedPurchaseTelemetry)
local PurchaseItemModule = require(script.Parent.purchaseItem)
local UpsellAccountBalanceRetryAttemps = game:DefineFastInt("UpsellAccountBalanceRetryAttemps", 3)
local UpsellAccountBalanceRetryIntervalSec = game:DefineFastInt("UpsellAccountBalanceRetryIntervalSec", 1)
local list = { AnalyticsModule, NetworkModule, ExternalSettingsModule }

local function restartUpsell(p1, _, p2, Robux, p3)
	-- upvalues: GetRobuxUpsellSuggestionsModule (copy), IsEligibleForRobuxUpsellPlusButtonModule (copy), SelectPriceModule (copy), HasPendingRequestModule (copy), PromptNativeUpsellSuggestionsModule (copy), SendCounterModule (copy), CounterModule (copy), SetPromptStateModule (copy), PromptStateModule (copy)
	local State = p1:getState()
	
	return GetRobuxUpsellSuggestionsModule(p2, Robux, p3, IsEligibleForRobuxUpsellPlusButtonModule(State.isUserEligibleForUnifiedPurchaseFlow, State.robloxSubscriptionProducts, State.productPayload, SelectPriceModule(State), State.promptRequest.requestType)):andThen(function(Result)
		-- upvalues: HasPendingRequestModule (upval), p1 (copy), PromptNativeUpsellSuggestionsModule (upval), SendCounterModule (upval), CounterModule (upval)
		if HasPendingRequestModule(p1:getState()) then
			p1:dispatch(PromptNativeUpsellSuggestionsModule(Result.products, 1, Result.virtualItemBadgeType, Result.experimentVariant))
			p1:dispatch(SendCounterModule(CounterModule.UpsellModalShownAgain))
			
			return
		end
	end, function()
		-- upvalues: HasPendingRequestModule (upval), p1 (copy), SetPromptStateModule (upval), PromptStateModule (upval), SendCounterModule (upval), CounterModule (upval)
		if HasPendingRequestModule(p1:getState()) then
			p1:dispatch(SetPromptStateModule(PromptStateModule.LargeRobuxUpsell))
			p1:dispatch(SendCounterModule(CounterModule.UpsellGenericModalShownAgain))
			
			return
		end
	end)
end

local function retryAfterUpsell(p1)
	-- upvalues: UpsellAccountBalanceRetryAttemps (copy), ThunkModule (copy), list (copy), AnalyticsModule (copy), NetworkModule (copy), ExternalSettingsModule (copy), GetUpsellFlowModule (copy), RequestTypeModule (copy), PromptStateModule (copy), FFlagAXMISWithBlackbird (copy), PurchaseCompleteRecievedModule (copy), CompleteRequestModule (copy), PurchaseFlowModule (copy), SetPromptStateModule (copy), GetBalanceInfoModule (copy), GetPlayerPriceModule (copy), HasPendingRequestModule (copy), GetPaymentPlatformModule (copy), BalanceInfoRecievedModule (copy), UpsellFlowModule (copy), restartUpsell (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), SendCounterModule (copy), CounterModule (copy), AddUnifiedPurchaseRobuxUpsellCompletedTelemetry (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy), PurchaseItemModule (copy), UpsellAccountBalanceRetryIntervalSec (copy), retryAfterUpsell (copy)
	local P6 = p1 or UpsellAccountBalanceRetryAttemps
	
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: AnalyticsModule (upval), NetworkModule (upval), ExternalSettingsModule (upval), GetUpsellFlowModule (upval), RequestTypeModule (upval), PromptStateModule (upval), FFlagAXMISWithBlackbird (upval), PurchaseCompleteRecievedModule (upval), CompleteRequestModule (upval), PurchaseFlowModule (upval), SetPromptStateModule (upval), GetBalanceInfoModule (upval), GetPlayerPriceModule (upval), HasPendingRequestModule (upval), GetPaymentPlatformModule (upval), BalanceInfoRecievedModule (upval), UpsellFlowModule (upval), restartUpsell (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), SendCounterModule (upval), CounterModule (upval), AddUnifiedPurchaseRobuxUpsellCompletedTelemetry (upval), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), PurchaseItemModule (upval), P6 (copy), UpsellAccountBalanceRetryIntervalSec (upval), retryAfterUpsell (upval)
		local v1 = p3[AnalyticsModule]
		local v2 = p3[NetworkModule]
		local v3 = p3[ExternalSettingsModule]
		local State = p2:getState()
		local RequestType = State.promptRequest.requestType
		local PromptState = State.promptState
		local PurchaseFlow = State.purchaseFlow
		local UpsellFlowModule1 = GetUpsellFlowModule(v3.getPlatform())
		
		if RequestType == RequestTypeModule.None then return end
		if PromptState ~= PromptStateModule.UpsellInProgress and PromptState ~= PromptStateModule.PollingBalance then return end
		if RequestType ~= RequestTypeModule.Premium and RequestType ~= RequestTypeModule.Subscription and (not FFlagAXMISWithBlackbird or RequestType ~= RequestTypeModule.RobuxUpsell) then
			if PurchaseFlow == PurchaseFlowModule.RobuxUpsellV2 or PurchaseFlow == PurchaseFlowModule.LargeRobuxUpsell then
				p2:dispatch(SetPromptStateModule(PromptStateModule.PollingBalance))
			end
			return GetBalanceInfoModule(v2, v3, false):andThen(function(Result)
				-- upvalues: p2 (copy), GetPlayerPriceModule (upval), HasPendingRequestModule (upval), GetPaymentPlatformModule (upval), v3 (copy), BalanceInfoRecievedModule (upval), PurchaseFlow (copy), PurchaseFlowModule (upval), UpsellFlowModule1 (copy), UpsellFlowModule (upval), restartUpsell (upval), v2 (copy), ErrorOccurredModule (upval), PurchaseErrorModule (upval), SendCounterModule (upval), CounterModule (upval), AddUnifiedPurchaseRobuxUpsellCompletedTelemetry (upval), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), PurchaseItemModule (upval), P6 (upval), UpsellAccountBalanceRetryIntervalSec (upval), retryAfterUpsell (upval), v1 (copy)
				local State = p2:getState()
				local PlayerPriceModule = GetPlayerPriceModule(State.productInfo, State.accountInfo.membershipType == 4)
				
				if not HasPendingRequestModule(p2:getState()) then return end
				local PaymentPlatformModule = GetPaymentPlatformModule(v3.getPlatform())
				local Balance = State.accountInfo.balance
				local Robux = Result.robux
				p2:dispatch(BalanceInfoRecievedModule(Result))
				
				if Balance == Robux then
					if P6 > 0 then
						delay(UpsellAccountBalanceRetryIntervalSec, function()
							-- upvalues: p2 (upval), retryAfterUpsell (upval), P6 (upval)
							p2:dispatch(retryAfterUpsell(P6 - 1))
						end)
						
						return
					end
					v1.signalFailedPurchasePostUpsell()
					
					if UpsellFlowModule1 == UpsellFlowModule.Web then
						restartUpsell(p2, v2, PlayerPriceModule, Robux, PaymentPlatformModule)
					else
						p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.InvalidFunds))
					end
					if AddUnifiedPurchaseRobuxUpsellCompletedTelemetry and State.purchaseAnalyticsMetadata then
						local PurchaseAnalyticsMetadata = State.purchaseAnalyticsMetadata
						LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedRobuxUpsellRobuxPurchaseFailedCounter, PurchaseAnalyticsMetadata.surface, PurchaseAnalyticsMetadata.productType)
					end
					return
				elseif PlayerPriceModule == nil or Robux >= PlayerPriceModule then
					if AddUnifiedPurchaseRobuxUpsellCompletedTelemetry and State.purchaseAnalyticsMetadata then
						local PurchaseAnalyticsMetadata = State.purchaseAnalyticsMetadata
						LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedRobuxUpsellRobuxPurchaseCompletedCounter, PurchaseAnalyticsMetadata.surface, PurchaseAnalyticsMetadata.productType)
					end
					p2:dispatch(PurchaseItemModule())
					
					return
				elseif PurchaseFlow == PurchaseFlowModule.LargeRobuxUpsell or UpsellFlowModule1 == UpsellFlowModule.Web then
					return restartUpsell(p2, v2, PlayerPriceModule, Robux, PaymentPlatformModule)
				else
					p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.InvalidFunds))
					p2:dispatch(SendCounterModule(CounterModule.UpsellFailedNotEnoughRobux))
				end
			end):catch(function(Err)
				-- upvalues: p2 (copy), ErrorOccurredModule (upval)
				p2:dispatch(ErrorOccurredModule(Err))
			end)
		elseif PromptState == PromptStateModule.UpsellInProgress then
			p2:dispatch(PurchaseCompleteRecievedModule())
			p2:dispatch(CompleteRequestModule())
			
			return
		else
		end
	end)
end

return retryAfterUpsell