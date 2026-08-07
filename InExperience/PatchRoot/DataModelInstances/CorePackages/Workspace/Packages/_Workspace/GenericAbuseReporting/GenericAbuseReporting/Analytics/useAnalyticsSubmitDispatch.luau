local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local analyticsSubmitContextModule = require(script.Parent.AnalyticsSubmitContext)

return function() --[[ line: 6 | named "useAnalyticsDispatch" ]]
	-- upvalues: reactModule (ref), analyticsSubmitContextModule (ref)
	return reactModule.useContext(analyticsSubmitContextModule)
end