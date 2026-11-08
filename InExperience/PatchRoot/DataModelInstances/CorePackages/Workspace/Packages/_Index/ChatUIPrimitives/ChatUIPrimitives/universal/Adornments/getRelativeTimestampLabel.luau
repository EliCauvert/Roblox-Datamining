local list = {
	{
		limitMs = 3600000,
		unitMs = 60000,
		oneKey = "TimestampOneMinuteAbbreviated",
		pluralKey = "TimestampMinutesAbbreviatedPlural",
		argName = "num_minutes"
	},
	{
		limitMs = 86400000,
		unitMs = 3600000,
		oneKey = "TimestampOneHourAbbreviated",
		pluralKey = "TimestampHoursAbbreviatedPlural",
		argName = "num_hours"
	},
	{
		limitMs = 604800000,
		unitMs = 86400000,
		oneKey = "TimestampOneDayAbbreviated",
		pluralKey = "TimestampDaysAbbreviatedPlural",
		argName = "num_days"
	},
	{
		limitMs = 2592000000,
		unitMs = 604800000,
		oneKey = "TimestampOneWeekAbbreviated",
		pluralKey = "TimestampWeeksAbbreviatedPlural",
		argName = "num_weeks"
	}
}

return function(p1, p2, Callback, Callback1)
	-- upvalues: list (copy)
	local Largest = math.max(p2 - p1, 0)
	
	if Largest < 60000 then
		return Callback("Feature.Chat.Label.TimestampNow")
	end
	for _, value in list do
		if Largest < value.limitMs then
			local LargestRatio = Largest // value.unitMs
			
			return if LargestRatio == 1 then Callback("Feature.Chat.Label." .. value.oneKey) else Callback("Feature.Chat.Label." .. value.pluralKey, { [value.argName] = LargestRatio })
		end
	end
	return Callback1(p1, p2)
end