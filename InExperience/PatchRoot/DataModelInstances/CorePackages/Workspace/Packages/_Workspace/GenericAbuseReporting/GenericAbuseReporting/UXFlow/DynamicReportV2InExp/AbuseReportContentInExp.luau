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

return function(p1)
	-- upvalues: useAbuseSheetFlowModule (ref), reactModule (ref), arTranslationProvider (ref), abuseReportAnalyticsProvider (ref), layoutSlotsProvider (ref), inlineSlots (ref), overlaidControlsProvider (ref), loaderProvider (ref), abuseReportInlineModule (ref), fFlagAbuseReportInExpPlayerListV3 (ref), fFlagAbuseReportVoiceMute (ref), voiceSpeakingSignalsModule (ref)
	local var1 = useAbuseSheetFlowModule(p1.rawConfig, {
		open = true,
		abuseVector = p1.abuseVector,
		targetId = p1.targetId,
		onClose = p1.onClose,
		onCustomSubmit = p1.onCustomSubmit,
		clientActionHandlers = p1.clientActionHandlers,
		onFinish = p1.onFinish,
		attemptTrigger = p1.attemptTrigger,
		inlineAlertController = p1.inlineAlertController
	})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref)
		if not var1 then
			p1.onResolveError()
		end
	end, { var1, p1.onResolveError })
	
	if not var1 then
		return nil
	end
	local var2 = reactModule.createElement(arTranslationProvider, { translations = var1.config.translations }, reactModule.createElement(abuseReportAnalyticsProvider, { analytics = var1.analytics }, reactModule.createElement(layoutSlotsProvider, { slots = inlineSlots }, reactModule.createElement(overlaidControlsProvider, { value = p1.shouldUseOverlaidControls }, reactModule.createElement(loaderProvider, { open = true, loaders = p1.loaders }, reactModule.createElement(abuseReportInlineModule, {
		abuseReportFlow = var1,
		shouldUseOverlaidControls = p1.shouldUseOverlaidControls
	}))))))
	
	return if fFlagAbuseReportInExpPlayerListV3 or fFlagAbuseReportVoiceMute then reactModule.createElement(voiceSpeakingSignalsModule.VoiceChatServiceManagerContext.Provider, { value = p1.voiceChatServiceManager }, var2) else var2
end