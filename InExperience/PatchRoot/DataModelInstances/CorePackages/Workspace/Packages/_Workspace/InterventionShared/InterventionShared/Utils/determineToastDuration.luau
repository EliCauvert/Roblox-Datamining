local NewResult = require(script:FindFirstAncestor("InterventionShared").Parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
local list = {
	{
		threshold = 1380,
		unit = 1440,
		headingPlural = "Feature.InExperienceIntervention.Description.CannotSendDays",
		headingSingle = "Feature.InExperienceIntervention.Description.CannotSend1Day"
	},
	{
		threshold = 59,
		unit = 60,
		headingPlural = "Feature.InExperienceIntervention.Description.CannotSendHours",
		headingSingle = "Feature.InExperienceIntervention.Description.CannotSend1Hour"
	},
	{
		threshold = 1,
		unit = 1,
		headingPlural = "Feature.InExperienceIntervention.Description.CannotSend",
		headingSingle = "Feature.InExperienceIntervention.Description.CannotSend1Min"
	}
}

return function(p1) --[[ Line: 39 ]]
	-- upvalues: list (copy), NewResult (copy)
	local FormatResult = ""
	
	for _, value in list do
		if value.threshold <= p1 then
			local Ceiled = math.ceil(p1 / value.unit)
			
			if Ceiled == 1 then
				return (NewResult:Format(value.headingSingle))
			else
				FormatResult = NewResult:Format(value.headingPlural, { number = Ceiled })
				
				return FormatResult
			end
		end
	end
	return FormatResult
end