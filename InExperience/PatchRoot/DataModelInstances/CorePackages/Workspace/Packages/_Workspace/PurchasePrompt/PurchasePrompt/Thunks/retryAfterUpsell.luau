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
local PurchaseItemModule = require(script.Parent.purchaseItem)
local UpsellAccountBalanceRetryAttemps = game:DefineFastInt("UpsellAccountBalanceRetryAttemps", 3)
local UpsellAccountBalanceRetryIntervalSec = game:DefineFastInt("UpsellAccountBalanceRetryIntervalSec", 1)
local RetryAfterUpsellV2Module = require(script.Parent.retryAfterUpsellV2)
local AddUnifiedPurchaseRobuxUpsellCompletedTelemetry2 = game:DefineFastFlag("AddUnifiedPurchaseRobuxUpsellCompletedTelemetry2", false)
local LogUnifiedPurchaseTelemetryCounterModule = require(PurchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local UnifiedPurchaseTelemetryModule = require(PurchasePrompt.Events.UnifiedPurchaseTelemetry)
local FFlagAXMISWithBlackbird = require(PurchasePrompt.Parent.SharedFlags).FFlagAXMISWithBlackbird
local list = { AnalyticsModule, NetworkModule, ExternalSettingsModule }

if game:DefineFastFlag("RetryAfterUpsellV2", false) then
	return RetryAfterUpsellV2Module
else
	local function retryAfterUpsell(p1)
		-- upvalues: UpsellAccountBalanceRetryAttemps (copy), ThunkModule (copy), list (copy), AnalyticsModule (copy), NetworkModule (copy), ExternalSettingsModule (copy), GetUpsellFlowModule (copy), RequestTypeModule (copy), PromptStateModule (copy), FFlagAXMISWithBlackbird (copy), PurchaseCompleteRecievedModule (copy), CompleteRequestModule (copy), PurchaseFlowModule (copy), SetPromptStateModule (copy), GetBalanceInfoModule (copy), GetPlayerPriceModule (copy), HasPendingRequestModule (copy), BalanceInfoRecievedModule (copy), GetPaymentPlatformModule (copy), GetRobuxUpsellSuggestionsModule (copy), IsEligibleForRobuxUpsellPlusButtonModule (copy), SelectPriceModule (copy), PromptNativeUpsellSuggestionsModule (copy), SendCounterModule (copy), CounterModule (copy), UpsellFlowModule (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), AddUnifiedPurchaseRobuxUpsellCompletedTelemetry2 (copy), LogUnifiedPurchaseTelemetryCounterModule (copy), UnifiedPurchaseTelemetryModule (copy), PurchaseItemModule (copy), UpsellAccountBalanceRetryIntervalSec (copy), retryAfterUpsell (copy)
		local P0 = p1 or UpsellAccountBalanceRetryAttemps
		
		return ThunkModule.new(script.Name, list, function(p2, p3)
			-- upvalues: AnalyticsModule (upval), NetworkModule (upval), ExternalSettingsModule (upval), GetUpsellFlowModule (upval), RequestTypeModule (upval), PromptStateModule (upval), FFlagAXMISWithBlackbird (upval), PurchaseCompleteRecievedModule (upval), CompleteRequestModule (upval), PurchaseFlowModule (upval), SetPromptStateModule (upval), GetBalanceInfoModule (upval), GetPlayerPriceModule (upval), HasPendingRequestModule (upval), BalanceInfoRecievedModule (upval), GetPaymentPlatformModule (upval), GetRobuxUpsellSuggestionsModule (upval), IsEligibleForRobuxUpsellPlusButtonModule (upval), SelectPriceModule (upval), PromptNativeUpsellSuggestionsModule (upval), SendCounterModule (upval), CounterModule (upval), UpsellFlowModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), AddUnifiedPurchaseRobuxUpsellCompletedTelemetry2 (upval), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), PurchaseItemModule (upval), P0 (ref), UpsellAccountBalanceRetryIntervalSec (upval), retryAfterUpsell (upval)
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
			if RequestType ~= RequestTypeModule.Subscription and (not FFlagAXMISWithBlackbird or RequestType ~= RequestTypeModule.RobuxUpsell) then
				if PurchaseFlow == PurchaseFlowModule.RobuxUpsellV2 or PurchaseFlow == PurchaseFlowModule.LargeRobuxUpsell then
					p2:dispatch(SetPromptStateModule(PromptStateModule.PollingBalance))
				end
				return GetBalanceInfoModule(v2, v3, false):andThen(function(Result)
					-- upvalues: p2 (copy), GetPlayerPriceModule (upval), HasPendingRequestModule (upval), BalanceInfoRecievedModule (upval), PurchaseFlow (copy), PurchaseFlowModule (upval), v3 (copy), GetPaymentPlatformModule (upval), GetRobuxUpsellSuggestionsModule (upval), IsEligibleForRobuxUpsellPlusButtonModule (upval), SelectPriceModule (upval), PromptNativeUpsellSuggestionsModule (upval), SendCounterModule (upval), CounterModule (upval), SetPromptStateModule (upval), PromptStateModule (upval), UpsellFlowModule1 (copy), UpsellFlowModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), AddUnifiedPurchaseRobuxUpsellCompletedTelemetry2 (upval), LogUnifiedPurchaseTelemetryCounterModule (upval), UnifiedPurchaseTelemetryModule (upval), PurchaseItemModule (upval), P0 (upval), UpsellAccountBalanceRetryIntervalSec (upval), retryAfterUpsell (upval), v1 (copy)
					local State = p2:getState()
					local PlayerPriceModule = GetPlayerPriceModule(State.productInfo, State.accountInfo.membershipType == 4)
					
					if not HasPendingRequestModule(p2:getState()) then return end
					local Balance = State.accountInfo.balance
					local Robux = Result.robux
					p2:dispatch(BalanceInfoRecievedModule(Result))
					local State1 = p2:getState()
					
					if Balance == Robux then
						if P0 > 0 then
							delay(UpsellAccountBalanceRetryIntervalSec, function()
								-- upvalues: p2 (upval), retryAfterUpsell (upval), P0 (upval)
								p2:dispatch(retryAfterUpsell(P0 - 1))
							end)
							
							return
						end
						v1.signalFailedPurchasePostUpsell()
						
						if UpsellFlowModule1 == UpsellFlowModule.Web then
							p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.InvalidFundsUnknown))
						else
							p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.InvalidFunds))
						end
						if AddUnifiedPurchaseRobuxUpsellCompletedTelemetry2 and State.purchaseAnalyticsMetadata then
							local PurchaseAnalyticsMetadata = State.purchaseAnalyticsMetadata
							LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedRobuxUpsellRobuxPurchaseFailedCounter, PurchaseAnalyticsMetadata.surface, PurchaseAnalyticsMetadata.productType)
						end
						return
					elseif PlayerPriceModule == nil or Robux >= PlayerPriceModule then
						if AddUnifiedPurchaseRobuxUpsellCompletedTelemetry2 and State.purchaseAnalyticsMetadata then
							local PurchaseAnalyticsMetadata = State.purchaseAnalyticsMetadata
							LogUnifiedPurchaseTelemetryCounterModule(UnifiedPurchaseTelemetryModule.UnifiedRobuxUpsellRobuxPurchaseCompletedCounter, PurchaseAnalyticsMetadata.surface, PurchaseAnalyticsMetadata.productType)
						end
						p2:dispatch(PurchaseItemModule())
						
						return
					else
						if PurchaseFlow == PurchaseFlowModule.LargeRobuxUpsell then
							return GetRobuxUpsellSuggestionsModule(PlayerPriceModule, Robux, GetPaymentPlatformModule((v3.getPlatform())), IsEligibleForRobuxUpsellPlusButtonModule(State1.isUserEligibleForUnifiedPurchaseFlow, State1.robloxSubscriptionProducts, State1.productPayload, SelectPriceModule(State1), State1.promptRequest.requestType)):andThen(function(Result)
								-- upvalues: HasPendingRequestModule (upval), p2 (upval), PromptNativeUpsellSuggestionsModule (upval), SendCounterModule (upval), CounterModule (upval)
								if HasPendingRequestModule(p2:getState()) then
									p2:dispatch(PromptNativeUpsellSuggestionsModule(Result.products, 1, Result.virtualItemBadgeType, Result.experimentVariant))
									p2:dispatch(SendCounterModule(CounterModule.UpsellModalShownAgain))
									
									return
								end
							end, function()
								-- upvalues: HasPendingRequestModule (upval), p2 (upval), SetPromptStateModule (upval), PromptStateModule (upval), SendCounterModule (upval), CounterModule (upval)
								if HasPendingRequestModule(p2:getState()) then
									p2:dispatch(SetPromptStateModule(PromptStateModule.LargeRobuxUpsell))
									p2:dispatch(SendCounterModule(CounterModule.UpsellGenericModalShownAgain))
									
									return
								end
							end)
						end
						if UpsellFlowModule1 == UpsellFlowModule.Web then
							p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.InvalidFundsUnknown))
						else
							p2:dispatch(ErrorOccurredModule(PurchaseErrorModule.InvalidFunds))
						end
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
end