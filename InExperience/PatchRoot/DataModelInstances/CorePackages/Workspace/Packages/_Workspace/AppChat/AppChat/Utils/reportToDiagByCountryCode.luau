local reportToDiagByCountryCode = require(script:FindFirstAncestor("AppChat").Parent.Analytics).ReportToDiagByCountryCode

return function(p1, p2, p3)
	-- upvalues: reportToDiagByCountryCode (ref)
	reportToDiagByCountryCode(p1, p2, p3 * 1000, 100)
end