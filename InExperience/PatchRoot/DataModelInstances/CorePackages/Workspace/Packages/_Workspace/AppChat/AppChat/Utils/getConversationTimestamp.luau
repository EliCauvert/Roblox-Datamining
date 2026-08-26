local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("AppChat").Parent
local _ = require(parent.Time).DateTime
local var1 = require(parent.RobloxAppLocales).Localization.new(localizationService.RobloxLocaleId)

return function(p1)
	-- upvalues: var1 (ref)
	local var2 = DateTime.now().UnixTimestamp - p1.dateTime.UnixTimestamp
	
	if var2 < 60 then
		return var1:Format("Feature.Chat.Label.TimestampNow")
	elseif var2 < 3600 then
		local floored = math.floor(var2 / 60)
		
		return if floored == 1 then var1:Format("Feature.Chat.Label.TimestampOneMinuteAbbreviated") else var1:Format("Feature.Chat.Label.TimestampMinutesAbbreviatedPlural", { num_minutes = floored })
	elseif var2 < 86400 then
		local floored = math.floor(var2 / 3600)
		
		return if floored == 1 then var1:Format("Feature.Chat.Label.TimestampOneHourAbbreviated") else var1:Format("Feature.Chat.Label.TimestampHoursAbbreviatedPlural", { num_hours = floored })
	elseif var2 < 604800 then
		local floored = math.floor(var2 / 86400)
		
		return if floored == 1 then var1:Format("Feature.Chat.Label.TimestampOneDayAbbreviated") else var1:Format("Feature.Chat.Label.TimestampDaysAbbreviatedPlural", { num_days = floored })
	elseif var2 >= 2592000 then
		return p1:Format("ll")
	end
	local floored = math.floor(var2 / 604800)
	
	return if floored == 1 then var1:Format("Feature.Chat.Label.TimestampOneWeekAbbreviated") else var1:Format("Feature.Chat.Label.TimestampWeeksAbbreviatedPlural", { num_weeks = floored })
end