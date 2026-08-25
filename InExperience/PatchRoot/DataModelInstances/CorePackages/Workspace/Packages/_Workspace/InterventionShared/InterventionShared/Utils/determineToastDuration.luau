local var0 = require(script:FindFirstAncestor("InterventionShared").Parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)
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

return function(p0)
	-- upvalues: list (ref), var0 (ref)
	local var2 = ""
	
	for i, v in list do
		if v.threshold <= p0 then
			local ceiled = math.ceil(p0 / v.unit)
			
			if ceiled == 1 then
				return var0:Format(v.headingSingle)
			end
			var2 = var0:Format(v.headingPlural, { number = ceiled })
			
			return var2
		end
	end
	return var2
end