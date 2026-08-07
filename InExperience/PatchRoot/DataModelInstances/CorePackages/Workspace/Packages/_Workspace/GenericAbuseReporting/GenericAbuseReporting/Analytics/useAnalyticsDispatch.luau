local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local analyticsDispatchContextModule = require(script.Parent.AnalyticsDispatchContext)

return function() --[[ line: 6 | named "useAnalyticsDispatch" ]]
	-- upvalues: reactModule (ref), analyticsDispatchContextModule (ref)
	return reactModule.useContext(analyticsDispatchContextModule)
end