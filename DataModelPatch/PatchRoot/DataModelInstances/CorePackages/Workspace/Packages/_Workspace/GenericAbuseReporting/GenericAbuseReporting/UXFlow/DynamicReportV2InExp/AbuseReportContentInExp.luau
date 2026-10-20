local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ReactModule = require(GenericAbuseReporting.Parent.React)
local AbuseReportAnalyticsProvider = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider
local AbuseReportInlineModule = require(GenericAbuseReporting.BeduiV2.Components.AbuseReportInline)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(GenericAbuseReporting.Enums.AbuseVector)
local ArTranslationProvider = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider
local LayoutSlotsModule = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots)
local UseAbuseSheetFlowModule = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow)
local InlineSlots = LayoutSlotsModule.inlineSlots
local LayoutSlotsProvider = LayoutSlotsModule.LayoutSlotsProvider
local OverlaidControlsProvider = LayoutSlotsModule.OverlaidControlsProvider
local LoaderProvider = require(GenericAbuseReporting.BeduiV2.Loaders.LoaderContext).LoaderProvider

return function(p1)
	-- upvalues: UseAbuseSheetFlowModule (copy), ReactModule (copy), ArTranslationProvider (copy), AbuseReportAnalyticsProvider (copy), LayoutSlotsProvider (copy), InlineSlots (copy), OverlaidControlsProvider (copy), LoaderProvider (copy), AbuseReportInlineModule (copy)
	local UseAbuseSheetFlowModuleResult = UseAbuseSheetFlowModule(p1.rawConfig, {
		abuseVector = p1.abuseVector,
		targetId = p1.targetId,
		onClose = p1.onClose,
		open = p1.open,
		onCustomSubmit = p1.onCustomSubmit,
		onFinish = p1.onFinish,
		attemptTrigger = p1.attemptTrigger,
		inlineAlertController = p1.inlineAlertController
	})
	ReactModule.useEffect(function()
		-- upvalues: UseAbuseSheetFlowModuleResult (copy), p1 (copy)
		if not UseAbuseSheetFlowModuleResult then
			p1.onResolveError()
		end
	end, { UseAbuseSheetFlowModuleResult, p1.onResolveError })
	
	return if UseAbuseSheetFlowModuleResult then ReactModule.createElement(ArTranslationProvider, {
		translations = UseAbuseSheetFlowModuleResult.config.translations
	}, ReactModule.createElement(AbuseReportAnalyticsProvider, { analytics = UseAbuseSheetFlowModuleResult.analytics }, ReactModule.createElement(LayoutSlotsProvider, { slots = InlineSlots }, ReactModule.createElement(OverlaidControlsProvider, { value = p1.shouldUseOverlaidControls }, ReactModule.createElement(LoaderProvider, { loaders = p1.loaders, open = p1.open }, ReactModule.createElement(AbuseReportInlineModule, {
		abuseReportFlow = UseAbuseSheetFlowModuleResult,
		shouldUseOverlaidControls = p1.shouldUseOverlaidControls
	})))))) else nil
end