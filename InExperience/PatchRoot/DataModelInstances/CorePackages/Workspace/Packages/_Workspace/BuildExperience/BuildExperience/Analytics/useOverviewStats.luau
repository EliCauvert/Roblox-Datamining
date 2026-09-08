local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Parent.DataHydration.ExperienceAnalytics)
local analyticsMetricModule = require(buildExperience.Analytics.AnalyticsMetric)
local _ = require(buildExperience.Analytics.AnalyticsWindow)
local useExperienceMetricSeriesModule = require(buildExperience.Analytics.useExperienceMetricSeries)

return function(p1, p2, p3)
	-- upvalues: useExperienceMetricSeriesModule (ref), analyticsMetricModule (ref)
	local function _(p4)
		-- upvalues: p3 (ref)
		return if p3 == nil then nil else p3[p4.id]
	end
	
	return {
		[analyticsMetricModule.DailyActiveUsers.id] = useExperienceMetricSeriesModule(p1, analyticsMetricModule.DailyActiveUsers, p2, if p3 ~= nil then nil else p3[analyticsMetricModule.DailyActiveUsers.id]),
		[analyticsMetricModule.TotalPlaytime.id] = useExperienceMetricSeriesModule(p1, analyticsMetricModule.TotalPlaytime, p2, if p3 ~= nil then nil else p3[analyticsMetricModule.TotalPlaytime.id]),
		[analyticsMetricModule.PlaythroughRate.id] = useExperienceMetricSeriesModule(p1, analyticsMetricModule.PlaythroughRate, p2, if p3 ~= nil then nil else p3[analyticsMetricModule.PlaythroughRate.id]),
		[analyticsMetricModule.D1Retention.id] = useExperienceMetricSeriesModule(p1, analyticsMetricModule.D1Retention, p2, if p3 ~= nil then nil else p3[analyticsMetricModule.D1Retention.id]),
		[analyticsMetricModule.PayerConversion.id] = useExperienceMetricSeriesModule(p1, analyticsMetricModule.PayerConversion, p2, if p3 ~= nil then nil else p3[analyticsMetricModule.PayerConversion.id]),
		[analyticsMetricModule.Arppu.id] = useExperienceMetricSeriesModule(p1, analyticsMetricModule.Arppu, p2, if p3 ~= nil then nil else p3[analyticsMetricModule.Arppu.id])
	}
end