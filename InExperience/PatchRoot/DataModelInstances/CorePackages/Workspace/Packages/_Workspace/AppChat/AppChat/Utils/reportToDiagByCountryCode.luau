local reportToDiagByCountryCode = require(script:FindFirstAncestor("AppChat").Parent.Analytics).ReportToDiagByCountryCode

return function(p0, p1, p2) --[[ line: 6 ]]
	-- upvalues: reportToDiagByCountryCode (ref)
	reportToDiagByCountryCode(p0, p1, p2 * 1000, 100)
end