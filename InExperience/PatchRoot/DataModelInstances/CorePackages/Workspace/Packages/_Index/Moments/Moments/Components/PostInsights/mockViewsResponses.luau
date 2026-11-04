local CreatorAnalyticsModule = require(script:FindFirstAncestor("Moments").Parent.DataHydration.CreatorAnalytics)
local _ = require(script.Parent.metricSeriesToChartPoints)
local MockViewsDailyQuarterResponseModule = require(script.Parent.mockViewsDailyQuarterResponse)
local MockViewsDailyWeekResponseModule = require(script.Parent.mockViewsDailyWeekResponse)
local MockViewsHourlyResponseModule = require(script.Parent.mockViewsHourlyResponse)

local function _(p1)
	return DateTime.fromIsoDate(p1).UnixTimestamp
end

local Tbl = {
	{
		series = MockViewsHourlyResponseModule,
		window = {
			bucketSeconds = 3600,
			granularity = CreatorAnalyticsModule.MetricGranularity.OneHour,
			startUnix = DateTime.fromIsoDate("2026-10-19T00:00:00Z").UnixTimestamp,
			endUnix = DateTime.fromIsoDate("2026-10-20T00:00:00Z").UnixTimestamp
		}
	},
	{
		series = MockViewsDailyWeekResponseModule,
		window = {
			bucketSeconds = 86400,
			granularity = CreatorAnalyticsModule.MetricGranularity.OneDay,
			startUnix = DateTime.fromIsoDate("2026-10-13T00:00:00Z").UnixTimestamp,
			endUnix = DateTime.fromIsoDate("2026-10-20T00:00:00Z").UnixTimestamp
		}
	},
	{
		series = MockViewsDailyQuarterResponseModule,
		window = {
			bucketSeconds = 86400,
			granularity = CreatorAnalyticsModule.MetricGranularity.OneDay,
			startUnix = DateTime.fromIsoDate("2026-07-21T00:00:00Z").UnixTimestamp,
			endUnix = DateTime.fromIsoDate("2026-10-20T00:00:00Z").UnixTimestamp
		}
	}
}

return table.freeze({
	hourly = MockViewsHourlyResponseModule,
	dailyWeek = MockViewsDailyWeekResponseModule,
	dailyQuarter = MockViewsDailyQuarterResponseModule,
	all = table.freeze({
		MockViewsHourlyResponseModule,
		MockViewsDailyWeekResponseModule,
		MockViewsDailyQuarterResponseModule
	}),
	views = table.freeze(Tbl),
	pickForMoment = function(Text: string)
		-- upvalues: Tbl (copy)
		local NewByteValue = 0
		
		for i = 1, #Text do
			NewByteValue += string.byte(Text, i)
		end
		return Tbl[NewByteValue % #Tbl + 1]
	end
})