local buildExperience = script:FindFirstAncestor("BuildExperience")
local experienceAnalyticsModule = require(buildExperience.Parent.DataHydration.ExperienceAnalytics)
local deriveMetricSummaryModule = require(buildExperience.Analytics.deriveMetricSummary)
local _ = require(buildExperience.Analytics.Goals.GoalTypes)
local metricGranularity = experienceAnalyticsModule.MetricGranularity

return {
	summary = function(p1)
		-- upvalues: deriveMetricSummaryModule (ref)
		return {
			query = {
				lookbackWindows = 2,
				metric = p1.metric,
				filters = p1.filters
			},
			derive = function(p2, p3)
				-- upvalues: deriveMetricSummaryModule (copy)
				local var1 = deriveMetricSummaryModule(p2, p3)
				
				return if var1.hasData and var1.latest ~= nil then {
					kind = "number",
					value = var1.latest,
					trendPct = var1.trendPct,
					priorValue = var1.priorValue
				} else nil
			end
		}
	end,
	topBreakdown = function(p1)
		-- upvalues: metricGranularity (ref)
		local dimension = p1.dimension
		
		return {
			query = {
				lookbackWindows = 1,
				metric = p1.metric,
				granularity = metricGranularity.None,
				filters = p1.filters,
				breakdowns = { { dimensions = { dimension } } }
			},
			derive = function(p2, _)
				-- upvalues: dimension (ref), p1 (ref)
				local var1
				local values = p2.values or {}
				local var2 = nil
				local var3 = -1e999
				
				for i, v in values do
					for i_1, v_1 in v.breakdownValues do
						if v_1.dimension == dimension then
							var1 = 0
							
							for i_2, v_2 in v.dataPoints do
								var1 += v_2.value
							end
							if var3 > var1 then break end
							var3 = var1
							var2 = v_1
							break
						end
					end
				end
				return if var2 == nil then nil else { kind = "breakdown", metric = p1.metric, breakdown = var2 }
			end
		}
	end
}