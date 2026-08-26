local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local httpService = game:GetService("HttpService")
local robloxSubscriptionStoreModule = require(robloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local logSubscriptionPurchaseFlowEventModule = require(robloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local fFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(robloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local promptStateModule = require(robloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(robloxSubscriptionPurchaseApp.Enums.ErrorReason)
local logRobloxSubscriptionUpsellCounterModule = require(robloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local robloxSubscriptionUpsellTelemetryModule = require(robloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local robloxSubscriptionLoggerModule = require(robloxSubscriptionPurchaseApp.Utils.RobloxSubscriptionLogger)

function transitionToError(p1, p2)
	-- upvalues: robloxSubscriptionStoreModule (ref), promptStateModule (ref), robloxSubscriptionLoggerModule (ref), logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), httpService (ref)
	local var1 = robloxSubscriptionStoreModule.get()
	var1.setErrorReason(p1)
	var1.setPromptState(promptStateModule.Error)
	robloxSubscriptionLoggerModule.debug({
		message = "Transitioning to error state",
		errorReason = tostring(p1),
		originalContext = p2 or "Unknown"
	})
	logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionPurchaseErrorShownCounter)
	
	if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		logSubscriptionPurchaseFlowEventModule("SubscriptionPurchaseErrorShown", {
			event_metadata = httpService:JSONEncode({ error_reason = tostring(p1), original_context = p2 or "" })
		})
	end
end

return transitionToError