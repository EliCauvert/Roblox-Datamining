local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local fFlagEnableInlineSurveyOnUserReport = require(parent.SharedFlags).FFlagEnableInlineSurveyOnUserReport
local abuseReportAnalyticsProvider = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider
local abuseReportDialogModule = require(genericAbuseReporting.BeduiV2.Components.AbuseReportDialog)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(genericAbuseReporting.Enums.AbuseVector)
local arTranslationProvider = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local loaderContextModule = require(genericAbuseReporting.BeduiV2.Loaders.LoaderContext)
local useAbuseSheetFlowModule = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow)
local layoutSlotsProvider = layoutSlotsModule.LayoutSlotsProvider
local loaderProvider = loaderContextModule.LoaderProvider
local sheetSlots = layoutSlotsModule.sheetSlots

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: useAbuseSheetFlowModule (ref), fFlagEnableInlineSurveyOnUserReport (ref), reactModule (ref), abuseReportDialogModule (ref), arTranslationProvider (ref), abuseReportAnalyticsProvider (ref), loaderProvider (ref), layoutSlotsProvider (ref), sheetSlots (ref)
	local var6 = useAbuseSheetFlowModule(p0.rawConfig, {
		abuseVector = p0.abuseVector,
		targetId = p0.targetId,
		onClose = p0.onClose,
		open = p0.open,
		onCustomSubmit = p0.onCustomSubmit,
		clientActionHandlers = p0.clientActionHandlers,
		onFinish = if fFlagEnableInlineSurveyOnUserReport then p0.onFinish else nil
	})
	reactModule.useImperativeHandle(p1, function()
		-- upvalues: var6 (ref)
		return {
			requestClose = function()
				-- upvalues: var6 (copy)
				if var6 then
					var6.onClose()
				end
			end
		}
	end, { var6 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), p0 (ref)
		if not var6 then
			p0.onResolveError()
		end
	end, { var6, p0.onResolveError })
	
	return if var6 then reactModule.createElement(arTranslationProvider, { translations = var6.config.translations }, reactModule.createElement(abuseReportAnalyticsProvider, { analytics = var6.analytics }, reactModule.createElement(loaderProvider, { loaders = {}, open = p0.open }, reactModule.createElement(layoutSlotsProvider, { slots = sheetSlots }, reactModule.createElement(abuseReportDialogModule, {
		abuseVector = p0.abuseVector,
		targetId = p0.targetId,
		onClose = p0.onClose,
		abuseReportFlow = var6,
		takeoverFocus = p0.takeoverFocus
	}))))) else nil
end)