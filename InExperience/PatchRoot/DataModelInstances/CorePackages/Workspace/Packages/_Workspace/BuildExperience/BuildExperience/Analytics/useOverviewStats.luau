local BuildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(BuildExperience.Parent.DataHydration.ExperienceAnalytics)
local AnalyticsMetricModule = require(BuildExperience.Analytics.AnalyticsMetric)
local _ = require(BuildExperience.Analytics.AnalyticsWindow)
local UseExperienceMetricSeriesModule = require(BuildExperience.Analytics.useExperienceMetricSeries)

return function(p1, p2, p3)
	-- upvalues: UseExperienceMetricSeriesModule (copy), AnalyticsMetricModule (copy)
	local function _(p4)
		-- upvalues: p3 (copy)
		return if p3 == nil then nil else p3[p4.id]
	end
	
	local DailyActiveUsers = AnalyticsMetricModule.DailyActiveUsers
	local TotalPlaytime = AnalyticsMetricModule.TotalPlaytime
	local PlaythroughRate = AnalyticsMetricModule.PlaythroughRate
	local D1Retention = AnalyticsMetricModule.D1Retention
	local PayerConversion = AnalyticsMetricModule.PayerConversion
	local Arppu = AnalyticsMetricModule.Arppu
	
	return {
		[AnalyticsMetricModule.DailyActiveUsers.id] = UseExperienceMetricSeriesModule(p1, AnalyticsMetricModule.DailyActiveUsers, p2, if p3 == nil then nil else p3[DailyActiveUsers.id]),
		[AnalyticsMetricModule.TotalPlaytime.id] = UseExperienceMetricSeriesModule(p1, AnalyticsMetricModule.TotalPlaytime, p2, if p3 == nil then nil else p3[TotalPlaytime.id]),
		[AnalyticsMetricModule.PlaythroughRate.id] = UseExperienceMetricSeriesModule(p1, AnalyticsMetricModule.PlaythroughRate, p2, if p3 == nil then nil else p3[PlaythroughRate.id]),
		[AnalyticsMetricModule.D1Retention.id] = UseExperienceMetricSeriesModule(p1, AnalyticsMetricModule.D1Retention, p2, if p3 == nil then nil else p3[D1Retention.id]),
		[AnalyticsMetricModule.PayerConversion.id] = UseExperienceMetricSeriesModule(p1, AnalyticsMetricModule.PayerConversion, p2, if p3 == nil then nil else p3[PayerConversion.id]),
		[AnalyticsMetricModule.Arppu.id] = UseExperienceMetricSeriesModule(p1, AnalyticsMetricModule.Arppu, p2, if p3 == nil then nil else p3[Arppu.id])
	}
end