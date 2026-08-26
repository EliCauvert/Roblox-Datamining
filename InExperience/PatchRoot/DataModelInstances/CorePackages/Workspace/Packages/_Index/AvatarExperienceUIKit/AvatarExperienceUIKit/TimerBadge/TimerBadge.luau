local avatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local parent = avatarExperienceUIKit.Parent
local reactModule = require(parent.React)
local badge = require(parent.Foundation).Badge
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRemainingTimeModule = require(avatarExperienceUIKit.Utils.useRemainingTime)

local function _(p1, p2)
	local unit = p1.unit
	local var1 = p1.value ~= 1
	
	return if unit == "days" then if var1 then p2.dayPlural else p2.daySingular elseif unit == "hours" then if var1 then p2.hourPlural else p2.hourSingular elseif unit == "minutes" then if var1 then p2.minutePlural else p2.minuteSingular elseif var1 then p2.secondPlural else p2.secondSingular
end

return function(p1)
	-- upvalues: useRemainingTimeModule (ref), useLocalization (ref), reactModule (ref), badge (ref)
	local var1 = useRemainingTimeModule(p1.endTime)
	local var2 = if var1 then var1.value else 0
	local var3 = useLocalization({
		daySingular = "Feature.Catalog.Label.Timer.Day.Singular",
		hourSingular = "Feature.Catalog.Label.Timer.Hour.Singular",
		minuteSingular = "Feature.Catalog.Label.Timer.Minute.Singular",
		secondSingular = "Feature.Catalog.Label.Timer.Second.Singular",
		dayPlural = { "Feature.Catalog.Label.Timer.Day.Plural", number = var2 },
		hourPlural = { "Feature.Catalog.Label.Timer.Hour.Plural", number = var2 },
		minutePlural = {
			"Feature.Catalog.Label.Timer.Minute.Plural",
			number = var2
		},
		secondPlural = {
			"Feature.Catalog.Label.Timer.Second.Plural",
			number = var2
		}
	})
	
	if var1 and var1.value >= 0 then
		local createElement = reactModule.createElement
		local t = { LayoutOrder = p1.LayoutOrder }
		local unit = var1.unit
		local var4 = var1.value ~= 1
		t.text = if unit == "days" then if var4 then var3.dayPlural else var3.daySingular elseif unit == "hours" then if var4 then var3.hourPlural else var3.hourSingular elseif unit == "minutes" then if var4 then var3.minutePlural else var3.minuteSingular elseif var4 then var3.secondPlural else var3.secondSingular
		t.variant = p1.badgeVariant
		
		return createElement(badge, t)
	end
	return nil
end