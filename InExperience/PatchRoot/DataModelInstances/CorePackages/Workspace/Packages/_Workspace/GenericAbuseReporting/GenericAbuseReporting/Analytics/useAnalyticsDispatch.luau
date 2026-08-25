local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local analyticsDispatchContextModule = require(script.Parent.AnalyticsDispatchContext)

return function()
	-- upvalues: reactModule (ref), analyticsDispatchContextModule (ref)
	return reactModule.useContext(analyticsDispatchContextModule)
end