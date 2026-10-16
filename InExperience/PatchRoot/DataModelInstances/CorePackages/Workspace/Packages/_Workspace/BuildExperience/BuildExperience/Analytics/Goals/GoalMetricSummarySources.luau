local BuildExperience = script:FindFirstAncestor("BuildExperience")
local DeriveMetricSummaryModule = require(BuildExperience.Analytics.deriveMetricSummary)
local _ = require(BuildExperience.Analytics.Goals.GoalTypes)
local MetricGranularity = require(BuildExperience.Parent.DataHydration.ExperienceAnalytics).MetricGranularity

return {
	summary = function(p1) --[[ Line: 33 ]]
		-- upvalues: DeriveMetricSummaryModule (copy)
		return {
			query = {
				lookbackWindows = 2,
				metric = p1.metric,
				endOffsetDays = p1.endOffsetDays,
				filters = p1.filters
			},
			derive = function(p2, p3) --[[ Line: 41 ]]
				-- upvalues: DeriveMetricSummaryModule (upval)
				local DeriveMetricSummaryModuleResult = DeriveMetricSummaryModule(p2, p3)
				
				return if DeriveMetricSummaryModuleResult.hasData and DeriveMetricSummaryModuleResult.latest ~= nil then {
					kind = "number",
					value = DeriveMetricSummaryModuleResult.latest,
					trendPct = DeriveMetricSummaryModuleResult.trendPct,
					priorValue = DeriveMetricSummaryModuleResult.priorValue
				} else nil
			end
		}
	end,
	topBreakdown = function(p1) --[[ Line: 60 ]]
		-- upvalues: MetricGranularity (copy)
		local Dimension = p1.dimension
		
		return {
			query = {
				lookbackWindows = 1,
				metric = p1.metric,
				granularity = MetricGranularity.None,
				filters = p1.filters,
				breakdowns = { { dimensions = { Dimension } } }
			},
			derive = function(p2, _) --[[ Line: 71 ]]
				-- upvalues: Dimension (copy), p1 (copy)
				local Breakdown = nil
				local v1 = -1e999
				local NewValue = nil
				
				for _, value in p2.values or {} do
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
					metric = p1.metric,
					breakdown = Breakdown
				}
			end
		}
	end
}