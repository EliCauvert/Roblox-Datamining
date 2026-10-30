local BuildExperience = script:FindFirstAncestor("BuildExperience")
local CreatorAnalyticsModule = require(BuildExperience.Parent.DataHydration.CreatorAnalytics)
local DeriveMetricSummaryModule = require(BuildExperience.Analytics.deriveMetricSummary)
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)
local MetricGranularity = CreatorAnalyticsModule.MetricGranularity

local function retentionRatio(p1, DurationSeconds, EndUnixDelta, EndUnix)
	local NewValue: number? = nil
	local NewValue1 = nil
	local Values = p1.values or {}
	for _, value in Values do
		local BreakdownValue = value.breakdownValues[1]
		
		if BreakdownValue ~= nil and BreakdownValue.dimension == "SessionTimeBucket" then
			local Number: number? = tonumber(BreakdownValue.value)
			
			if Number == 0 or Number == DurationSeconds then
				for _, dataPoint in value.dataPoints do
					local _DateTime = DateTime.fromIsoDate(dataPoint.time)
					
					if _DateTime ~= nil and _DateTime.UnixTimestamp > EndUnixDelta and EndUnix >= _DateTime.UnixTimestamp then
						if Number == 0 then
							NewValue = (NewValue or 0) + dataPoint.value
						end
						if Number == DurationSeconds then
							NewValue1 = (NewValue1 or 0) + dataPoint.value
						end
					end
				end
			end
		end
	end
	return if NewValue == nil or NewValue <= 0 or NewValue1 == nil then nil else NewValue1 / NewValue
end

return {
	summary = function(p2)
		-- upvalues: DeriveMetricSummaryModule (copy)
		return {
			query = {
				lookbackWindows = 2,
				metric = p2.metric,
				endOffsetDays = p2.endOffsetDays,
				filters = p2.filters
			},
			derive = function(p3, p4)
				-- upvalues: DeriveMetricSummaryModule (upval)
				local DeriveMetricSummaryModuleResult = DeriveMetricSummaryModule(p3, p4)
				
				return if DeriveMetricSummaryModuleResult.hasData and DeriveMetricSummaryModuleResult.latest ~= nil then {
					kind = "number",
					value = DeriveMetricSummaryModuleResult.latest,
					trendPct = DeriveMetricSummaryModuleResult.trendPct,
					priorValue = DeriveMetricSummaryModuleResult.priorValue
				} else nil
			end
		}
	end,
	topBreakdown = function(p2)
		-- upvalues: MetricGranularity (copy)
		local Dimension = p2.dimension
		
		return {
			query = {
				lookbackWindows = 1,
				metric = p2.metric,
				granularity = MetricGranularity.None,
				filters = p2.filters,
				breakdowns = { { dimensions = { Dimension } } }
			},
			derive = function(p3, _)
				-- upvalues: Dimension (copy), p2 (copy)
				local Breakdown = nil
				local v1 = -1e999
				local NewValue = nil
				
				for _, value in p3.values or {} do
					for _, breakdownValue in value.breakdownValues do
						if breakdownValue.dimension == Dimension then
							NewValue = 0
							
							for _, dataPoint in value.dataPoints do
								NewValue += dataPoint.value
							end
							if v1 > NewValue then break end
							v1 = NewValue
							Breakdown = breakdownValue
							break
						else
							continue
						end
					end
				end
				return if Breakdown == nil then nil else {
					kind = "breakdown",
					metric = p2.metric,
					breakdown = Breakdown
				}
			end
		}
	end,
	firstSessionRetention = function(p4)
		-- upvalues: CreatorAnalyticsModule (copy), MetricGranularity (copy), retentionRatio (copy)
		local DurationSeconds = p4.durationSeconds
		
		return {
			query = {
				lookbackWindows = 2,
				metric = CreatorAnalyticsModule.MetricId.TotalSessionsEndedInBucket,
				granularity = MetricGranularity.OneDay,
				breakdowns = { { dimensions = { "SessionTimeBucket" } } },
				filters = {
					{
						dimension = "SessionTimeBucket",
						operation = "Equals",
						values = { "0", (tostring(DurationSeconds)) }
					}
				}
			},
			derive = function(p5, p6)
				-- upvalues: retentionRatio (upval), DurationSeconds (copy)
				local EndUnixDelta = p6.endUnix - p6.lookbackSeconds
				local RetentionRatioResult: number = retentionRatio(p5, DurationSeconds, EndUnixDelta, p6.endUnix)
				
				if RetentionRatioResult == nil then
					return nil
				else
					local RetentionRatioResult1: number = retentionRatio(p5, DurationSeconds, EndUnixDelta - p6.lookbackSeconds, EndUnixDelta)
					
					return {
						kind = "number",
						value = RetentionRatioResult,
						priorValue = RetentionRatioResult1,
						trendPct = if RetentionRatioResult1 == nil or RetentionRatioResult1 <= 0 then nil else (RetentionRatioResult - RetentionRatioResult1) / RetentionRatioResult1
					}
				end
			end
		}
	end
}