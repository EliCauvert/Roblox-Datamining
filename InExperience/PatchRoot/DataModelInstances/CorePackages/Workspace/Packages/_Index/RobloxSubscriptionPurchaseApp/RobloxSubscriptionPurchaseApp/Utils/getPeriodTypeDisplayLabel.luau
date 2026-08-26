local t = {
	month = {
		singular = "Feature.RobloxSubscription.Label.month",
		plural = "Feature.RobloxSubscription.Label.months"
	},
	year = {
		singular = "Feature.RobloxSubscription.Label.year",
		plural = "Feature.RobloxSubscription.Label.years"
	},
	week = {
		singular = "Feature.RobloxSubscription.Label.week",
		plural = "Feature.RobloxSubscription.Label.weeks"
	}
}
local t_1 = {
	singular = "Feature.RobloxSubscription.Label.month",
	plural = "Feature.RobloxSubscription.Label.months"
}

return function(p1, p2)
	-- upvalues: t (ref), t_1 (ref)
	local var1 = t[string.lower(p1)] or t_1
	
	return if p2 then var1.plural else var1.singular
end