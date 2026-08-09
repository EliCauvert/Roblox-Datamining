local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local abuseReportAnalyticsProvider = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider
local abuseReportInlineModule = require(genericAbuseReporting.BeduiV2.Components.AbuseReportInline)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(genericAbuseReporting.Enums.AbuseVector)
local arTranslationProvider = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local loaderContextModule = require(genericAbuseReporting.BeduiV2.Loaders.LoaderContext)
local useAbuseSheetFlowModule = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow)
local inlineSlots = layoutSlotsModule.inlineSlots
local layoutSlotsProvider = layoutSlotsModule.LayoutSlotsProvider
local overlaidControlsProvider = layoutSlotsModule.OverlaidControlsProvider
local loaderProvider = loaderContextModule.LoaderProvider

return function(p0) --[[ line: 52 | named "AbuseReportContentInExp" ]]
	-- upvalues: useAbuseSheetFlowModule (ref), reactModule (ref), arTranslationProvider (ref), abuseReportAnalyticsProvider (ref), layoutSlotsProvider (ref), inlineSlots (ref), overlaidControlsProvider (ref), loaderProvider (ref), abuseReportInlineModule (ref)
	local var6 = useAbuseSheetFlowModule(p0.rawConfig, {
		abuseVector = p0.abuseVector,
		targetId = p0.targetId,
		onClose = p0.onClose,
		open = p0.open,
		onCustomSubmit = p0.onCustomSubmit,
		onFinish = p0.onFinish,
		attemptTrigger = p0.attemptTrigger,
		inlineAlertController = p0.inlineAlertController
	})
	reactModule.useEffect(function() --[[ line: 64 ]]
		-- upvalues: var6 (ref), p0 (ref)
		if not var6 then
			p0.onResolveError()
		end
	end, { var6, p0.onResolveError })
	
	return if var6 then reactModule.createElement(arTranslationProvider, { translations = var6.config.translations }, reactModule.createElement(abuseReportAnalyticsProvider, { analytics = var6.analytics }, reactModule.createElement(layoutSlotsProvider, { slots = inlineSlots }, reactModule.createElement(overlaidControlsProvider, { value = p0.shouldUseOverlaidControls }, reactModule.createElement(loaderProvider, { loaders = p0.loaders, open = p0.open }, reactModule.createElement(abuseReportInlineModule, {
		abuseReportFlow = var6,
		shouldUseOverlaidControls = p0.shouldUseOverlaidControls
	})))))) else nil
end