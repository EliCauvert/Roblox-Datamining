local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local abuseReportAnalyticsProvider = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider
local abuseReportInlineModule = require(genericAbuseReporting.BeduiV2.Components.AbuseReportInline)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(genericAbuseReporting.Enums.AbuseVector)
local arTranslationProvider = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local loaderContextModule = require(genericAbuseReporting.BeduiV2.Loaders.LoaderContext)
local useAbuseSheetFlowModule = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow)
local voiceSpeakingSignalsModule = require(genericAbuseReporting.BeduiV2.Utils.Signals.voiceSpeakingSignals)
local inlineSlots = layoutSlotsModule.inlineSlots
local layoutSlotsProvider = layoutSlotsModule.LayoutSlotsProvider
local overlaidControlsProvider = layoutSlotsModule.OverlaidControlsProvider
local loaderProvider = loaderContextModule.LoaderProvider
local fFlagAbuseReportInExpPlayerListV3 = sharedFlagsModule.FFlagAbuseReportInExpPlayerListV3
local fFlagAbuseReportVoiceMute = sharedFlagsModule.FFlagAbuseReportVoiceMute

return function(p0)
	-- upvalues: useAbuseSheetFlowModule (ref), reactModule (ref), arTranslationProvider (ref), abuseReportAnalyticsProvider (ref), layoutSlotsProvider (ref), inlineSlots (ref), overlaidControlsProvider (ref), loaderProvider (ref), abuseReportInlineModule (ref), fFlagAbuseReportInExpPlayerListV3 (ref), fFlagAbuseReportVoiceMute (ref), voiceSpeakingSignalsModule (ref)
	local var8 = useAbuseSheetFlowModule(p0.rawConfig, {
		open = true,
		abuseVector = p0.abuseVector,
		targetId = p0.targetId,
		onClose = p0.onClose,
		onCustomSubmit = p0.onCustomSubmit,
		clientActionHandlers = p0.clientActionHandlers,
		onFinish = p0.onFinish,
		attemptTrigger = p0.attemptTrigger,
		inlineAlertController = p0.inlineAlertController
	})
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), p0 (ref)
		if not var8 then
			p0.onResolveError()
		end
	end, { var8, p0.onResolveError })
	
	if not var8 then
		return nil
	end
	local var9 = reactModule.createElement(arTranslationProvider, { translations = var8.config.translations }, reactModule.createElement(abuseReportAnalyticsProvider, { analytics = var8.analytics }, reactModule.createElement(layoutSlotsProvider, { slots = inlineSlots }, reactModule.createElement(overlaidControlsProvider, { value = p0.shouldUseOverlaidControls }, reactModule.createElement(loaderProvider, { open = true, loaders = p0.loaders }, reactModule.createElement(abuseReportInlineModule, {
		abuseReportFlow = var8,
		shouldUseOverlaidControls = p0.shouldUseOverlaidControls
	}))))))
	
	return if fFlagAbuseReportInExpPlayerListV3 or fFlagAbuseReportVoiceMute then reactModule.createElement(voiceSpeakingSignalsModule.VoiceChatServiceManagerContext.Provider, { value = p0.voiceChatServiceManager }, var9) else var9
end