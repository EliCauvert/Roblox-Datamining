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

function transitionToError(p0, p1)
	-- upvalues: robloxSubscriptionStoreModule (ref), promptStateModule (ref), robloxSubscriptionLoggerModule (ref), logRobloxSubscriptionUpsellCounterModule (ref), robloxSubscriptionUpsellTelemetryModule (ref), fFlagEnableSubscriptionPurchaseFlowEventIngestModule (ref), logSubscriptionPurchaseFlowEventModule (ref), httpService (ref)
	local var9 = robloxSubscriptionStoreModule.get()
	var9.setErrorReason(p0)
	var9.setPromptState(promptStateModule.Error)
	robloxSubscriptionLoggerModule.debug({
		message = "Transitioning to error state",
		errorReason = tostring(p0),
		originalContext = p1 or "Unknown"
	})
	logRobloxSubscriptionUpsellCounterModule(robloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionPurchaseErrorShownCounter)
	
	if fFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		logSubscriptionPurchaseFlowEventModule("SubscriptionPurchaseErrorShown", {
			event_metadata = httpService:JSONEncode({ error_reason = tostring(p0), original_context = p1 or "" })
		})
	end
end

return transitionToError