local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local UseRemainingTimeFunction = require(Parent.AvatarExperienceUIKit).Hooks.useRemainingTime
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetRemainingTimeTextModule = require(AvatarExperienceCommon.Utils.getRemainingTimeText)

return function(p1) --[[ Line: 13 | Named "useRemainingTimeText" ]]
	-- upvalues: UseRemainingTimeFunction (copy), UseLocalizationFunction (copy), GetRemainingTimeTextModule (copy)
	local UseRemainingTimeResult = UseRemainingTimeFunction(p1)
	local Value = if UseRemainingTimeResult == nil then 0 else UseRemainingTimeResult.value
	local UseLocalizationResult = UseLocalizationFunction({
		daySingular = "Feature.InExperienceShop.Label.Timer.Day.Singular",
		hourSingular = "Feature.InExperienceShop.Label.Timer.Hour.Singular",
		minuteSingular = "Feature.InExperienceShop.Label.Timer.Minute.Singular",
		secondSingular = "Feature.InExperienceShop.Label.Timer.Second.Singular",
		dayPlural = {
			"Feature.InExperienceShop.Label.Timer.Day.Plural",
			number = Value
		},
		hourPlural = {
			"Feature.InExperienceShop.Label.Timer.Hour.Plural",
			number = Value
		},
		minutePlural = {
			"Feature.InExperienceShop.Label.Timer.Minute.Plural",
			number = Value
		},
		secondPlural = {
			"Feature.InExperienceShop.Label.Timer.Second.Plural",
			number = Value
		}
	})
	
	return if UseRemainingTimeResult == nil or UseRemainingTimeResult.value <= 0 then nil else GetRemainingTimeTextModule(UseRemainingTimeResult, UseLocalizationResult)
end