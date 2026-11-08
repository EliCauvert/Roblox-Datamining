local MockViewsDailyQuarterResponseModule = require(script.Parent.mockViewsDailyQuarterResponse)
local MockViewsDailyWeekResponseModule = require(script.Parent.mockViewsDailyWeekResponse)
local MockViewsHourlyResponseModule = require(script.Parent.mockViewsHourlyResponse)

return table.freeze({
	hourly = MockViewsHourlyResponseModule,
	dailyWeek = MockViewsDailyWeekResponseModule,
	dailyQuarter = MockViewsDailyQuarterResponseModule,
	all = table.freeze({
		MockViewsHourlyResponseModule,
		MockViewsDailyWeekResponseModule,
		MockViewsDailyQuarterResponseModule
	})
})