local reportToDiagByCountryCode = require(script:FindFirstAncestor("AppChat").Parent.Analytics).ReportToDiagByCountryCode
local percentReportingByCountryCode = tonumber(settings():GetFVariable("PercentReportingByCountryCode")) or 0

return function(p0, p1, p2) --[[ line: 8 ]]
	-- upvalues: reportToDiagByCountryCode (ref), percentReportingByCountryCode (ref)
	reportToDiagByCountryCode(p0, p1, p2 * 1000, percentReportingByCountryCode)
end