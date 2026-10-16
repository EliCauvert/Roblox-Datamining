local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local AnalyticsSubmitContextModule = require(script.Parent.AnalyticsSubmitContext)

return function() --[[ Line: 6 | Named "useAnalyticsDispatch" ]]
	-- upvalues: ReactModule (copy), AnalyticsSubmitContextModule (copy)
	return (ReactModule.useContext(AnalyticsSubmitContextModule))
end