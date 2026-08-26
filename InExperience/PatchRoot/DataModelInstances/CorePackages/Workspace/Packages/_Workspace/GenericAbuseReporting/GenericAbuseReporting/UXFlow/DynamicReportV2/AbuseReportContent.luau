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

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useAbuseSheetFlowModule (ref), fFlagEnableInlineSurveyOnUserReport (ref), reactModule (ref), abuseReportDialogModule (ref), arTranslationProvider (ref), abuseReportAnalyticsProvider (ref), loaderProvider (ref), layoutSlotsProvider (ref), sheetSlots (ref)
	local var1 = useAbuseSheetFlowModule(p1.rawConfig, {
		abuseVector = p1.abuseVector,
		targetId = p1.targetId,
		onClose = p1.onClose,
		open = p1.open,
		onCustomSubmit = p1.onCustomSubmit,
		clientActionHandlers = p1.clientActionHandlers,
		onFinish = if fFlagEnableInlineSurveyOnUserReport then p1.onFinish else nil
	})
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var1 (ref)
		return {
			requestClose = function()
				-- upvalues: var1 (copy)
				if var1 then
					var1.onClose()
				end
			end
		}
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref)
		if not var1 then
			p1.onResolveError()
		end
	end, { var1, p1.onResolveError })
	
	return if var1 then reactModule.createElement(arTranslationProvider, { translations = var1.config.translations }, reactModule.createElement(abuseReportAnalyticsProvider, { analytics = var1.analytics }, reactModule.createElement(loaderProvider, { loaders = {}, open = p1.open }, reactModule.createElement(layoutSlotsProvider, { slots = sheetSlots }, reactModule.createElement(abuseReportDialogModule, {
		abuseVector = p1.abuseVector,
		targetId = p1.targetId,
		onClose = p1.onClose,
		abuseReportFlow = var1,
		takeoverFocus = p1.takeoverFocus
	}))))) else nil
end)