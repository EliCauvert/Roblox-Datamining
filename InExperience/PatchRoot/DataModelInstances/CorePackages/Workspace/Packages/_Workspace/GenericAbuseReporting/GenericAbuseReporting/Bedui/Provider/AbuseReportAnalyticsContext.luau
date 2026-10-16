local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")

return require(GenericAbuseReporting.Parent.React).createContext({
	isReportSubmitted = false,
	abuseVector = require(GenericAbuseReporting.Enums.AbuseVector).Invalid,
	setIsReportSubmitted = function(_) --[[ Line: 11 ]] end
})