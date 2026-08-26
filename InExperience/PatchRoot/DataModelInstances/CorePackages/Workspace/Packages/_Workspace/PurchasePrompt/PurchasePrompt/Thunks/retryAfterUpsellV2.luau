local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local balanceInfoRecievedModule = require(purchasePrompt.Actions.BalanceInfoRecieved)
local purchaseCompleteRecievedModule = require(purchasePrompt.Actions.PurchaseCompleteRecieved)
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local promptNativeUpsellSuggestionsModule = require(purchasePrompt.Actions.PromptNativeUpsellSuggestions)
local _ = require(purchasePrompt.types)
local purchaseFlowModule = require(purchasePrompt.Enums.PurchaseFlow)
local upsellFlowModule = require(purchasePrompt.Enums.UpsellFlow)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local requestTypeModule = require(purchasePrompt.Enums.RequestType)
local counterModule = require(purchasePrompt.Enums.Counter)
local sendCounterModule = require(purchasePrompt.Thunks.sendCounter)
local _ = require(purchasePrompt.Models.RobuxUpsell)
local getRobuxUpsellSuggestionsModule = require(purchasePrompt.Network.getRobuxUpsellSuggestions)
local getBalanceInfoModule = require(purchasePrompt.Network.getBalanceInfo)
local networkModule = require(purchasePrompt.Services.Network)
local analyticsModule = require(purchasePrompt.Services.Analytics)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local completeRequestModule = require(purchasePrompt.Thunks.completeRequest)
local getPlayerPriceModule = require(purchasePrompt.Utils.getPlayerPrice)
local hasPendingRequestModule = require(purchasePrompt.Utils.hasPendingRequest)
local getPaymentPlatformModule = require(purchasePrompt.Utils.getPaymentPlatform)
local getUpsellFlowModule = require(purchasePrompt.NativeUpsell.getUpsellFlow)
local thunkModule = require(purchasePrompt.Thunk)
local fFlagAXMISWithBlackbird = require(purchasePrompt.Parent.SharedFlags).FFlagAXMISWithBlackbird
local addUnifiedPurchaseRobuxUpsellCompletedTelemetry = game:DefineFastFlag("AddUnifiedPurchaseRobuxUpsellCompletedTelemetry", false)
local logUnifiedPurchaseTelemetryCounterModule = require(purchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local unifiedPurchaseTelemetryModule = require(purchasePrompt.Events.UnifiedPurchaseTelemetry)
local purchaseItemModule = require(script.Parent.purchaseItem)
local upsellAccountBalanceRetryAttemps = game:DefineFastInt("UpsellAccountBalanceRetryAttemps", 3)
local upsellAccountBalanceRetryIntervalSec = game:DefineFastInt("UpsellAccountBalanceRetryIntervalSec", 1)
local list = { analyticsModule, networkModule, externalSettingsModule }

local function restartUpsell(p1, _, p2, p3, p4)
	-- upvalues: getRobuxUpsellSuggestionsModule (ref), hasPendingRequestModule (ref), promptNativeUpsellSuggestionsModule (ref), sendCounterModule (ref), counterModule (ref), setPromptStateModule (ref), promptStateModule (ref)
	return getRobuxUpsellSuggestionsModule(p2, p3, p4):andThen(function(p5)
		-- upvalues: hasPendingRequestModule (copy), p1 (ref), promptNativeUpsellSuggestionsModule (copy), sendCounterModule (copy), counterModule (copy)
		if hasPendingRequestModule(p1:getState()) then
			p1:dispatch(promptNativeUpsellSuggestionsModule(p5.products, 1, p5.virtualItemBadgeType))
			p1:dispatch(sendCounterModule(counterModule.UpsellModalShownAgain))
			
			return
		end
	end, function()
		-- upvalues: hasPendingRequestModule (copy), p1 (ref), setPromptStateModule (copy), promptStateModule (copy), sendCounterModule (copy), counterModule (copy)
		if hasPendingRequestModule(p1:getState()) then
			p1:dispatch(setPromptStateModule(promptStateModule.LargeRobuxUpsell))
			p1:dispatch(sendCounterModule(counterModule.UpsellGenericModalShownAgain))
			
			return
		end
	end)
end

local function retryAfterUpsell(p1)
	-- upvalues: upsellAccountBalanceRetryAttemps (ref), thunkModule (ref), list (ref), analyticsModule (ref), networkModule (ref), externalSettingsModule (ref), getUpsellFlowModule (ref), requestTypeModule (ref), promptStateModule (ref), fFlagAXMISWithBlackbird (ref), purchaseCompleteRecievedModule (ref), completeRequestModule (ref), purchaseFlowModule (ref), setPromptStateModule (ref), getBalanceInfoModule (ref), getPlayerPriceModule (ref), hasPendingRequestModule (ref), getPaymentPlatformModule (ref), balanceInfoRecievedModule (ref), upsellFlowModule (ref), restartUpsell (ref), errorOccurredModule (ref), purchaseErrorModule (ref), sendCounterModule (ref), counterModule (ref), addUnifiedPurchaseRobuxUpsellCompletedTelemetry (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref), purchaseItemModule (ref), upsellAccountBalanceRetryIntervalSec (ref), retryAfterUpsell (ref)
	p1 = p1 or upsellAccountBalanceRetryAttemps
	
	return thunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: analyticsModule (copy), networkModule (copy), externalSettingsModule (copy), getUpsellFlowModule (copy), requestTypeModule (copy), promptStateModule (copy), fFlagAXMISWithBlackbird (copy), purchaseCompleteRecievedModule (copy), completeRequestModule (copy), purchaseFlowModule (copy), setPromptStateModule (copy), getBalanceInfoModule (copy), getPlayerPriceModule (copy), hasPendingRequestModule (copy), getPaymentPlatformModule (copy), balanceInfoRecievedModule (copy), upsellFlowModule (copy), restartUpsell (copy), errorOccurredModule (copy), purchaseErrorModule (copy), sendCounterModule (copy), counterModule (copy), addUnifiedPurchaseRobuxUpsellCompletedTelemetry (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), purchaseItemModule (copy), p1 (ref), upsellAccountBalanceRetryIntervalSec (copy), retryAfterUpsell (copy)
		local var1 = p3[analyticsModule]
		local var2 = p3[networkModule]
		local var3 = p3[externalSettingsModule]
		local state = p2:getState()
		local requestType = state.promptRequest.requestType
		local promptState = state.promptState
		local purchaseFlow = state.purchaseFlow
		local var4 = getUpsellFlowModule(var3.getPlatform())
		
		if requestType == requestTypeModule.None then return end
		if promptState ~= promptStateModule.UpsellInProgress and promptState ~= promptStateModule.PollingBalance then return end
		if requestType == requestTypeModule.Premium or requestType == requestTypeModule.Subscription or fFlagAXMISWithBlackbird and requestType == requestTypeModule.RobuxUpsell then
			if promptState == promptStateModule.UpsellInProgress then
				p2:dispatch(purchaseCompleteRecievedModule())
				p2:dispatch(completeRequestModule())
				
				return
			end
			return
		elseif purchaseFlow == purchaseFlowModule.RobuxUpsellV2 or purchaseFlow == purchaseFlowModule.LargeRobuxUpsell then
			p2:dispatch(setPromptStateModule(promptStateModule.PollingBalance))
		end
		return getBalanceInfoModule(var2, var3, false):andThen(function(p4)
			-- upvalues: p2 (ref), getPlayerPriceModule (copy), hasPendingRequestModule (copy), getPaymentPlatformModule (copy), var3 (ref), balanceInfoRecievedModule (copy), purchaseFlow (ref), purchaseFlowModule (copy), var4 (ref), upsellFlowModule (copy), restartUpsell (copy), var2 (ref), errorOccurredModule (copy), purchaseErrorModule (copy), sendCounterModule (copy), counterModule (copy), addUnifiedPurchaseRobuxUpsellCompletedTelemetry (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), purchaseItemModule (copy), p1 (copy), upsellAccountBalanceRetryIntervalSec (copy), retryAfterUpsell (copy), var1 (ref)
			local state = p2:getState()
			local var5 = getPlayerPriceModule(state.productInfo, state.accountInfo.membershipType == 4)
			
			if not hasPendingRequestModule(p2:getState()) then return end
			local var6 = getPaymentPlatformModule(var3.getPlatform())
			local balance = state.accountInfo.balance
			local robux = p4.robux
			p2:dispatch(balanceInfoRecievedModule(p4))
			
			if balance == robux then
				if p1 > 0 then
					delay(upsellAccountBalanceRetryIntervalSec, function()
						-- upvalues: p2 (copy), retryAfterUpsell (copy), p1 (copy)
						p2:dispatch(retryAfterUpsell(p1 - 1))
					end)
					
					return
				end
				var1.signalFailedPurchasePostUpsell()
				
				if var4 == upsellFlowModule.Web then
					restartUpsell(p2, var2, var5, robux, var6)
				else
					p2:dispatch(errorOccurredModule(purchaseErrorModule.InvalidFunds))
				end
				if addUnifiedPurchaseRobuxUpsellCompletedTelemetry and state.purchaseAnalyticsMetadata then
					local purchaseAnalyticsMetadata = state.purchaseAnalyticsMetadata
					logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedRobuxUpsellRobuxPurchaseFailedCounter, purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata.productType)
				end
				return
			elseif var5 == nil or robux >= var5 then
				if addUnifiedPurchaseRobuxUpsellCompletedTelemetry and state.purchaseAnalyticsMetadata then
					local purchaseAnalyticsMetadata = state.purchaseAnalyticsMetadata
					logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedRobuxUpsellRobuxPurchaseCompletedCounter, purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata.productType)
				end
				p2:dispatch(purchaseItemModule())
				
				return
			elseif purchaseFlow == purchaseFlowModule.LargeRobuxUpsell or var4 == upsellFlowModule.Web then
				return restartUpsell(p2, var2, var5, robux, var6)
			end
			p2:dispatch(errorOccurredModule(purchaseErrorModule.InvalidFunds))
			p2:dispatch(sendCounterModule(counterModule.UpsellFailedNotEnoughRobux))
		end):catch(function(p4)
			-- upvalues: p2 (ref), errorOccurredModule (copy)
			p2:dispatch(errorOccurredModule(p4))
		end)
	end)
end

return retryAfterUpsell