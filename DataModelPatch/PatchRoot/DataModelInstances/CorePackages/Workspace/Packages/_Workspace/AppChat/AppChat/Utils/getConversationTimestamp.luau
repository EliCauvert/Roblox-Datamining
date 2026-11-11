local Parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(Parent.Time).DateTime
local NewResult = require(Parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)

return function(p1)
	-- upvalues: NewResult (copy)
	local UnixTimestampDelta = DateTime.now().UnixTimestamp - p1.dateTime.UnixTimestamp
	
	if UnixTimestampDelta < 60 then
		return NewResult:Format("Feature.Chat.Label.TimestampNow")
	elseif UnixTimestampDelta < 3600 then
		local Floored = math.floor(UnixTimestampDelta / 60)
		
		return if Floored == 1 then NewResult:Format("Feature.Chat.Label.TimestampOneMinuteAbbreviated") else NewResult:Format("Feature.Chat.Label.TimestampMinutesAbbreviatedPlural", { num_minutes = Floored })
	elseif UnixTimestampDelta < 86400 then
		local Floored = math.floor(UnixTimestampDelta / 3600)
		
		return if Floored == 1 then NewResult:Format("Feature.Chat.Label.TimestampOneHourAbbreviated") else NewResult:Format("Feature.Chat.Label.TimestampHoursAbbreviatedPlural", { num_hours = Floored })
	elseif UnixTimestampDelta < 604800 then
		local Floored = math.floor(UnixTimestampDelta / 86400)
		
		return if Floored == 1 then NewResult:Format("Feature.Chat.Label.TimestampOneDayAbbreviated") else NewResult:Format("Feature.Chat.Label.TimestampDaysAbbreviatedPlural", { num_days = Floored })
	elseif UnixTimestampDelta < 2592000 then
		local Floored = math.floor(UnixTimestampDelta / 604800)
		
		return if Floored == 1 then NewResult:Format("Feature.Chat.Label.TimestampOneWeekAbbreviated") else NewResult:Format("Feature.Chat.Label.TimestampWeeksAbbreviatedPlural", { num_weeks = Floored })
	else
		return p1:Format("ll")
	end
end