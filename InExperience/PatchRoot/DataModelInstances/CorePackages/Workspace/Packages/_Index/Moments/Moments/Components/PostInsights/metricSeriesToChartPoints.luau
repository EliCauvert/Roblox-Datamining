local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.AnalyticsMetricChart)
local _ = require(Parent.DataHydration.CreatorAnalytics)

local function _(p1): string
	return (os.date("!%Y-%m-%dT%H:%M:%SZ", p1))
end

return function(p1, p2)
	local NewValues = {}
	
	if p1 ~= nil then
		for _, dataPoint in p1.dataPoints do
			local _DateTime = DateTime.fromIsoDate(dataPoint.time)
			
			if _DateTime ~= nil and type(dataPoint.value) == "number" then
				local ScaledFloored1 = math.floor(_DateTime.UnixTimestamp / p2.bucketSeconds) * p2.bucketSeconds
				NewValues[ScaledFloored1] = (NewValues[ScaledFloored1] or 0) + dataPoint.value
			end
		end
	end
	local Points = {}
	local Total = 0
	local HasData = false
	local ScaledFloored = math.floor(p2.startUnix / p2.bucketSeconds) * p2.bucketSeconds
	while ScaledFloored < p2.endUnix do
		local NewValue = NewValues[ScaledFloored]
		
		if NewValue == nil then
			NewValue = 0
		else
			HasData = true
		end
		Total += NewValue
		table.insert(Points, {
			time = os.date("!%Y-%m-%dT%H:%M:%SZ", ScaledFloored),
			value = NewValue
		})
		ScaledFloored += p2.bucketSeconds
	end
	return { points = Points, total = Total, hasData = HasData }
end