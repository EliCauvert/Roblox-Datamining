local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local submitAnalyticsModule = require(script.Parent.submitAnalytics)
local analyticsSubmitContextModule = require(script.Parent.AnalyticsSubmitContext)
local analyticsStateContextModule = require(script.Parent.AnalyticsStateContext)
local analyticsDispatchContextModule = require(script.Parent.AnalyticsDispatchContext)
local analyticsReducerModule = require(script.Parent.AnalyticsReducer)

return function(p0)
	-- upvalues: reactModule (ref), analyticsReducerModule (ref), submitAnalyticsModule (ref), analyticsSubmitContextModule (ref), analyticsStateContextModule (ref), analyticsDispatchContextModule (ref)
	local var6, var7 = reactModule.useReducer(analyticsReducerModule.reducer, analyticsReducerModule.initialState)
	
	return reactModule.createElement(analyticsSubmitContextModule.Provider, {
		value = reactModule.useCallback(function(p1)
			-- upvalues: p0 (ref), var6 (ref), submitAnalyticsModule (copy)
			local var8 = if p0.onBeforeSubmitAnalytics then p0.onBeforeSubmitAnalytics(var6) else var6
			
			if var8 then
				if p0.onSubmitAnalytics then
					p0.onSubmitAnalytics(var8, p1)
					
					return
				end
				submitAnalyticsModule(var8, p1)
			end
		end, { var6, p0.onBeforeSubmitAnalytics, p0.onSubmitAnalytics })
	}, {
		stateProvider = reactModule.createElement(analyticsStateContextModule.Provider, { value = var6 }, {
			dispatchProvider = reactModule.createElement(analyticsDispatchContextModule.Provider, { value = var7 }, p0.children)
		})
	})
end