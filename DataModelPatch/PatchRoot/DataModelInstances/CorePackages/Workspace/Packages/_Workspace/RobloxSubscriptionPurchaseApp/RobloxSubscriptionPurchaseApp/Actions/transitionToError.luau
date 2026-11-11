local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local HttpService = game:GetService("HttpService")
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local LogSubscriptionPurchaseFlowEventModule = require(RobloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local FFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)
local LogRobloxSubscriptionUpsellCounterModule = require(RobloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local RobloxSubscriptionUpsellTelemetryModule = require(RobloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local RobloxSubscriptionLoggerModule = require(RobloxSubscriptionPurchaseApp.Utils.RobloxSubscriptionLogger)

function transitionToError(p1, p2)
	-- upvalues: RobloxSubscriptionStoreModule (copy), PromptStateModule (copy), RobloxSubscriptionLoggerModule (copy), LogRobloxSubscriptionUpsellCounterModule (copy), RobloxSubscriptionUpsellTelemetryModule (copy), FFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), LogSubscriptionPurchaseFlowEventModule (copy), HttpService (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	GetResult.setErrorReason(p1)
	GetResult.setPromptState(PromptStateModule.Error)
	RobloxSubscriptionLoggerModule.debug({
		message = "Transitioning to error state",
		errorReason = tostring(p1),
		originalContext = p2 or "Unknown"
	})
	LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionPurchaseErrorShownCounter)
	
	if FFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		LogSubscriptionPurchaseFlowEventModule("SubscriptionPurchaseErrorShown", {
			event_metadata = HttpService:JSONEncode({ error_reason = tostring(p1), original_context = p2 or "" })
		})
	end
end

return transitionToError