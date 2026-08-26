local reportToDiagByCountryCodeModule = require(script.Parent.ReportToDiagByCountryCode)
local t = {}
t.__index = t

function t.new(p1, p2)
	assert(p2, "metricName is required")
	
	return setmetatable({ metricName = p2, startTime = tick() }, p1)
end

function t:report()
	-- upvalues: reportToDiagByCountryCodeModule (ref)
	reportToDiagByCountryCodeModule(self.metricName, "RoundTripTime", tick() - self.startTime, 100)
end

return t