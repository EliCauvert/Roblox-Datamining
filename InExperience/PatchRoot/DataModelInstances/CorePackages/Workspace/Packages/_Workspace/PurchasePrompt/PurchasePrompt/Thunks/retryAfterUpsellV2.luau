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

local function restartUpsell(p0, _, p1, p2, p3)
	-- upvalues: getRobuxUpsellSuggestionsModule (ref), hasPendingRequestModule (ref), promptNativeUpsellSuggestionsModule (ref), sendCounterModule (ref), counterModule (ref), setPromptStateModule (ref), promptStateModule (ref)
	return getRobuxUpsellSuggestionsModule(p1, p2, p3):andThen(function(p4)
		-- upvalues: hasPendingRequestModule (copy), p0 (ref), promptNativeUpsellSuggestionsModule (copy), sendCounterModule (copy), counterModule (copy)
		if hasPendingRequestModule(p0:getState()) then
			p0:dispatch(promptNativeUpsellSuggestionsModule(p4.products, 1, p4.virtualItemBadgeType))
			p0:dispatch(sendCounterModule(counterModule.UpsellModalShownAgain))
			
			return
		end
	end, function()
		-- upvalues: hasPendingRequestModule (copy), p0 (ref), setPromptStateModule (copy), promptStateModule (copy), sendCounterModule (copy), counterModule (copy)
		if hasPendingRequestModule(p0:getState()) then
			p0:dispatch(setPromptStateModule(promptStateModule.LargeRobuxUpsell))
			p0:dispatch(sendCounterModule(counterModule.UpsellGenericModalShownAgain))
			
			return
		end
	end)
end

local function retryAfterUpsell(p5)
	-- upvalues: upsellAccountBalanceRetryAttemps (ref), thunkModule (ref), list (ref), analyticsModule (ref), networkModule (ref), externalSettingsModule (ref), getUpsellFlowModule (ref), requestTypeModule (ref), promptStateModule (ref), fFlagAXMISWithBlackbird (ref), purchaseCompleteRecievedModule (ref), completeRequestModule (ref), purchaseFlowModule (ref), setPromptStateModule (ref), getBalanceInfoModule (ref), getPlayerPriceModule (ref), hasPendingRequestModule (ref), getPaymentPlatformModule (ref), balanceInfoRecievedModule (ref), upsellFlowModule (ref), restartUpsell (ref), errorOccurredModule (ref), purchaseErrorModule (ref), sendCounterModule (ref), counterModule (ref), addUnifiedPurchaseRobuxUpsellCompletedTelemetry (ref), logUnifiedPurchaseTelemetryCounterModule (ref), unifiedPurchaseTelemetryModule (ref), purchaseItemModule (ref), upsellAccountBalanceRetryIntervalSec (ref), retryAfterUpsell (ref)
	p5 = p5 or upsellAccountBalanceRetryAttemps
	
	return thunkModule.new(script.Name, list, function(p6, p7)
		-- upvalues: analyticsModule (copy), networkModule (copy), externalSettingsModule (copy), getUpsellFlowModule (copy), requestTypeModule (copy), promptStateModule (copy), fFlagAXMISWithBlackbird (copy), purchaseCompleteRecievedModule (copy), completeRequestModule (copy), purchaseFlowModule (copy), setPromptStateModule (copy), getBalanceInfoModule (copy), getPlayerPriceModule (copy), hasPendingRequestModule (copy), getPaymentPlatformModule (copy), balanceInfoRecievedModule (copy), upsellFlowModule (copy), restartUpsell (copy), errorOccurredModule (copy), purchaseErrorModule (copy), sendCounterModule (copy), counterModule (copy), addUnifiedPurchaseRobuxUpsellCompletedTelemetry (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), purchaseItemModule (copy), p5 (ref), upsellAccountBalanceRetryIntervalSec (copy), retryAfterUpsell (copy)
		local var34 = p7[analyticsModule]
		local var35 = p7[networkModule]
		local var36 = p7[externalSettingsModule]
		local state = p6:getState()
		local requestType = state.promptRequest.requestType
		local promptState = state.promptState
		local purchaseFlow = state.purchaseFlow
		local var38 = getUpsellFlowModule(var36.getPlatform())
		
		if requestType == requestTypeModule.None then return end
		if promptState ~= promptStateModule.UpsellInProgress and promptState ~= promptStateModule.PollingBalance then return end
		if requestType == requestTypeModule.Premium or requestType == requestTypeModule.Subscription or fFlagAXMISWithBlackbird and requestType == requestTypeModule.RobuxUpsell then
			if promptState == promptStateModule.UpsellInProgress then
				p6:dispatch(purchaseCompleteRecievedModule())
				p6:dispatch(completeRequestModule())
				
				return
			end
			return
		elseif purchaseFlow == purchaseFlowModule.RobuxUpsellV2 or purchaseFlow == purchaseFlowModule.LargeRobuxUpsell then
			p6:dispatch(setPromptStateModule(promptStateModule.PollingBalance))
		end
		return getBalanceInfoModule(var35, var36, false):andThen(function(p9)
			-- upvalues: p6 (ref), getPlayerPriceModule (copy), hasPendingRequestModule (copy), getPaymentPlatformModule (copy), var36 (ref), balanceInfoRecievedModule (copy), purchaseFlow (ref), purchaseFlowModule (copy), var38 (ref), upsellFlowModule (copy), restartUpsell (copy), var35 (ref), errorOccurredModule (copy), purchaseErrorModule (copy), sendCounterModule (copy), counterModule (copy), addUnifiedPurchaseRobuxUpsellCompletedTelemetry (copy), logUnifiedPurchaseTelemetryCounterModule (copy), unifiedPurchaseTelemetryModule (copy), purchaseItemModule (copy), p5 (copy), upsellAccountBalanceRetryIntervalSec (copy), retryAfterUpsell (copy), var34 (ref)
			local state = p6:getState()
			local var40 = getPlayerPriceModule(state.productInfo, state.accountInfo.membershipType == 4)
			
			if not hasPendingRequestModule(p6:getState()) then return end
			local var41 = getPaymentPlatformModule(var36.getPlatform())
			local balance = state.accountInfo.balance
			local robux = p9.robux
			p6:dispatch(balanceInfoRecievedModule(p9))
			
			if balance == robux then
				if p5 > 0 then
					delay(upsellAccountBalanceRetryIntervalSec, function()
						-- upvalues: p6 (copy), retryAfterUpsell (copy), p5 (copy)
						p6:dispatch(retryAfterUpsell(p5 - 1))
					end)
					
					return
				end
				var34.signalFailedPurchasePostUpsell()
				
				if var38 == upsellFlowModule.Web then
					restartUpsell(p6, var35, var40, robux, var41)
				else
					p6:dispatch(errorOccurredModule(purchaseErrorModule.InvalidFunds))
				end
				if addUnifiedPurchaseRobuxUpsellCompletedTelemetry and state.purchaseAnalyticsMetadata then
					local purchaseAnalyticsMetadata = state.purchaseAnalyticsMetadata
					logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedRobuxUpsellRobuxPurchaseFailedCounter, purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata.productType)
				end
				return
			elseif var40 == nil or robux >= var40 then
				if addUnifiedPurchaseRobuxUpsellCompletedTelemetry and state.purchaseAnalyticsMetadata then
					local purchaseAnalyticsMetadata = state.purchaseAnalyticsMetadata
					logUnifiedPurchaseTelemetryCounterModule(unifiedPurchaseTelemetryModule.UnifiedRobuxUpsellRobuxPurchaseCompletedCounter, purchaseAnalyticsMetadata.surface, purchaseAnalyticsMetadata.productType)
				end
				p6:dispatch(purchaseItemModule())
				
				return
			elseif purchaseFlow == purchaseFlowModule.LargeRobuxUpsell or var38 == upsellFlowModule.Web then
				return restartUpsell(p6, var35, var40, robux, var41)
			end
			p6:dispatch(errorOccurredModule(purchaseErrorModule.InvalidFunds))
			p6:dispatch(sendCounterModule(counterModule.UpsellFailedNotEnoughRobux))
		end):catch(function(p8)
			-- upvalues: p6 (ref), errorOccurredModule (copy)
			p6:dispatch(errorOccurredModule(p8))
		end)
	end)
end

return retryAfterUpsell