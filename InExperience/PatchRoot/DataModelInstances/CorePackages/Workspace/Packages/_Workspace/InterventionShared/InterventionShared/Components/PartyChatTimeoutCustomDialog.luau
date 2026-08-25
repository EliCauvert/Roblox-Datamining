local localizationService = game:GetService("LocalizationService")
local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
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

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), useLocalization (ref), constantsModule (ref), localization (ref), localizationService (ref), reactModule (ref), interventionTreatmentShownSignalModule (ref), useCountdownBindingModule (ref), setTimeout (ref), clearTimeout (ref), interventionDialogModule (ref), iconSize (ref), interventionAnalyticsModule (ref)
	local var10 = useTokens()
	local var11 = useLocalization(constantsModule.localizationKeys)
	local var12 = localization.new(localizationService.RobloxLocaleId)
	reactModule.useEffect(function()
		-- upvalues: interventionTreatmentShownSignalModule (copy), constantsModule (copy)
		interventionTreatmentShownSignalModule:fire(constantsModule.TreatmentType.PartyChatTimeoutDialog)
	end, {})
	local var13 = useCountdownBindingModule(p0.endTimestamp, "0:00")
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), setTimeout (copy), clearTimeout (copy)
		local var14 = if p0.endTimestamp ~= nil then setTimeout(function()
			-- upvalues: p0 (copy)
			p0.onDismiss()
		end, math.max(p0.endTimestamp - DateTime.now().UnixTimestamp + 1, 1) * 1000) else nil
		
		return function()
			-- upvalues: var14 (write), clearTimeout (copy)
			if var14 then
				clearTimeout(var14)
			end
		end
	end, { p0.endTimestamp, p0.onDismiss })
	
	return reactModule.createElement(interventionDialogModule, {
		iconName = "icons/status/error_large",
		titleText = var13:map(function(p1)
			-- upvalues: var12 (ref), constantsModule (copy)
			return var12:Format(constantsModule.localizationKeys.PartyChatSuspendedText, { remainingTime = p1 })
		end),
		bodyText = var11.CantUsePartyChatText,
		onDismiss = p0.onDismiss,
		iconSize = iconSize.Large,
		iconStyle = var10.Color.System.Alert,
		eventId = p0.eventId,
		namespaceForAnalytics = interventionAnalyticsModule.Constants.CounterNamespaceTypes.PartyChat,
		interventionTypeForAnalytics = interventionAnalyticsModule.Constants.InterventionTypes.PartyChatTimeout,
		durationForAnalytics = p0.durationForAnalytics
	})
end)