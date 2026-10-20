local AvatarExperienceUIKit = script:FindFirstAncestor("AvatarExperienceUIKit")
local Parent = AvatarExperienceUIKit.Parent
local ReactModule = require(Parent.React)
local Badge = require(Parent.Foundation).Badge
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRemainingTimeModule = require(AvatarExperienceUIKit.Utils.useRemainingTime)

local function _(p1, p2)
	local Unit = p1.unit
	local IsNotValueMatch = p1.value ~= 1
	
	return if Unit == "days" then if IsNotValueMatch then p2.dayPlural else p2.daySingular elseif Unit == "hours" then if IsNotValueMatch then p2.hourPlural else p2.hourSingular elseif Unit == "minutes" then if IsNotValueMatch then p2.minutePlural else p2.minuteSingular elseif IsNotValueMatch then p2.secondPlural else p2.secondSingular
end

return function(Frame)
	-- upvalues: UseRemainingTimeModule (copy), UseLocalizationFunction (copy), ReactModule (copy), Badge (copy)
	local UseRemainingTimeModuleResult = UseRemainingTimeModule(Frame.endTime)
	local Value = if UseRemainingTimeModuleResult then UseRemainingTimeModuleResult.value else 0
	local UseLocalizationResult = UseLocalizationFunction({
		daySingular = "Feature.Catalog.Label.Timer.Day.Singular",
		hourSingular = "Feature.Catalog.Label.Timer.Hour.Singular",
		minuteSingular = "Feature.Catalog.Label.Timer.Minute.Singular",
		secondSingular = "Feature.Catalog.Label.Timer.Second.Singular",
		dayPlural = { "Feature.Catalog.Label.Timer.Day.Plural", number = Value },
		hourPlural = {
			"Feature.Catalog.Label.Timer.Hour.Plural",
			number = Value
		},
		minutePlural = {
			"Feature.Catalog.Label.Timer.Minute.Plural",
			number = Value
		},
		secondPlural = {
			"Feature.Catalog.Label.Timer.Second.Plural",
			number = Value
		}
	})
	
	if UseRemainingTimeModuleResult and UseRemainingTimeModuleResult.value >= 0 then
		local Unit = UseRemainingTimeModuleResult.unit
		local IsNotValueMatch = UseRemainingTimeModuleResult.value ~= 1
		
		return ReactModule.createElement(Badge, {
			LayoutOrder = Frame.LayoutOrder,
			text = if Unit == "days" then if IsNotValueMatch then UseLocalizationResult.dayPlural else UseLocalizationResult.daySingular elseif Unit == "hours" then if IsNotValueMatch then UseLocalizationResult.hourPlural else UseLocalizationResult.hourSingular elseif Unit == "minutes" then if IsNotValueMatch then UseLocalizationResult.minutePlural else UseLocalizationResult.minuteSingular elseif IsNotValueMatch then UseLocalizationResult.secondPlural else UseLocalizationResult.secondSingular,
			variant = Frame.badgeVariant
		})
	else
		return nil
	end
end