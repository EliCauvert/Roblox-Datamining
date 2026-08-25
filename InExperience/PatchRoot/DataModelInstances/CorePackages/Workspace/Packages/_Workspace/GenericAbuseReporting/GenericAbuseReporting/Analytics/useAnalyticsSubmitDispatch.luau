local reactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local analyticsSubmitContextModule = require(script.Parent.AnalyticsSubmitContext)

return function()
	-- upvalues: reactModule (ref), analyticsSubmitContextModule (ref)
	return reactModule.useContext(analyticsSubmitContextModule)
end