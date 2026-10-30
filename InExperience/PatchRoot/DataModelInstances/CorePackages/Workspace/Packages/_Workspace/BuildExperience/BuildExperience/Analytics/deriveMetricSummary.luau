local BuildExperience = script:FindFirstAncestor("BuildExperience")
local MetricGranularity = require(BuildExperience.Parent.DataHydration.CreatorAnalytics).MetricGranularity
local FillMetricSeriesGapsModule = require(BuildExperience.Analytics.fillMetricSeriesGaps)
local config = {
	hasData = false,
	latest = nil,
	trendPct = 0,
	priorValue = nil
}

local function deriveSimpleSummary(Tbl)
	local Copy = table.clone(Tbl)
	table.sort(Copy, function(A, B): boolean
		return A.time < B.time
	end)
	local Value = Copy[1].value
	local Value1 = Copy[#Copy].value
	
	return {
		hasData = true,
		priorValue = nil,
		latest = Value1,
		trendPct = if Value == nil or Value == 0 then 0 else (Value1 - Value) / Value
	}
end

local function _(p1, p2, p3): number
	local v1 = p3 - p2 + 1
	
	if v1 < 1 then
		return 0
	end
	local NewValue = 0
	
	for i = p2, p3 do
		NewValue += p1[i].value
	end
	return NewValue / v1
end

return function(p4, p5)
	-- upvalues: config (copy), MetricGranularity (copy), deriveSimpleSummary (copy), FillMetricSeriesGapsModule (copy)
	local DataPoints = if p4 == nil then nil else p4.dataPoints
	
	if DataPoints == nil or #DataPoints == 0 then
		return config
	end
	if p5 == nil or p4 ~= nil and p4.granularity ~= MetricGranularity.OneDay then
		return (deriveSimpleSummary(DataPoints))
	end
	local FillMetricSeriesGapsModuleResult = FillMetricSeriesGapsModule(p4, {
		lookbackSeconds = p5.lookbackSeconds * 2,
		endUnix = p5.endUnix
	})
	local DataPoints1 = if FillMetricSeriesGapsModuleResult == nil then DataPoints else FillMetricSeriesGapsModuleResult.dataPoints
	local CountDataPoints1 = #DataPoints1
	local Floored = math.floor(CountDataPoints1 / 2)
	
	if Floored < 1 then
		return (deriveSimpleSummary(DataPoints))
	end
	local NewFloored = Floored - 1 + 1
	local PriorValue = nil
	
	if NewFloored < 1 then
		PriorValue = 0
	else
		local NewValue = 0
		
		for i = 1, Floored do
			NewValue += DataPoints1[i].value
		end
		PriorValue = NewValue / NewFloored
	end
	local NewCountDataPoints = CountDataPoints1 - Floored + 1
	local NewCountDataPoints1 = CountDataPoints1 - NewCountDataPoints + 1
	local Latest = nil
	
	if NewCountDataPoints1 < 1 then
		Latest = 0
	else
		local NewValue = 0
		
		for i1 = NewCountDataPoints, CountDataPoints1 do
			NewValue += DataPoints1[i1].value
		end
		Latest = NewValue / NewCountDataPoints1
	end
	return {
		hasData = true,
		latest = Latest,
		trendPct = if PriorValue == 0 then 0 else (Latest - PriorValue) / PriorValue,
		priorValue = PriorValue
	}
end