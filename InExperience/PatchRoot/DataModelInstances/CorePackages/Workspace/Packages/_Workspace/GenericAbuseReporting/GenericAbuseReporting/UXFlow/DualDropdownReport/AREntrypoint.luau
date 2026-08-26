local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local analyticsProviderModule = require(genericAbuseReporting.Analytics.AnalyticsProvider)
local layerCollectorProvider = require(parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local localizationKeysProviderModule = require(genericAbuseReporting.LocalizationKeys.LocalizationKeysProvider)
local foundationProvider = require(parent.Foundation).FoundationProvider
local dualDropdownReportModule = require(script.Parent.DualDropdownReport)
local reportCompleteDialogModule = require(genericAbuseReporting.Dialogs.ReportCompleteDialog)
local reportFailedDialogModule = require(genericAbuseReporting.Dialogs.ReportFailedDialog)
local _ = require(genericAbuseReporting.Analytics.submitAnalytics)
local useActiveDialogModule = require(script.Parent.useActiveDialog)
local _ = { Form = "Form", Complete = "Complete", Error = "Error" }

return function(p1)
	-- upvalues: useActiveDialogModule (ref), reactModule (ref), layerCollectorProvider (ref), foundationProvider (ref), analyticsProviderModule (ref), localizationKeysProviderModule (ref), dualDropdownReportModule (ref), reportCompleteDialogModule (ref), reportFailedDialogModule (ref)
	local var1, var2 = useActiveDialogModule()
	local var3 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: p1 (ref), var2 (ref)
		local var4 = if p1.onSubmitProps.hasNextSteps then p1.onSubmitProps.onProceedToNextStep(p2, p3, p4) else p1.onSubmitProps.onSubmit(p2, p3, p4)
		
		if var4 then
			var2("Complete")
			
			return var4
		end
		var2("Error")
		
		return var4
	end, { p1.onSubmitProps })
	
	return reactModule.createElement(layerCollectorProvider, {}, {
		FoundationProvider = reactModule.createElement(foundationProvider, { colorMode = "Dark" }, {
			analytics = reactModule.createElement(analyticsProviderModule, {
				onBeforeSubmitAnalytics = p1.onBeforeSubmitAnalytics,
				onSubmitAnalytics = p1.onSubmitAnalytics
			}, {
				localizationKeys = reactModule.createElement(localizationKeysProviderModule, { localizationKeys = p1.localizationKeys }, {
					submitDialog = var1 == "Form" and reactModule.createElement(dualDropdownReportModule, {
						analyticsContext = p1.analyticsContext,
						reportProblems = p1.reportProblems,
						reportSurfaces = p1.reportSurfaces,
						onSubmitProps = if p1.onSubmitProps.hasNextSteps then {
							hasNextSteps = p1.onSubmitProps.hasNextSteps,
							onProceedToNextStep = var3
						} else {
							hasNextSteps = p1.onSubmitProps.hasNextSteps,
							onSubmit = var3
						},
						onCloseProps = p1.onCloseProps
					}),
					completeDialog = var1 == "Complete" and reactModule.createElement(reportCompleteDialogModule, {
						onDismiss = reactModule.useCallback(function()
							-- upvalues: p1 (ref)
							if p1.onComplete then
								p1.onComplete()
							end
						end, { p1.onComplete })
					}),
					errorDialog = var1 == "Error" and reactModule.createElement(reportFailedDialogModule, {
						onDismiss = reactModule.useCallback(function()
							-- upvalues: var2 (ref)
							var2("Form")
						end, {})
					})
				})
			})
		})
	})
end