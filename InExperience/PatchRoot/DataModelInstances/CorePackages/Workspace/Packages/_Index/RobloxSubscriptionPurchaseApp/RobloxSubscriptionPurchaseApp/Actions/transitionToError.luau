local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local HttpService = game:GetService("HttpService")
local RobloxSubscriptionStoreModule = require(RobloxSubscriptionPurchaseApp.Store.RobloxSubscriptionStore)
local LogSubscriptionPurchaseFlowEventModule = require(RobloxSubscriptionPurchaseApp.Utils.logSubscriptionPurchaseFlowEvent)
local FFlagEnableSubscriptionPurchaseFlowEventIngestModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagEnableSubscriptionPurchaseFlowEventIngest)
local FFlagTTOnboardingSheetModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagTTOnboardingSheet)
local FFlagPlusMembershipConfigChangeCheck = require(RobloxSubscriptionPurchaseApp.Parent.SharedFlags).FFlagPlusMembershipConfigChangeCheck
local PromptStateModule = require(RobloxSubscriptionPurchaseApp.Enums.PromptState)
local _ = require(RobloxSubscriptionPurchaseApp.Enums.ErrorReason)
local RobloxPlusSheetKindModule = require(RobloxSubscriptionPurchaseApp.Enums.RobloxPlusSheetKind)
local LogRobloxSubscriptionUpsellCounterModule = require(RobloxSubscriptionPurchaseApp.Utils.logRobloxSubscriptionUpsellCounter)
local RobloxSubscriptionUpsellTelemetryModule = require(RobloxSubscriptionPurchaseApp.Events.RobloxSubscriptionUpsellTelemetry)
local RobloxSubscriptionLoggerModule = require(RobloxSubscriptionPurchaseApp.Utils.RobloxSubscriptionLogger)

function transitionToError(p1, p2)
	-- upvalues: RobloxSubscriptionStoreModule (copy), PromptStateModule (copy), FFlagTTOnboardingSheetModule (copy), RobloxSubscriptionLoggerModule (copy), LogRobloxSubscriptionUpsellCounterModule (copy), RobloxSubscriptionUpsellTelemetryModule (copy), FFlagEnableSubscriptionPurchaseFlowEventIngestModule (copy), LogSubscriptionPurchaseFlowEventModule (copy), HttpService (copy), RobloxPlusSheetKindModule (copy), FFlagPlusMembershipConfigChangeCheck (copy)
	local GetResult = RobloxSubscriptionStoreModule.get()
	GetResult.setErrorReason(p1)
	GetResult.setPromptState(PromptStateModule.Error)
	local PurchaseUIOptions = if FFlagTTOnboardingSheetModule then GetResult.getPurchaseUIOptions() else nil
	RobloxSubscriptionLoggerModule.debug({
		message = "Transitioning to error state",
		errorReason = tostring(p1),
		originalContext = p2 or "Unknown"
	})
	LogRobloxSubscriptionUpsellCounterModule(RobloxSubscriptionUpsellTelemetryModule.RobloxSubscriptionPurchaseErrorShownCounter)
	
	if FFlagEnableSubscriptionPurchaseFlowEventIngestModule then
		LogSubscriptionPurchaseFlowEventModule("SubscriptionPurchaseErrorShown", {
			event_metadata = HttpService:JSONEncode({
				error_reason = tostring(p1),
				original_context = p2 or "",
				sheet_kind = if FFlagTTOnboardingSheetModule and PurchaseUIOptions and PurchaseUIOptions.sheetKind == RobloxPlusSheetKindModule.TT then RobloxPlusSheetKindModule.TT else nil,
				include_upgrades = FFlagPlusMembershipConfigChangeCheck and GetResult.getPurchaseFlowOptions().includeUpgrades == true or nil
			})
		})
	end
end

return transitionToError