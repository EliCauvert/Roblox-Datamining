local ReportToDiagByCountryCodeFunction = require(script:FindFirstAncestor("AppChat").Parent.Analytics).ReportToDiagByCountryCode
local Number: number = tonumber(settings():GetFVariable("PercentReportingByCountryCode")) or 0

return function(p1, p2, p3: number)
	-- upvalues: ReportToDiagByCountryCodeFunction (copy), Number (copy)
	ReportToDiagByCountryCodeFunction(p1, p2, p3 * 1000, Number)
end