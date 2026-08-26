local var1 = require(script:FindFirstAncestor("InterventionShared").Parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
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

return function(p1)
	-- upvalues: list (ref), var1 (ref)
	local var2 = ""
	
	for i, v in list do
		if v.threshold <= p1 then
			local ceiled = math.ceil(p1 / v.unit)
			
			if ceiled == 1 then
				return var1:Format(v.headingSingle)
			end
			var2 = var1:Format(v.headingPlural, { number = ceiled })
			
			return var2
		end
	end
	return var2
end