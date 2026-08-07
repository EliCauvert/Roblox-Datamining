local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local abuseReportFormDataContextModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportFormDataContext)

return function() --[[ line: 7 | named "useFormData" ]]
	-- upvalues: reactModule (ref), abuseReportFormDataContextModule (ref)
	return reactModule.useContext(abuseReportFormDataContextModule)
end