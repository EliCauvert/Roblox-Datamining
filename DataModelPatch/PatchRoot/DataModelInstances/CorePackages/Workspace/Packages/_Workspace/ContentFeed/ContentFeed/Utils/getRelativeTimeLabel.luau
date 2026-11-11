local RobloxLocaleId = game:GetService("LocalizationService").RobloxLocaleId
local NewResult = require(script.Parent.Parent.Parent.RobloxAppLocales).Localization.new(RobloxLocaleId)

return function(p1, p2)
	-- upvalues: NewResult (copy), RobloxLocaleId (copy)
	local v1 = p2 - p1
	
	return if v1 < 60000 then NewResult:Format("Feature.ContentFeed.Timestamp.Now") elseif v1 < 3600000 then NewResult:Format("Feature.ContentFeed.Timestamp.MinutesAgo", { numMinutes = math.floor(v1 / 60000) }) elseif v1 < 86400000 then NewResult:Format("Feature.ContentFeed.Timestamp.HoursAgo", { numHours = math.floor(v1 / 3600000) }) elseif v1 < 604800000 then NewResult:Format("Feature.ContentFeed.Timestamp.DaysAgo", { numDays = math.floor(v1 / 86400000) }) elseif v1 < 2419200000 then NewResult:Format("Feature.ContentFeed.Timestamp.WeeksAgo", { numWeeks = math.floor(v1 / 604800000) }) else `{DateTime.fromUnixTimestampMillis(p1):FormatLocalTime("L", RobloxLocaleId)}`
end