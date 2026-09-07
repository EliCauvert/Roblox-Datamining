local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local constantsModule = require(interventionShared.Utils.Constants)
local interventionAnalyticsModule = require(interventionShared.InterventionAnalytics)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local interventionTreatmentShownSignalModule = require(interventionShared.Signals.interventionTreatmentShownSignal)
local interventionDialogModule = require(interventionShared.Components.InterventionDialog)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), constantsModule (ref), reactModule (ref), interventionTreatmentShownSignalModule (ref), interventionDialogModule (ref), iconSize (ref), interventionAnalyticsModule (ref)
	local var1 = useTokens()
	local var2 = useLocalization(constantsModule.localizationKeys)
	reactModule.useEffect(function()
		-- upvalues: interventionTreatmentShownSignalModule (copy), constantsModule (copy)
		interventionTreatmentShownSignalModule:fire(constantsModule.TreatmentType.PartyChatNudgeDialog)
	end, {})
	
	return reactModule.createElement(interventionDialogModule, {
		iconName = "icons/status/error_large",
		titleText = var2.DontSharePersonalInformationText,
		bodyText = var2.PartyChatMayBeSuspendedText,
		onDismiss = p1.onDismiss,
		iconSize = iconSize.Large,
		iconStyle = var1.Color.System.Warning,
		eventId = p1.eventId,
		namespaceForAnalytics = interventionAnalyticsModule.Constants.CounterNamespaceTypes.PartyChat,
		interventionTypeForAnalytics = interventionAnalyticsModule.Constants.InterventionTypes.PartyChatNudge
	})
end)