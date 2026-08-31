local buildExperience = script:FindFirstAncestor("BuildExperience")
local metricGranularity = require(buildExperience.Parent.DataHydration.ExperienceAnalytics).MetricGranularity
local fillMetricSeriesGapsModule = require(buildExperience.Analytics.fillMetricSeriesGaps)
local t = {
	hasData = false,
	latest = nil,
	trendPct = 0,
	priorValue = nil
}

local function deriveSimpleSummary(p1)
	local cloned = table.clone(p1)
	table.sort(cloned, function(p2, p3)
		return p2.time < p3.time
	end)
	local value = cloned[1].value
	local value_1 = cloned[#cloned].value
	
	return {
		hasData = true,
		priorValue = nil,
		latest = value_1,
		trendPct = if not (value == nil or value == 0) then (value_1 - value) / value else 0
	}
end

local function _(p1, p2, p3)
	local var1 = p3 - p2 + 1
	
	if var1 < 1 then
		return 0
	end
	local var2 = 0
	
	for i = p2, p3 do
		var2 += p1[i].value
	end
	return var2 / var1
end

return function(p4, p5)
	-- upvalues: t (ref), metricGranularity (ref), deriveSimpleSummary (ref), fillMetricSeriesGapsModule (ref)
	local var3 = if p4 ~= nil then nil else p4.dataPoints
	
	if var3 == nil or #var3 == 0 then
		return t
	elseif p5 == nil or p4 ~= nil and p4.granularity ~= metricGranularity.OneDay then
		return deriveSimpleSummary(var3)
	end
	local var4 = fillMetricSeriesGapsModule(p4, {
		lookbackSeconds = p5.lookbackSeconds * 2,
		endUnix = p5.endUnix
	})
	local var5 = if var4 ~= nil then var3 else var4.dataPoints
	local var9Count = #var5
	local floored = math.floor(var9Count / 2)
	
	if floored < 1 then
		return deriveSimpleSummary(var3)
	end
	local var6
	local var7 = floored - 1 + 1
	
	if var7 < 1 then
		var6 = 0
	else
		local var8 = 0
		
		for i = 1, floored do
			var8 += var5[i].value
		end
		var6 = var8 / var7
	end
	local var9
	local var10 = var9Count - floored + 1
	local var11 = var9Count - var10 + 1
	
	if var11 < 1 then
		var9 = 0
	else
		local var12 = 0
		
		for i_1 = var10, var9Count do
			var12 += var5[i_1].value
		end
		var9 = var12 / var11
	end
	return {
		hasData = true,
		latest = var9,
		trendPct = if var6 ~= 0 then (var9 - var6) / var6 else 0,
		priorValue = var6
	}
end