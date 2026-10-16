local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local IXPService = game:GetService("IXPService")
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local ConstantsModule = require(InterventionShared.Utils.Constants)
local InterventionAnalyticsModule = require(InterventionShared.InterventionAnalytics)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local InterventionTreatmentShownSignalModule = require(InterventionShared.Signals.interventionTreatmentShownSignal)
local InterventionDialogModule = require(InterventionShared.Components.InterventionDialog)
local FFlagUFRFriendsChatIXPExposureModule = require(InterventionShared.Flags.FFlagUFRFriendsChatIXPExposure)

return ReactModule.memo(function(p1) --[[ Line: 26 ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy), FFlagUFRFriendsChatIXPExposureModule (copy), IXPService (copy), AppUserLayers (copy), InterventionTreatmentShownSignalModule (copy), InterventionDialogModule (copy), IconSize (copy), InterventionAnalyticsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.localizationKeys)
	ReactModule.useEffect(function() --[[ Line: 29 ]]
		-- upvalues: FFlagUFRFriendsChatIXPExposureModule (upval), IXPService (upval), AppUserLayers (upval), InterventionTreatmentShownSignalModule (upval), ConstantsModule (upval)
		if FFlagUFRFriendsChatIXPExposureModule and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			IXPService:LogFlagLinkedUserLayerExposure(AppUserLayers.FriendsChatRestrictionUserIDLayer)
		end
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