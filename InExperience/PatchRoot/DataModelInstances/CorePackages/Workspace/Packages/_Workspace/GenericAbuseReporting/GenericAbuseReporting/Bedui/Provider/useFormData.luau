local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ReactModule = require(GenericAbuseReporting.Parent.React)
local AbuseReportFormDataContextModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportFormDataContext)

return function() --[[ Line: 7 | Named "useFormData" ]]
	-- upvalues: ReactModule (copy), AbuseReportFormDataContextModule (copy)
	return ReactModule.useContext(AbuseReportFormDataContextModule)
end