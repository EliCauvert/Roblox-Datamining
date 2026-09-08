local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local IXPService = game:GetService("IXPService")
local localizationService = game:GetService("LocalizationService")
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local localization = require(parent.RobloxAppLocales).Localization
local constantsModule = require(interventionShared.Utils.Constants)
local interventionAnalyticsModule = require(interventionShared.InterventionAnalytics)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local useCountdownBindingModule = require(interventionShared.Hooks.useCountdownBinding)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local luauPolyfillModule = require(parent.LuauPolyfill)
local clearTimeout = luauPolyfillModule.clearTimeout
local setTimeout = luauPolyfillModule.setTimeout
local interventionTreatmentShownSignalModule = require(interventionShared.Signals.interventionTreatmentShownSignal)
local interventionDialogModule = require(interventionShared.Components.InterventionDialog)
local fFlagUFRFriendsChatIXPExposureModule = require(interventionShared.Flags.FFlagUFRFriendsChatIXPExposure)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), constantsModule (ref), localization (ref), localizationService (ref), reactModule (ref), fFlagUFRFriendsChatIXPExposureModule (ref), IXPService (ref), appUserLayers (ref), interventionTreatmentShownSignalModule (ref), useCountdownBindingModule (ref), setTimeout (ref), clearTimeout (ref), interventionDialogModule (ref), iconSize (ref), interventionAnalyticsModule (ref)
	local var1 = useTokens()
	local var2 = useLocalization(constantsModule.localizationKeys)
	local var3 = localization.new(localizationService.RobloxLocaleId)
	reactModule.useEffect(function()
		-- upvalues: fFlagUFRFriendsChatIXPExposureModule (copy), IXPService (copy), appUserLayers (copy), interventionTreatmentShownSignalModule (copy), constantsModule (copy)
		if fFlagUFRFriendsChatIXPExposureModule and game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			IXPService:LogFlagLinkedUserLayerExposure(appUserLayers.FriendsChatRestrictionUserIDLayer)
		end
		interventionTreatmentShownSignalModule:fire(constantsModule.TreatmentType.PartyChatTimeoutDialog)
	end, {})
	local var4 = useCountdownBindingModule(p1.endTimestamp, "0:00")
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), setTimeout (copy), clearTimeout (copy)
		local var5 = if p1.endTimestamp ~= nil then setTimeout(function()
			-- upvalues: p1 (copy)
			p1.onDismiss()
		end, math.max(p1.endTimestamp - DateTime.now().UnixTimestamp + 1, 1) * 1000) else nil
		
		return function()
			-- upvalues: var5 (write), clearTimeout (copy)
			if var5 then
				clearTimeout(var5)
			end
		end
	end, { p1.endTimestamp, p1.onDismiss })
	
	return reactModule.createElement(interventionDialogModule, {
		iconName = "icons/status/error_large",
		titleText = var4:map(function(p2)
			-- upvalues: var3 (ref), constantsModule (copy)
			return var3:Format(constantsModule.localizationKeys.PartyChatSuspendedText, { remainingTime = p2 })
		end),
		bodyText = var2.CantUsePartyChatText,
		onDismiss = p1.onDismiss,
		iconSize = iconSize.Large,
		iconStyle = var1.Color.System.Alert,
		eventId = p1.eventId,
		namespaceForAnalytics = interventionAnalyticsModule.Constants.CounterNamespaceTypes.PartyChat,
		interventionTypeForAnalytics = interventionAnalyticsModule.Constants.InterventionTypes.PartyChatTimeout,
		durationForAnalytics = p1.durationForAnalytics
	})
end)