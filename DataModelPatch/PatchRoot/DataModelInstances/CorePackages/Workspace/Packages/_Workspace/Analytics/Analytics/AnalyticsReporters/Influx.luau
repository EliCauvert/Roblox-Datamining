local InfluxModule = {}
InfluxModule.__index = InfluxModule

function InfluxModule.new(_reporter)
	-- upvalues: InfluxModule (copy)
	local ValueType = type(_reporter)
	assert(ValueType == "table" or ValueType == "userdata", "Unexpected value for reportingService")
	local config = { _isEnabled = true, _reporter = _reporter }
	setmetatable(config, InfluxModule)
	
	return config
end

function InfluxModule:setEnabled(_isEnabled)
	assert(type(_isEnabled) == "boolean", "Expected isEnabled to be a boolean")
	self._isEnabled = _isEnabled
end

function InfluxModule:reportSeries(SeriesName, p1, ThrottlingPercentage: number)
	local P5 = p1 or {}
	assert(type(SeriesName) == "string", "Expected seriesName to be a string")
	assert(type(P5) == "table", "Expected additionalArgs to be a table")
	assert(type(ThrottlingPercentage) == "number", "Expected throttlingPercent to be a number")
	assert(ThrottlingPercentage >= 0 and ThrottlingPercentage <= 10000, "throttlingPercent must be between 0 - 10,000")
	assert(self._isEnabled, "This reporting service is disabled")
	self._reporter:ReportInfluxSeries(SeriesName, P5, ThrottlingPercentage)
end

return InfluxModule