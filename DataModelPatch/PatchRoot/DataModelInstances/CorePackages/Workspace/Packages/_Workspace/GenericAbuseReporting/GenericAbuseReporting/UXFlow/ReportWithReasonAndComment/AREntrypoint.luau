local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local AnalyticsProviderModule = require(GenericAbuseReporting.Analytics.AnalyticsProvider)
local LayerCollectorProvider = require(Parent.UIBlox).Core.Layout.LayerCollector.LayerCollectorProvider
local LocalizationKeysProviderModule = require(GenericAbuseReporting.LocalizationKeys.LocalizationKeysProvider)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ReportWithReasonAndCommentModule = require(script.Parent.ReportWithReasonAndComment)
local ReportCompleteDialogModule = require(GenericAbuseReporting.Dialogs.ReportCompleteDialog)
local ReportFailedDialogModule = require(GenericAbuseReporting.Dialogs.ReportFailedDialog)
local _ = require(GenericAbuseReporting.Analytics.submitAnalytics)
local UseActiveDialogModule = require(script.Parent.useActiveDialog)

return function(p1)
	-- upvalues: UseActiveDialogModule (copy), ReactModule (copy), LayerCollectorProvider (copy), FoundationProvider (copy), FoundationModule (copy), AnalyticsProviderModule (copy), LocalizationKeysProviderModule (copy), ReportWithReasonAndCommentModule (copy), ReportCompleteDialogModule (copy), ReportFailedDialogModule (copy)
	local UseActiveDialogModuleResult, UseActiveDialogModuleResult2 = UseActiveDialogModule()
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (copy), UseActiveDialogModuleResult2 (copy)
		local OnProceedToNextStepResult = if p1.onSubmitProps.hasNextSteps then p1.onSubmitProps.onProceedToNextStep(p2, p3) else p1.onSubmitProps.onSubmit(p2, p3)
		
		if OnProceedToNextStepResult then
			UseActiveDialogModuleResult2("Complete")
			
			return OnProceedToNextStepResult
		else
			UseActiveDialogModuleResult2("Error")
			
			return OnProceedToNextStepResult
		end
	end, { p1.onSubmitProps })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseActiveDialogModuleResult2 (copy)
		UseActiveDialogModuleResult2("Form")
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onComplete then
			p1.onComplete()
		end
	end, { p1.onComplete })
	
	return ReactModule.createElement(LayerCollectorProvider, {}, {
		FoundationProvider = ReactModule.createElement(FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, {
			analytics = ReactModule.createElement(AnalyticsProviderModule, {
				onBeforeSubmitAnalytics = p1.onBeforeSubmitAnalytics,
				onSubmitAnalytics = p1.onSubmitAnalytics
			}, {
				localizationKeys = ReactModule.createElement(LocalizationKeysProviderModule, { localizationKeys = p1.localizationKeys }, {
					submitDialog = UseActiveDialogModuleResult == "Form" and ReactModule.createElement(ReportWithReasonAndCommentModule, {
						analyticsContext = p1.analyticsContext,
						topCustomComponent = p1.topCustomComponent,
						footerContent = p1.footerContent,
						reportCategories = p1.reportCategories,
						onCloseProps = p1.onCloseProps,
						onSubmitProps = if p1.onSubmitProps.hasNextSteps then {
							hasNextSteps = p1.onSubmitProps.hasNextSteps,
							onProceedToNextStep = UseResult
						} else {
							hasNextSteps = p1.onSubmitProps.hasNextSteps,
							onSubmit = UseResult
						},
						reportCategoryDefaultKey = p1.reportCategoryDefaultKey,
						isDisabled = p1.isDisabled,
						isReportCategoryReadonly = p1.isReportCategoryReadonly,
						scaleDialog = p1.scaleDialog
					}),
					completeDialog = UseActiveDialogModuleResult == "Complete" and ReactModule.createElement(ReportCompleteDialogModule, { onDismiss = UseResult2 }),
					errorDialog = UseActiveDialogModuleResult == "Error" and ReactModule.createElement(ReportFailedDialogModule, { onDismiss = UseResult1 })
				})
			})
		})
	})
end