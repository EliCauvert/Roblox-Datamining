local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local analyticsProviderModule = require(genericAbuseReporting.Analytics.AnalyticsProvider)
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local localizationKeysProviderModule = require(genericAbuseReporting.LocalizationKeys.LocalizationKeysProvider)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local reportWithReasonAndCommentModule = require(script.Parent.ReportWithReasonAndComment)
local reportCompleteDialogModule = require(genericAbuseReporting.Dialogs.ReportCompleteDialog)
local reportFailedDialogModule = require(genericAbuseReporting.Dialogs.ReportFailedDialog)
local _ = require(genericAbuseReporting.Analytics.submitAnalytics)
local useActiveDialogModule = require(script.Parent.useActiveDialog)
local _ = { Form = "Form", Complete = "Complete", Error = "Error" }

return function(p0)
	-- upvalues: useActiveDialogModule (ref), reactModule (ref), layerCollectorProvider (ref), foundationProvider (ref), foundationModule (ref), analyticsProviderModule (ref), localizationKeysProviderModule (ref), reportWithReasonAndCommentModule (ref), reportCompleteDialogModule (ref), reportFailedDialogModule (ref)
	local var9, var10 = useActiveDialogModule()
	local var11 = reactModule.useCallback(function(p1, p2)
		-- upvalues: p0 (ref), var10 (ref)
		local var12 = if p0.onSubmitProps.hasNextSteps then p0.onSubmitProps.onProceedToNextStep(p1, p2) else p0.onSubmitProps.onSubmit(p1, p2)
		
		if var12 then
			var10("Complete")
			
			return var12
		end
		var10("Error")
		
		return var12
	end, { p0.onSubmitProps })
	
	return reactModule.createElement(layerCollectorProvider, {}, {
		FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
			analytics = reactModule.createElement(analyticsProviderModule, {
				onBeforeSubmitAnalytics = p0.onBeforeSubmitAnalytics,
				onSubmitAnalytics = p0.onSubmitAnalytics
			}, {
				localizationKeys = reactModule.createElement(localizationKeysProviderModule, { localizationKeys = p0.localizationKeys }, {
					submitDialog = var9 == "Form" and reactModule.createElement(reportWithReasonAndCommentModule, {
						analyticsContext = p0.analyticsContext,
						topCustomComponent = p0.topCustomComponent,
						footerContent = p0.footerContent,
						reportCategories = p0.reportCategories,
						onCloseProps = p0.onCloseProps,
						onSubmitProps = if p0.onSubmitProps.hasNextSteps then {
							hasNextSteps = p0.onSubmitProps.hasNextSteps,
							onProceedToNextStep = var11
						} else {
							hasNextSteps = p0.onSubmitProps.hasNextSteps,
							onSubmit = var11
						},
						reportCategoryDefaultKey = p0.reportCategoryDefaultKey,
						isDisabled = p0.isDisabled,
						isReportCategoryReadonly = p0.isReportCategoryReadonly,
						scaleDialog = p0.scaleDialog
					}),
					completeDialog = var9 == "Complete" and reactModule.createElement(reportCompleteDialogModule, {
						onDismiss = reactModule.useCallback(function()
							-- upvalues: p0 (ref)
							if p0.onComplete then
								p0.onComplete()
							end
						end, { p0.onComplete })
					}),
					errorDialog = var9 == "Error" and reactModule.createElement(reportFailedDialogModule, {
						onDismiss = reactModule.useCallback(function()
							-- upvalues: var10 (ref)
							var10("Form")
						end, {})
					})
				})
			})
		})
	})
end