local localizationService = game:GetService("LocalizationService")
local var1 = require(script:FindFirstAncestor("InterventionShared").Parent.RobloxAppLocales).Localization.new(localizationService.RobloxLocaleId)
local list = {
	{
		threshold = 86400,
		headingPlural = "Feature.InExperienceIntervention.Heading.ChatSuspension.Plural",
		headingSingle = "Feature.InExperienceIntervention.Heading.ChatSuspension.1Day",
		descriptionActive = "Feature.InExperienceIntervention.Description.ChatSuspension.Days",
		descriptionExpired = "Feature.InExperienceIntervention.Description.ChatSuspension.Day.Expired",
		unitInSeconds = 86400,
		descriptionActiveFormatFunction = function(p0) --[[ line: 20 ]]
			return tostring(math.ceil(p0 / 86400))
		end
	},
	{
		threshold = 3600,
		headingPlural = "Feature.InExperienceIntervention.Heading.ChatSuspension.MultiHour",
		headingSingle = "Feature.InExperienceIntervention.Heading.ChatSuspension.1Hour",
		descriptionActive = "Feature.InExperienceIntervention.Description.ChatSuspension.Hours",
		descriptionExpired = "Feature.InExperienceIntervention.Description.ChatSuspension.Hour.Expired",
		unitInSeconds = 3600,
		descriptionActiveFormatFunction = function(p1) --[[ line: 31 ]]
			-- upvalues: localizationService (ref)
			return DateTime.fromUnixTimestamp(p1):FormatUniversalTime("HH:mm", localizationService.RobloxLocaleId)
		end
	},
	{
		threshold = 1,
		headingPlural = "Feature.InExperienceIntervention.Heading.ChatSuspension.MultiMinute",
		headingSingle = "Feature.InExperienceIntervention.Heading.ChatSuspension.1Minute",
		descriptionActive = "Feature.InExperienceIntervention.Description.ChatSuspension.Minutes",
		descriptionExpired = "Feature.InExperienceIntervention.Description.ChatSuspension.Minute.Expired",
		unitInSeconds = 60,
		descriptionActiveFormatFunction = function(p2) --[[ line: 45 ]]
			-- upvalues: localizationService (ref)
			return DateTime.fromUnixTimestamp(p2):FormatUniversalTime("mm:ss", localizationService.RobloxLocaleId)
		end
	}
}

local var3 = function(p3, p4) --[[ line: 58 ]]
	-- upvalues: var1 (ref), list (ref)
	if p4 then
		return var1:Format("Feature.InExperienceIntervention.Heading.ChatSuspension.Expired")
	end
	local var4 = ""
	
	for i, v in list do
		if p3 ~= v.unitInSeconds then
			if v.threshold < p3 then
				var4 = var1:Format(v.headingPlural, { number = math.ceil(p3 / v.unitInSeconds) })
				
				return var4
			end
		end
		var4 = var1:Format(v.headingSingle)
		
		return var4
	end
	return var4
end

return function(p5, p6) --[[ line: 83 ]]
	-- upvalues: var3 (ref), list (ref), var1 (ref)
	if p5 == nil or p6 == nil then
		return 0, "", ""
	end
	local maxValue = math.max(p5.UnixTimestamp - DateTime.now().UnixTimestamp, 0)
	local var6 = p6 / 1000000000
	local var7 = maxValue <= 0
	local var8 = ""
	local var9 = var3(var6, var7)
	
	for i, v in list do
		if var7 then
			if v.threshold <= var6 then
				var8 = var1:Format(v.descriptionExpired, { number = math.ceil(var6 / v.unitInSeconds) })
				break
			end
		elseif v.threshold <= maxValue then
			var8 = var1:Format(v.descriptionActive, { number = v.descriptionActiveFormatFunction(maxValue) })
			break
		end
	end
	return maxValue, var9, var8
end