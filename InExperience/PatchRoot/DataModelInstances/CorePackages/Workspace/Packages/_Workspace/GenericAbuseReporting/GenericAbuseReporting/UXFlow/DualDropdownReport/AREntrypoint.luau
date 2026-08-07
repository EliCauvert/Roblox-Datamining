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

return function(p0) --[[ line: 52 | named "AREntrypoint" ]]
	-- upvalues: useActiveDialogModule (ref), reactModule (ref), layerCollectorProvider (ref), foundationProvider (ref), analyticsProviderModule (ref), localizationKeysProviderModule (ref), dualDropdownReportModule (ref), reportCompleteDialogModule (ref), reportFailedDialogModule (ref)
	local var8, var9 = useActiveDialogModule()
	local var10 = reactModule.useCallback(function(p1, p2, p3) --[[ line: 55 ]]
		-- upvalues: p0 (ref), var9 (ref)
		local var11 = if p0.onSubmitProps.hasNextSteps then p0.onSubmitProps.onProceedToNextStep(p1, p2, p3) else p0.onSubmitProps.onSubmit(p1, p2, p3)
		
		if var11 then
			var9("Complete")
			
			return var11
		end
		var9("Error")
		
		return var11
	end, { p0.onSubmitProps })
	
	return reactModule.createElement(layerCollectorProvider, {}, {
		FoundationProvider = reactModule.createElement(foundationProvider, { theme = "Dark" }, {
			analytics = reactModule.createElement(analyticsProviderModule, {
				onBeforeSubmitAnalytics = p0.onBeforeSubmitAnalytics,
				onSubmitAnalytics = p0.onSubmitAnalytics
			}, {
				localizationKeys = reactModule.createElement(localizationKeysProviderModule, { localizationKeys = p0.localizationKeys }, {
					submitDialog = var8 == "Form" and reactModule.createElement(dualDropdownReportModule, {
						analyticsContext = p0.analyticsContext,
						reportProblems = p0.reportProblems,
						reportSurfaces = p0.reportSurfaces,
						onSubmitProps = if p0.onSubmitProps.hasNextSteps then {
							hasNextSteps = p0.onSubmitProps.hasNextSteps,
							onProceedToNextStep = var10
						} else {
							hasNextSteps = p0.onSubmitProps.hasNextSteps,
							onSubmit = var10
						},
						onCloseProps = p0.onCloseProps
					}),
					completeDialog = var8 == "Complete" and reactModule.createElement(reportCompleteDialogModule, {
						onDismiss = reactModule.useCallback(function() --[[ line: 71 ]]
							-- upvalues: p0 (ref)
							if p0.onComplete then
								p0.onComplete()
							end
						end, { p0.onComplete })
					}),
					errorDialog = var8 == "Error" and reactModule.createElement(reportFailedDialogModule, {
						onDismiss = reactModule.useCallback(function() --[[ line: 67 ]]
							-- upvalues: var9 (ref)
							var9("Form")
						end, {})
					})
				})
			})
		})
	})
end