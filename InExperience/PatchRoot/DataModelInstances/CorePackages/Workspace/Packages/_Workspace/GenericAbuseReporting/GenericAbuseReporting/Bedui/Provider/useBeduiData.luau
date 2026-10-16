local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ReactModule = require(GenericAbuseReporting.Parent.React)
local AbuseReportBeduiContextModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiContext)

return function() --[[ Line: 7 | Named "useBeduiData" ]]
	-- upvalues: ReactModule (copy), AbuseReportBeduiContextModule (copy)
	return ReactModule.useContext(AbuseReportBeduiContextModule)
end