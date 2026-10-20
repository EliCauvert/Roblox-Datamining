local ReportToDiagByCountryCodeFunction = require(script:FindFirstAncestor("AppChat").Parent.Analytics).ReportToDiagByCountryCode

return function(p1, p2, p3: number)
	-- upvalues: ReportToDiagByCountryCodeFunction (copy)
	ReportToDiagByCountryCodeFunction(p1, p2, p3 * 1000, 100)
end