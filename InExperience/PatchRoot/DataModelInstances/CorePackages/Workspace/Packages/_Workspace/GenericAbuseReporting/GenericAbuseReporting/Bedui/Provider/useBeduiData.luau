local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ReactModule = require(GenericAbuseReporting.Parent.React)
local AbuseReportBeduiContextModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiContext)

return function()
	-- upvalues: ReactModule (copy), AbuseReportBeduiContextModule (copy)
	return ReactModule.useContext(AbuseReportBeduiContextModule)
end