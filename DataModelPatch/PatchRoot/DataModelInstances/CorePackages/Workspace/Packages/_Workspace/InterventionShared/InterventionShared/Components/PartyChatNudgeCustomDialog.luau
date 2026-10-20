local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local ConstantsModule = require(InterventionShared.Utils.Constants)
local InterventionAnalyticsModule = require(InterventionShared.InterventionAnalytics)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local InterventionTreatmentShownSignalModule = require(InterventionShared.Signals.interventionTreatmentShownSignal)
local InterventionDialogModule = require(InterventionShared.Components.InterventionDialog)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), InterventionTreatmentShownSignalModule (copy), InterventionDialogModule (copy), IconSize (copy), InterventionAnalyticsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.localizationKeys)
	ReactModule.useEffect(function()
		-- upvalues: InterventionTreatmentShownSignalModule (upval), ConstantsModule (upval)
		InterventionTreatmentShownSignalModule:fire(ConstantsModule.TreatmentType.PartyChatNudgeDialog)
	end, {})
	
	return ReactModule.createElement(InterventionDialogModule, {
		iconName = "icons/status/error_large",
		titleText = UseLocalizationResult.DontSharePersonalInformationText,
		bodyText = UseLocalizationResult.PartyChatMayBeSuspendedText,
		onDismiss = p1.onDismiss,
		iconSize = IconSize.Large,
		iconStyle = UseTokensResult.Color.System.Warning,
		eventId = p1.eventId,
		namespaceForAnalytics = InterventionAnalyticsModule.Constants.CounterNamespaceTypes.PartyChat,
		interventionTypeForAnalytics = InterventionAnalyticsModule.Constants.InterventionTypes.PartyChatNudge
	})
end)