local LocalizationService = game:GetService("LocalizationService")
local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local Localization = require(Parent.RobloxAppLocales).Localization
local ConstantsModule = require(InterventionShared.Utils.Constants)
local InterventionAnalyticsModule = require(InterventionShared.InterventionAnalytics)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local UseCountdownBindingModule = require(InterventionShared.Hooks.useCountdownBinding)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local InterventionTreatmentShownSignalModule = require(InterventionShared.Signals.interventionTreatmentShownSignal)
local InterventionDialogModule = require(InterventionShared.Components.InterventionDialog)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), Localization (copy), LocalizationService (copy), ReactModule (copy), InterventionTreatmentShownSignalModule (copy), UseCountdownBindingModule (copy), SetTimeoutFunction (copy), ClearTimeoutFunction (copy), InterventionDialogModule (copy), IconSize (copy), InterventionAnalyticsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.localizationKeys)
	local NewLocalization = Localization.new(LocalizationService.RobloxLocaleId)
	ReactModule.useEffect(function()
		-- upvalues: InterventionTreatmentShownSignalModule (upval), ConstantsModule (upval)
		InterventionTreatmentShownSignalModule:fire(ConstantsModule.TreatmentType.PartyChatTimeoutDialog)
	end, {})
	local _000 = UseCountdownBindingModule(p1.endTimestamp, "0:00")
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), SetTimeoutFunction (upval), ClearTimeoutFunction (upval)
		local SetTimeoutResult = if p1.endTimestamp == nil then nil else SetTimeoutFunction(function()
			-- upvalues: p1 (upval)
			p1.onDismiss()
		end, math.max(p1.endTimestamp - DateTime.now().UnixTimestamp + 1, 1) * 1000)
		
		return function()
			-- upvalues: SetTimeoutResult (ref), ClearTimeoutFunction (upval)
			if SetTimeoutResult then
				ClearTimeoutFunction(SetTimeoutResult)
			end
		end
	end, { p1.endTimestamp, p1.onDismiss })
	
	return ReactModule.createElement(InterventionDialogModule, {
		iconName = "icons/status/error_large",
		titleText = _000:map(function(RemainingTime)
			-- upvalues: NewLocalization (copy), ConstantsModule (upval)
			return NewLocalization:Format(ConstantsModule.localizationKeys.PartyChatSuspendedText, { remainingTime = RemainingTime })
		end),
		bodyText = UseLocalizationResult.CantUsePartyChatText,
		onDismiss = p1.onDismiss,
		iconSize = IconSize.Large,
		iconStyle = UseTokensResult.Color.System.Alert,
		eventId = p1.eventId,
		namespaceForAnalytics = InterventionAnalyticsModule.Constants.CounterNamespaceTypes.PartyChat,
		interventionTypeForAnalytics = InterventionAnalyticsModule.Constants.InterventionTypes.PartyChatTimeout,
		durationForAnalytics = p1.durationForAnalytics
	})
end)