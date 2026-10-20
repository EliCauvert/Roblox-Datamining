local ReportToDiagByCountryCodeModule = require(script.Parent.ReportToDiagByCountryCode)
local RequestTimeDiagModule = {}
RequestTimeDiagModule.__index = RequestTimeDiagModule

function RequestTimeDiagModule.new(p1, MetricName)
	assert(MetricName, "metricName is required")
	
	return (setmetatable({ metricName = MetricName, startTime = tick() }, p1))
end

function RequestTimeDiagModule:report()
	-- upvalues: ReportToDiagByCountryCodeModule (copy)
	ReportToDiagByCountryCodeModule(self.metricName, "RoundTripTime", tick() - self.startTime, 100)
end

return RequestTimeDiagModule