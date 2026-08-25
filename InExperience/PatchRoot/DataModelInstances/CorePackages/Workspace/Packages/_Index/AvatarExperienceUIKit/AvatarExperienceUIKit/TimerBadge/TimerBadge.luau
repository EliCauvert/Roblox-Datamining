local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local badge = require(parent.Foundation).Badge
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRemainingTimeModule = require(avatarExperienceUIKit.Utils.useRemainingTime)

local function _(p0, p1)
	local unit = p0.unit
	local var3 = p0.value ~= 1
	
	return if unit == "days" then if var3 then p1.dayPlural else p1.daySingular elseif unit == "hours" then if var3 then p1.hourPlural else p1.hourSingular elseif unit == "minutes" then if var3 then p1.minutePlural else p1.minuteSingular elseif var3 then p1.secondPlural else p1.secondSingular
end

return function(p2)
	-- upvalues: useRemainingTimeModule (ref), useLocalization (ref), reactModule (ref), badge (ref)
	local var4 = useRemainingTimeModule(p2.endTime)
	local var5 = if var4 then var4.value else 0
	local var6 = useLocalization({
		daySingular = "Feature.Catalog.Label.Timer.Day.Singular",
		hourSingular = "Feature.Catalog.Label.Timer.Hour.Singular",
		minuteSingular = "Feature.Catalog.Label.Timer.Minute.Singular",
		secondSingular = "Feature.Catalog.Label.Timer.Second.Singular",
		dayPlural = { "Feature.Catalog.Label.Timer.Day.Plural", number = var5 },
		hourPlural = { "Feature.Catalog.Label.Timer.Hour.Plural", number = var5 },
		minutePlural = {
			"Feature.Catalog.Label.Timer.Minute.Plural",
			number = var5
		},
		secondPlural = {
			"Feature.Catalog.Label.Timer.Second.Plural",
			number = var5
		}
	})
	
	if var4 and var4.value >= 0 then
		local createElement = reactModule.createElement
		local t = { LayoutOrder = p2.LayoutOrder }
		local unit = var4.unit
		local var8 = var4.value ~= 1
		t.text = if unit == "days" then if var8 then var6.dayPlural else var6.daySingular elseif unit == "hours" then if var8 then var6.hourPlural else var6.hourSingular elseif unit == "minutes" then if var8 then var6.minutePlural else var6.minuteSingular elseif var8 then var6.secondPlural else var6.secondSingular
		t.variant = p2.badgeVariant
		
		return createElement(badge, t)
	end
	return nil
end