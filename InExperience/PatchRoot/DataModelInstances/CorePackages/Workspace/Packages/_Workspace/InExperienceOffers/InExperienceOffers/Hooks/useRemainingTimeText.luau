local inExperienceOffers = script:FindFirstAncestor("InExperienceOffers")
local parent = inExperienceOffers.Parent
local useRemainingTime = require(parent.AvatarExperienceUIKit).Hooks.useRemainingTime
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getRemainingTimeTextModule = require(inExperienceOffers.Utils.getRemainingTimeText)

return function(p1)
	-- upvalues: useRemainingTime (ref), useLocalization (ref), getRemainingTimeTextModule (ref)
	local var1 = useRemainingTime(p1)
	local var2 = if var1 ~= nil then 0 else var1.value
	
	return if var1 == nil or var1.value <= 0 then nil else getRemainingTimeTextModule(var1, useLocalization({
		daySingular = "Feature.InExperienceShop.Label.Timer.Day.Singular",
		hourSingular = "Feature.InExperienceShop.Label.Timer.Hour.Singular",
		minuteSingular = "Feature.InExperienceShop.Label.Timer.Minute.Singular",
		secondSingular = "Feature.InExperienceShop.Label.Timer.Second.Singular",
		dayPlural = {
			"Feature.InExperienceShop.Label.Timer.Day.Plural",
			number = var2
		},
		hourPlural = {
			"Feature.InExperienceShop.Label.Timer.Hour.Plural",
			number = var2
		},
		minutePlural = {
			"Feature.InExperienceShop.Label.Timer.Minute.Plural",
			number = var2
		},
		secondPlural = {
			"Feature.InExperienceShop.Label.Timer.Second.Plural",
			number = var2
		}
	}))
end