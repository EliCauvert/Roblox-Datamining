local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local submitAnalyticsModule = require(script.Parent.submitAnalytics)
local analyticsSubmitContextModule = require(script.Parent.AnalyticsSubmitContext)
local analyticsStateContextModule = require(script.Parent.AnalyticsStateContext)
local analyticsDispatchContextModule = require(script.Parent.AnalyticsDispatchContext)
local analyticsReducerModule = require(script.Parent.AnalyticsReducer)

return function(p1)
	-- upvalues: reactModule (ref), analyticsReducerModule (ref), submitAnalyticsModule (ref), analyticsSubmitContextModule (ref), analyticsStateContextModule (ref), analyticsDispatchContextModule (ref)
	local var1, var2 = reactModule.useReducer(analyticsReducerModule.reducer, analyticsReducerModule.initialState)
	
	return reactModule.createElement(analyticsSubmitContextModule.Provider, {
		value = reactModule.useCallback(function(p2)
			-- upvalues: p1 (ref), var1 (ref), submitAnalyticsModule (copy)
			local var3 = if p1.onBeforeSubmitAnalytics then p1.onBeforeSubmitAnalytics(var1) else var1
			
			if var3 then
				if p1.onSubmitAnalytics then
					p1.onSubmitAnalytics(var3, p2)
					
					return
				end
				submitAnalyticsModule(var3, p2)
			end
		end, { var1, p1.onBeforeSubmitAnalytics, p1.onSubmitAnalytics })
	}, {
		stateProvider = reactModule.createElement(analyticsStateContextModule.Provider, { value = var1 }, {
			dispatchProvider = reactModule.createElement(analyticsDispatchContextModule.Provider, { value = var2 }, p1.children)
		})
	})
end