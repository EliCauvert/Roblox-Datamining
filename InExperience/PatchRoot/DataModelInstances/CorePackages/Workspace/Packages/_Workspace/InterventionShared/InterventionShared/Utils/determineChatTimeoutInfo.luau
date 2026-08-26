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
		descriptionActiveFormatFunction = function(p1)
			return tostring(math.ceil(p1 / 86400))
		end
	},
	{
		threshold = 3600,
		headingPlural = "Feature.InExperienceIntervention.Heading.ChatSuspension.MultiHour",
		headingSingle = "Feature.InExperienceIntervention.Heading.ChatSuspension.1Hour",
		descriptionActive = "Feature.InExperienceIntervention.Description.ChatSuspension.Hours",
		descriptionExpired = "Feature.InExperienceIntervention.Description.ChatSuspension.Hour.Expired",
		unitInSeconds = 3600,
		descriptionActiveFormatFunction = function(p1)
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
		descriptionActiveFormatFunction = function(p1)
			-- upvalues: localizationService (ref)
			return DateTime.fromUnixTimestamp(p1):FormatUniversalTime("mm:ss", localizationService.RobloxLocaleId)
		end
	}
}

local var2 = function(p1, p2)
	-- upvalues: var1 (ref), list (ref)
	if p2 then
		return var1:Format("Feature.InExperienceIntervention.Heading.ChatSuspension.Expired")
	end
	local var3 = ""
	
	for i, v in list do
		if p1 ~= v.unitInSeconds then
			if v.threshold < p1 then
				var3 = var1:Format(v.headingPlural, { number = math.ceil(p1 / v.unitInSeconds) })
				
				return var3
			end
		end
		var3 = var1:Format(v.headingSingle)
		
		return var3
	end
	return var3
end

return function(p3, p4)
	-- upvalues: var2 (ref), list (ref), var1 (ref)
	if p3 == nil or p4 == nil then
		return 0, "", ""
	end
	local maxValue = math.max(p3.UnixTimestamp - DateTime.now().UnixTimestamp, 0)
	local var4 = p4 / 1000000000
	local var5 = maxValue <= 0
	local var6 = ""
	local var7 = var2(var4, var5)
	
	for i, v in list do
		if var5 then
			if v.threshold <= var4 then
				var6 = var1:Format(v.descriptionExpired, { number = math.ceil(var4 / v.unitInSeconds) })
				break
			end
		elseif v.threshold <= maxValue then
			var6 = var1:Format(v.descriptionActive, { number = v.descriptionActiveFormatFunction(maxValue) })
			break
		end
	end
	return maxValue, var7, var6
end