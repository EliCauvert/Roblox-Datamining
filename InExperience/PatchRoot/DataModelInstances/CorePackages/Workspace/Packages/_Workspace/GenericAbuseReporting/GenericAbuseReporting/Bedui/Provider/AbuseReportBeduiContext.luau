local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")

return require(genericAbuseReporting.Parent.React).createContext({
	beduiData = nil,
	error = nil,
	status = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes).AbuseReportBeduiContextStatus.Loading
})