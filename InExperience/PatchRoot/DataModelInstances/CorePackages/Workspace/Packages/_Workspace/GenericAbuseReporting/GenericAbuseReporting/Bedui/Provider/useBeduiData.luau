local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local abuseReportBeduiContextModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiContext)

return function()
	-- upvalues: reactModule (ref), abuseReportBeduiContextModule (ref)
	return reactModule.useContext(abuseReportBeduiContextModule)
end