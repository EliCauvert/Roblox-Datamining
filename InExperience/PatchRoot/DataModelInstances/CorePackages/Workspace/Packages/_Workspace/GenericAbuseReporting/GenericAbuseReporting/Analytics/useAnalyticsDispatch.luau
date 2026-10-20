local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local AnalyticsDispatchContextModule = require(script.Parent.AnalyticsDispatchContext)

return function()
	-- upvalues: ReactModule (copy), AnalyticsDispatchContextModule (copy)
	return (ReactModule.useContext(AnalyticsDispatchContextModule))
end