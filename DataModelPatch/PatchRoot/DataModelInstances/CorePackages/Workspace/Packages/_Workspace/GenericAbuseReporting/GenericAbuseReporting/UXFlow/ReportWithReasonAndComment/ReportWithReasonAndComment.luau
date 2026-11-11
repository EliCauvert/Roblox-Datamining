local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ReactModule = require(GenericAbuseReporting.Parent.React)
local FrameModule = require(GenericAbuseReporting.Common.Frame)
local SimpleSubmitDialogModule = require(GenericAbuseReporting.Dialogs.SimpleSubmitDialog)
local DefaultLocalizationKeysModule = require(GenericAbuseReporting.LocalizationKeys.DefaultLocalizationKeys)
local OnFormLoadedModule = require(GenericAbuseReporting.Analytics.Actions.OnFormLoaded)
local UseAnalyticsSubmitDispatchModule = require(GenericAbuseReporting.Analytics.useAnalyticsSubmitDispatch)
local UseAnalyticsDispatchModule = require(GenericAbuseReporting.Analytics.useAnalyticsDispatch)

return function(p1)
	-- upvalues: UseAnalyticsSubmitDispatchModule (copy), UseAnalyticsDispatchModule (copy), DefaultLocalizationKeysModule (copy), ReactModule (copy), OnFormLoadedModule (copy), FrameModule (copy), SimpleSubmitDialogModule (copy)
	local UseAnalyticsSubmitDispatchModuleResult = UseAnalyticsSubmitDispatchModule()
	local UseAnalyticsDispatchModuleResult = UseAnalyticsDispatchModule()
	local HasPreviousSteps = p1.onCloseProps and p1.onCloseProps.hasPreviousSteps
	
	if p1.localizationKeys then
		p1.localizationKeys.formTitle = p1.localizationKeys.formTitle or DefaultLocalizationKeysModule.formTitle
		p1.localizationKeys.formSubmit = p1.localizationKeys.formSubmit or DefaultLocalizationKeysModule.formSubmit
	end
	ReactModule.useEffect(function()
		-- upvalues: UseAnalyticsDispatchModuleResult (copy), OnFormLoadedModule (upval), p1 (copy)
		UseAnalyticsDispatchModuleResult(OnFormLoadedModule({
			context = p1.analyticsContext,
			place_id = game.PlaceId,
			accumulated_time_ms = workspace:GetServerTimeNow() * 1000
		}))
	end, { UseAnalyticsDispatchModuleResult, p1.analyticsContext })
	
	return ReactModule.createElement(FrameModule, { Size = UDim2.fromScale(1, 1) }, {
		submitDialog = ReactModule.createElement(SimpleSubmitDialogModule, {
			topCustomComponent = p1.topCustomComponent,
			footerContent = p1.footerContent,
			localizationKeys = p1.localizationKeys,
			reportCategories = p1.reportCategories,
			reportCategoryDefaultKey = p1.reportCategoryDefaultKey,
			onSubmit = ReactModule.useCallback(function(p2, p3)
				-- upvalues: p1 (copy), UseAnalyticsSubmitDispatchModuleResult (copy)
				if (if p1.onSubmitProps.hasNextSteps then p1.onSubmitProps.onProceedToNextStep(p2, p3) else p1.onSubmitProps.onSubmit(p2, p3)) and not p1.onSubmitProps.hasNextSteps then
					UseAnalyticsSubmitDispatchModuleResult("Submit")
				end
			end, { UseAnalyticsSubmitDispatchModuleResult, p1.onSubmitProps }),
			onAbandon = ReactModule.useCallback(function()
				-- upvalues: p1 (copy), UseAnalyticsSubmitDispatchModuleResult (copy)
				if not p1.onCloseProps then
					UseAnalyticsSubmitDispatchModuleResult("Abandon")
					
					return
				end
				if p1.onCloseProps.hasPreviousSteps then
					p1.onCloseProps.onBackToPreviousStep()
					
					return
				else
					p1.onCloseProps.onAbandon()
					UseAnalyticsSubmitDispatchModuleResult("Abandon")
				end
			end, { UseAnalyticsSubmitDispatchModuleResult, p1.onCloseProps }),
			isDisabled = p1.isDisabled,
			isReportCategoryReadonly = p1.isReportCategoryReadonly,
			useBackButton = HasPreviousSteps,
			scaleDialog = p1.scaleDialog
		})
	})
end