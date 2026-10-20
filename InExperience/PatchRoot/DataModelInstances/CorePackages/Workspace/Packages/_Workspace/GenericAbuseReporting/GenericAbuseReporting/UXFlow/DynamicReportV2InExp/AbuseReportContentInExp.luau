local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local AbuseReportAnalyticsProvider = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider
local AbuseReportInlineModule = require(GenericAbuseReporting.BeduiV2.Components.AbuseReportInline)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(GenericAbuseReporting.Enums.AbuseVector)
local ArTranslationProvider = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider
local LayoutSlotsModule = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots)
local UseAbuseSheetFlowModule = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow)
local VoiceSpeakingSignalsModule = require(GenericAbuseReporting.BeduiV2.Utils.Signals.voiceSpeakingSignals)
local InlineSlots = LayoutSlotsModule.inlineSlots
local LayoutSlotsProvider = LayoutSlotsModule.LayoutSlotsProvider
local OverlaidControlsProvider = LayoutSlotsModule.OverlaidControlsProvider
local LoaderProvider = require(GenericAbuseReporting.BeduiV2.Loaders.LoaderContext).LoaderProvider
local FFlagAbuseReportInExpPlayerListV3 = SharedFlagsModule.FFlagAbuseReportInExpPlayerListV3
local FFlagAbuseReportVoiceMute = SharedFlagsModule.FFlagAbuseReportVoiceMute

return function(p1)
	-- upvalues: UseAbuseSheetFlowModule (copy), ReactModule (copy), ArTranslationProvider (copy), AbuseReportAnalyticsProvider (copy), LayoutSlotsProvider (copy), InlineSlots (copy), OverlaidControlsProvider (copy), LoaderProvider (copy), AbuseReportInlineModule (copy), FFlagAbuseReportInExpPlayerListV3 (copy), FFlagAbuseReportVoiceMute (copy), VoiceSpeakingSignalsModule (copy)
	local UseAbuseSheetFlowModuleResult = UseAbuseSheetFlowModule(p1.rawConfig, {
		open = true,
		abuseVector = p1.abuseVector,
		analyticsTargetId = p1.targetId,
		onClose = p1.onClose,
		onCustomSubmit = p1.onCustomSubmit,
		clientActionHandlers = p1.clientActionHandlers,
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
	
	if UseAbuseSheetFlowModuleResult then
		local Element = ReactModule.createElement(ArTranslationProvider, {
			translations = UseAbuseSheetFlowModuleResult.config.translations
		}, ReactModule.createElement(AbuseReportAnalyticsProvider, { analytics = UseAbuseSheetFlowModuleResult.analytics }, ReactModule.createElement(LayoutSlotsProvider, { slots = InlineSlots }, ReactModule.createElement(OverlaidControlsProvider, { value = p1.shouldUseOverlaidControls }, ReactModule.createElement(LoaderProvider, { open = true, loaders = p1.loaders }, ReactModule.createElement(AbuseReportInlineModule, {
			abuseReportFlow = UseAbuseSheetFlowModuleResult,
			shouldUseOverlaidControls = p1.shouldUseOverlaidControls
		}))))))
		
		return if FFlagAbuseReportInExpPlayerListV3 or FFlagAbuseReportVoiceMute then ReactModule.createElement(VoiceSpeakingSignalsModule.VoiceChatServiceManagerContext.Provider, { value = p1.voiceChatServiceManager }, Element) else Element
	else
		return nil
	end
end