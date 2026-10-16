local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local FFlagEnableInlineSurveyOnUserReport = require(Parent.SharedFlags).FFlagEnableInlineSurveyOnUserReport
local AbuseReportAnalyticsProvider = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).AbuseReportAnalyticsProvider
local AbuseReportDialogModule = require(GenericAbuseReporting.BeduiV2.Components.AbuseReportDialog)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local _ = require(GenericAbuseReporting.Enums.AbuseVector)
local ArTranslationProvider = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).ArTranslationProvider
local LayoutSlotsModule = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots)
local UseAbuseSheetFlowModule = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.useAbuseSheetFlow)
local LayoutSlotsProvider = LayoutSlotsModule.LayoutSlotsProvider
local LoaderProvider = require(GenericAbuseReporting.BeduiV2.Loaders.LoaderContext).LoaderProvider
local SheetSlots = LayoutSlotsModule.sheetSlots

return (ReactModule.forwardRef(function(p1, p2) --[[ Line: 50 ]]
	-- upvalues: UseAbuseSheetFlowModule (copy), FFlagEnableInlineSurveyOnUserReport (copy), ReactModule (copy), AbuseReportDialogModule (copy), ArTranslationProvider (copy), AbuseReportAnalyticsProvider (copy), LoaderProvider (copy), LayoutSlotsProvider (copy), SheetSlots (copy)
	local UseAbuseSheetFlowModuleResult = UseAbuseSheetFlowModule(p1.rawConfig, {
		abuseVector = p1.abuseVector,
		analyticsTargetId = p1.analyticsTargetId,
		onClose = p1.onClose,
		open = p1.open,
		onCustomSubmit = p1.onCustomSubmit,
		clientActionHandlers = p1.clientActionHandlers,
		onFinish = if FFlagEnableInlineSurveyOnUserReport then p1.onFinish else nil
	})
	ReactModule.useImperativeHandle(p2, function() --[[ Line: 61 ]]
		-- upvalues: UseAbuseSheetFlowModuleResult (copy)
		return {
			requestClose = function() --[[ Line: 63 ]]
				-- upvalues: UseAbuseSheetFlowModuleResult (upval)
				if UseAbuseSheetFlowModuleResult then
					UseAbuseSheetFlowModuleResult.onClose()
				end
			end
		}
	end, { UseAbuseSheetFlowModuleResult })
	ReactModule.useEffect(function() --[[ Line: 71 ]]
		-- upvalues: UseAbuseSheetFlowModuleResult (copy), p1 (copy)
		if not UseAbuseSheetFlowModuleResult then
			p1.onResolveError()
		end
	end, { UseAbuseSheetFlowModuleResult, p1.onResolveError })
	
	return if UseAbuseSheetFlowModuleResult then ReactModule.createElement(ArTranslationProvider, {
		translations = UseAbuseSheetFlowModuleResult.config.translations
	}, ReactModule.createElement(AbuseReportAnalyticsProvider, { analytics = UseAbuseSheetFlowModuleResult.analytics }, ReactModule.createElement(LoaderProvider, { loaders = {}, open = p1.open }, ReactModule.createElement(LayoutSlotsProvider, { slots = SheetSlots }, (ReactModule.createElement(AbuseReportDialogModule, {
		abuseVector = p1.abuseVector,
		onClose = p1.onClose,
		abuseReportFlow = UseAbuseSheetFlowModuleResult,
		takeoverFocus = p1.takeoverFocus
	})))))) else nil
end))