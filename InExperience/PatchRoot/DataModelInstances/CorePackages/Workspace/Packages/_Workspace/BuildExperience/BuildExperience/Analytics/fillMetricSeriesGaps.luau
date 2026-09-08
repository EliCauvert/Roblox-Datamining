local metricGranularity = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.ExperienceAnalytics).MetricGranularity

local function _(p1)
	return DateTime.fromUnixTimestamp(p1):ToIsoDate()
end

return function(p1, p2)
	-- upvalues: metricGranularity (ref)
	if p1 == nil or p2 == nil or p1.granularity ~= metricGranularity.OneDay then
		return p1
	end
	local var1 = p2.endUnix - p2.endUnix % 86400
	local var2 = var1 - p2.lookbackSeconds + 86400
	
	if var1 < var2 or (var1 - var2) / 86400 + 1 > 2000 then
		return p1
	end
	local t = {}
	
	for i, v in p1.dataPoints do
		local dateTime = DateTime.fromIsoDate(v.time)
		
		if dateTime ~= nil then
			t[dateTime.UnixTimestamp - dateTime.UnixTimestamp % 86400] = v
		end
	end
	local t_1 = {}
	local var3 = var2
	while var3 <= var1 do
		local var4 = t[var3]
		table.insert(t_1, if var4 ~= nil then {
			value = 0,
			time = DateTime.fromUnixTimestamp(var3):ToIsoDate()
		} else var4)
		var3 += 86400
	end
	return { dataPoints = t_1, granularity = p1.granularity }
end