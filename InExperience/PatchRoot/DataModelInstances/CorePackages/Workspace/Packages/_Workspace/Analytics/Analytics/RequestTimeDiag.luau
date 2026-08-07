local reportToDiagByCountryCodeModule = require(script.Parent.ReportToDiagByCountryCode)
local t = {}
t.__index = t

function t.new(p0, p1) --[[ line: 6 ]]
	assert(p1, "metricName is required")
	
	return setmetatable({ metricName = p1, startTime = tick() }, p0)
end

function t:report() --[[ line: 14 ]]
	-- upvalues: reportToDiagByCountryCodeModule (ref)
	reportToDiagByCountryCodeModule(self.metricName, "RoundTripTime", tick() - self.startTime, 100)
end

return t