local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local frameModule = require(genericAbuseReporting.Common.Frame)
local dualDropdownSubmitDialogModule = require(genericAbuseReporting.Dialogs.DualDropdownSubmitDialog)
local defaultLocalizationKeysModule = require(genericAbuseReporting.LocalizationKeys.DefaultLocalizationKeys)
local onFormLoadedModule = require(genericAbuseReporting.Analytics.Actions.OnFormLoaded)
local useAnalyticsSubmitDispatchModule = require(genericAbuseReporting.Analytics.useAnalyticsSubmitDispatch)
local useAnalyticsDispatchModule = require(genericAbuseReporting.Analytics.useAnalyticsDispatch)

return function(p1)
	-- upvalues: useAnalyticsSubmitDispatchModule (ref), useAnalyticsDispatchModule (ref), defaultLocalizationKeysModule (ref), reactModule (ref), onFormLoadedModule (ref), frameModule (ref), dualDropdownSubmitDialogModule (ref)
	local var1 = useAnalyticsSubmitDispatchModule()
	local var2 = useAnalyticsDispatchModule()
	
	if p1.localizationKeys then
		p1.localizationKeys.formTitle = p1.localizationKeys.formTitle or defaultLocalizationKeysModule.formTitle
		p1.localizationKeys.formSubmit = p1.localizationKeys.formSubmit or defaultLocalizationKeysModule.formSubmit
	end
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), onFormLoadedModule (copy), p1 (ref)
		var2(onFormLoadedModule({
			context = p1.analyticsContext,
			place_id = game.PlaceId,
			accumulated_time_ms = workspace:GetServerTimeNow() * 1000
		}))
	end, { var2, p1.analyticsContext })
	
	return reactModule.createElement(frameModule, { Size = UDim2.new(1, 0, 1, 0) }, {
		DualDropdownReport = reactModule.createElement(dualDropdownSubmitDialogModule, {
			localizationKeys = p1.localizationKeys,
			reportProblems = p1.reportProblems,
			reportSurfaces = p1.reportSurfaces,
			onSubmit = reactModule.useCallback(function(p2, p3, p4)
				-- upvalues: p1 (ref), var1 (ref)
				if (if p1.onSubmitProps.hasNextSteps then p1.onSubmitProps.onProceedToNextStep(p2, p3, p4) else p1.onSubmitProps.onSubmit(p2, p3, p4)) and not p1.onSubmitProps.hasNextSteps then
					var1("Submit")
				end
			end, { var1, p1.onSubmitProps }),
			onAbandon = reactModule.useCallback(function()
				-- upvalues: p1 (ref), var1 (ref)
				if not p1.onCloseProps then
					var1("Abandon")
					
					return
				elseif p1.onCloseProps.hasPreviousSteps then
					p1.onCloseProps.onBackToPreviousStep()
					
					return
				end
				p1.onCloseProps.onAbandon()
				var1("Abandon")
			end, { var1, p1.onCloseProps }),
			footerContent = p1.footerContent
		})
	})
end