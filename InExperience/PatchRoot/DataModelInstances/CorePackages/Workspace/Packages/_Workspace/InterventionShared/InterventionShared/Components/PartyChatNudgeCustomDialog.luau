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

return reactModule.memo(function(p0) --[[ line: 21 ]]
	-- upvalues: useTokens (ref), useLocalization (ref), constantsModule (ref), reactModule (ref), interventionTreatmentShownSignalModule (ref), interventionDialogModule (ref), iconSize (ref), interventionAnalyticsModule (ref)
	local var7 = useTokens()
	local var8 = useLocalization(constantsModule.localizationKeys)
	reactModule.useEffect(function() --[[ line: 24 ]]
		-- upvalues: interventionTreatmentShownSignalModule (copy), constantsModule (copy)
		interventionTreatmentShownSignalModule:fire(constantsModule.TreatmentType.PartyChatNudgeDialog)
	end, {})
	
	return reactModule.createElement(interventionDialogModule, {
		iconName = "icons/status/error_large",
		titleText = var8.DontSharePersonalInformationText,
		bodyText = var8.PartyChatMayBeSuspendedText,
		onDismiss = p0.onDismiss,
		iconSize = iconSize.Large,
		iconStyle = var7.Color.System.Warning,
		eventId = p0.eventId,
		namespaceForAnalytics = interventionAnalyticsModule.Constants.CounterNamespaceTypes.PartyChat,
		interventionTypeForAnalytics = interventionAnalyticsModule.Constants.InterventionTypes.PartyChatNudge
	})
end)