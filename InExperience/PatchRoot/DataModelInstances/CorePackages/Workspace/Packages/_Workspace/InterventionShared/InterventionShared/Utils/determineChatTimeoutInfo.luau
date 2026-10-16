local LocalizationService = game:GetService("LocalizationService")
local NewResult = require(script:FindFirstAncestor("InterventionShared").Parent.RobloxAppLocales).Localization.new(LocalizationService.RobloxLocaleId)
local list = {
	{
		threshold = 86400,
		headingPlural = "Feature.InExperienceIntervention.Heading.ChatSuspension.Plural",
		headingSingle = "Feature.InExperienceIntervention.Heading.ChatSuspension.1Day",
		descriptionActive = "Feature.InExperienceIntervention.Description.ChatSuspension.Days",
		descriptionExpired = "Feature.InExperienceIntervention.Description.ChatSuspension.Day.Expired",
		unitInSeconds = 86400,
		descriptionActiveFormatFunction = function(p1: number): string --[[ Line: 20 ]]
			return (tostring((math.ceil(p1 / 86400))))
		end
	},
	{
		threshold = 3600,
		headingPlural = "Feature.InExperienceIntervention.Heading.ChatSuspension.MultiHour",
		headingSingle = "Feature.InExperienceIntervention.Heading.ChatSuspension.1Hour",
		descriptionActive = "Feature.InExperienceIntervention.Description.ChatSuspension.Hours",
		descriptionExpired = "Feature.InExperienceIntervention.Description.ChatSuspension.Hour.Expired",
		unitInSeconds = 3600,
		descriptionActiveFormatFunction = function(p1) --[[ Line: 31 ]]
			-- upvalues: LocalizationService (copy)
			return DateTime.fromUnixTimestamp(p1):FormatUniversalTime("HH:mm", LocalizationService.RobloxLocaleId)
		end
	},
	{
		threshold = 1,
		headingPlural = "Feature.InExperienceIntervention.Heading.ChatSuspension.MultiMinute",
		headingSingle = "Feature.InExperienceIntervention.Heading.ChatSuspension.1Minute",
		descriptionActive = "Feature.InExperienceIntervention.Description.ChatSuspension.Minutes",
		descriptionExpired = "Feature.InExperienceIntervention.Description.ChatSuspension.Minute.Expired",
		unitInSeconds = 60,
		descriptionActiveFormatFunction = function(p1) --[[ Line: 45 ]]
			-- upvalues: LocalizationService (copy)
			return DateTime.fromUnixTimestamp(p1):FormatUniversalTime("mm:ss", LocalizationService.RobloxLocaleId)
		end
	}
}

local function v3(UnitInSeconds, p1) --[[ Line: 58 ]]
	-- upvalues: NewResult (copy), list (copy)
	if p1 then
		return NewResult:Format("Feature.InExperienceIntervention.Heading.ChatSuspension.Expired")
	end
	local FormatResult = ""
	
	for _, value in list do
		if UnitInSeconds == value.unitInSeconds then
			FormatResult = NewResult:Format(value.headingSingle)
			
			return FormatResult
		elseif value.threshold < UnitInSeconds then
			FormatResult = NewResult:Format(value.headingPlural, { number = math.ceil(UnitInSeconds / value.unitInSeconds) })
			
			return FormatResult
		end
	end
	return FormatResult
end

return function(p2, p3: number) --[[ Line: 83 ]]
	-- upvalues: v3 (copy), list (copy), NewResult (copy)
	if p2 == nil or p3 == nil then
		return 0, "", ""
	end
	local Largest = math.max(p2.UnixTimestamp - DateTime.now().UnixTimestamp, 0)
	local v1 = p3 / 1000000000
	local IsLargestBelow = Largest <= 0
	local FormatResult = ""
	local v2 = v3(v1, IsLargestBelow)
	
	for _, value in list do
		if IsLargestBelow then
			if value.threshold <= v1 then
				FormatResult = NewResult:Format(value.descriptionExpired, { number = math.ceil(v1 / value.unitInSeconds) })
				break
			end
		elseif value.threshold <= Largest then
			FormatResult = NewResult:Format(value.descriptionActive, { number = value.descriptionActiveFormatFunction(Largest) })
			break
		end
	end
	return Largest, v2, FormatResult
end