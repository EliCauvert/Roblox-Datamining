local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")

return require(genericAbuseReporting.Parent.React).createContext({
	isReportSubmitted = false,
	abuseVector = require(genericAbuseReporting.Enums.AbuseVector).Invalid,
	setIsReportSubmitted = function(_) --[[ line: 11 ]] end
})