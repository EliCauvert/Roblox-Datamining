local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local SubmitAnalyticsModule = require(script.Parent.submitAnalytics)
local AnalyticsSubmitContextModule = require(script.Parent.AnalyticsSubmitContext)
local AnalyticsStateContextModule = require(script.Parent.AnalyticsStateContext)
local AnalyticsDispatchContextModule = require(script.Parent.AnalyticsDispatchContext)
local AnalyticsReducerModule = require(script.Parent.AnalyticsReducer)

return function(p1)
	-- upvalues: ReactModule (copy), AnalyticsReducerModule (copy), SubmitAnalyticsModule (copy), AnalyticsSubmitContextModule (copy), AnalyticsStateContextModule (copy), AnalyticsDispatchContextModule (copy)
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(AnalyticsReducerModule.reducer, AnalyticsReducerModule.initialState)
	
	return ReactModule.createElement(AnalyticsSubmitContextModule.Provider, {
		value = ReactModule.useCallback(function(p2)
			-- upvalues: p1 (copy), UseReducerResult (copy), SubmitAnalyticsModule (upval)
			local OnBeforeSubmitAnalyticsResult = if p1.onBeforeSubmitAnalytics then p1.onBeforeSubmitAnalytics(UseReducerResult) else UseReducerResult
			
			if OnBeforeSubmitAnalyticsResult then
				if p1.onSubmitAnalytics then
					p1.onSubmitAnalytics(OnBeforeSubmitAnalyticsResult, p2)
					
					return
				end
				SubmitAnalyticsModule(OnBeforeSubmitAnalyticsResult, p2)
			end
		end, {
			UseReducerResult,
			p1.onBeforeSubmitAnalytics,
			p1.onSubmitAnalytics
		})
	}, {
		stateProvider = ReactModule.createElement(AnalyticsStateContextModule.Provider, { value = UseReducerResult }, {
			dispatchProvider = ReactModule.createElement(AnalyticsDispatchContextModule.Provider, { value = UseReducerResult2 }, p1.children)
		})
	})
end