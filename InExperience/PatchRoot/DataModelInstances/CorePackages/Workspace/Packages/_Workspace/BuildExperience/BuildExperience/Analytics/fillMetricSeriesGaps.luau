local MetricGranularity = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.ExperienceAnalytics).MetricGranularity

local function _(p1) --[[ Line: 25 | Named "toIsoDay" ]]
	return DateTime.fromUnixTimestamp(p1):ToIsoDate()
end

return function(p1, p2) --[[ Line: 29 | Named "fillMetricSeriesGaps" ]]
	-- upvalues: MetricGranularity (copy)
	if p1 == nil or p2 == nil or p1.granularity ~= MetricGranularity.OneDay then
		return p1
	end
	local EndUnixDelta = p2.endUnix - p2.endUnix % 86400
	local NewEndUnixDelta = EndUnixDelta - p2.lookbackSeconds + 86400
	
	if EndUnixDelta < NewEndUnixDelta or (EndUnixDelta - NewEndUnixDelta) / 86400 + 1 > 2000 then
		return p1
	end
	local t = {}
	
	for _, dataPoint in p1.dataPoints do
		local _DateTime = DateTime.fromIsoDate(dataPoint.time)
		
		if _DateTime ~= nil then
			t[_DateTime.UnixTimestamp - _DateTime.UnixTimestamp % 86400] = dataPoint
		end
	end
	local DataPoints = {}
	local Count: number = NewEndUnixDelta
	while Count <= EndUnixDelta do
		local Entry = t[Count]
		table.insert(DataPoints, if Entry == nil then {
			value = 0,
			time = DateTime.fromUnixTimestamp(Count):ToIsoDate()
		} else Entry)
		Count += 86400
	end
	return { dataPoints = DataPoints, granularity = p1.granularity }
end