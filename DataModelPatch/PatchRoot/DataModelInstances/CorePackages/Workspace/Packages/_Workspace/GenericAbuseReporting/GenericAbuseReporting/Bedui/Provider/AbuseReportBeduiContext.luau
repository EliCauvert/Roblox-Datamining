local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")

return require(GenericAbuseReporting.Parent.React).createContext({
	beduiData = nil,
	error = nil,
	status = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).AbuseReportBeduiContextStatus.Loading
})