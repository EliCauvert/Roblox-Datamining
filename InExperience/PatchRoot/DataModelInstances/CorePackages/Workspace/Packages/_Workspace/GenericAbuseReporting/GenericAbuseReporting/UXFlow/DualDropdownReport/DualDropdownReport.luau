local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local frameModule = require(genericAbuseReporting.Common.Frame)
local dualDropdownSubmitDialogModule = require(genericAbuseReporting.Dialogs.DualDropdownSubmitDialog)
local defaultLocalizationKeysModule = require(genericAbuseReporting.LocalizationKeys.DefaultLocalizationKeys)
local onFormLoadedModule = require(genericAbuseReporting.Analytics.Actions.OnFormLoaded)
local useAnalyticsSubmitDispatchModule = require(genericAbuseReporting.Analytics.useAnalyticsSubmitDispatch)
local useAnalyticsDispatchModule = require(genericAbuseReporting.Analytics.useAnalyticsDispatch)

return function(p0) --[[ line: 30 | named "DualDropdownReport" ]]
	-- upvalues: useAnalyticsSubmitDispatchModule (ref), useAnalyticsDispatchModule (ref), defaultLocalizationKeysModule (ref), reactModule (ref), onFormLoadedModule (ref), frameModule (ref), dualDropdownSubmitDialogModule (ref)
	local var8 = useAnalyticsSubmitDispatchModule()
	local var9 = useAnalyticsDispatchModule()
	
	if p0.localizationKeys then
		p0.localizationKeys.formTitle = p0.localizationKeys.formTitle or defaultLocalizationKeysModule.formTitle
		p0.localizationKeys.formSubmit = p0.localizationKeys.formSubmit or defaultLocalizationKeysModule.formSubmit
	end
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: var9 (ref), onFormLoadedModule (copy), p0 (ref)
		var9(onFormLoadedModule({
			context = p0.analyticsContext,
			place_id = game.PlaceId,
			accumulated_time_ms = workspace:GetServerTimeNow() * 1000
		}))
	end, { var9, p0.analyticsContext })
	
	return reactModule.createElement(frameModule, { Size = UDim2.new(1, 0, 1, 0) }, {
		DualDropdownReport = reactModule.createElement(dualDropdownSubmitDialogModule, {
			localizationKeys = p0.localizationKeys,
			reportProblems = p0.reportProblems,
			reportSurfaces = p0.reportSurfaces,
			onSubmit = reactModule.useCallback(function(p1, p2, p3) --[[ line: 48 ]]
				-- upvalues: p0 (ref), var8 (ref)
				if (if p0.onSubmitProps.hasNextSteps then p0.onSubmitProps.onProceedToNextStep(p1, p2, p3) else p0.onSubmitProps.onSubmit(p1, p2, p3)) and not p0.onSubmitProps.hasNextSteps then
					var8("Submit")
				end
			end, { var8, p0.onSubmitProps }),
			onAbandon = reactModule.useCallback(function() --[[ line: 58 ]]
				-- upvalues: p0 (ref), var8 (ref)
				if not p0.onCloseProps then
					var8("Abandon")
					
					return
				elseif p0.onCloseProps.hasPreviousSteps then
					p0.onCloseProps.onBackToPreviousStep()
					
					return
				end
				p0.onCloseProps.onAbandon()
				var8("Abandon")
			end, { var8, p0.onCloseProps }),
			footerContent = p0.footerContent
		})
	})
end