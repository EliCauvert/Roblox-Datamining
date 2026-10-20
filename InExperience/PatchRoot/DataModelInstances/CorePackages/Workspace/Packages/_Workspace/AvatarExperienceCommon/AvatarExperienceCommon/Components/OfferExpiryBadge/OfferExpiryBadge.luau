local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local BuilderIconsModule = require(Parent.BuilderIcons)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRemainingTimeTextModule = require(AvatarExperienceCommon.Hooks.useRemainingTimeText)
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local BadgeShape = FoundationModule.Enums.BadgeShape
local IconVariant = FoundationModule.Enums.IconVariant
local IconPosition = FoundationModule.Enums.IconPosition

return function(p1)
	-- upvalues: UseRemainingTimeTextModule (copy), UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), BuilderIconsModule (copy), IconVariant (copy), IconPosition (copy), BadgeVariant (copy), BadgeShape (copy)
	local UseRemainingTimeTextModuleResult = UseRemainingTimeTextModule(p1.expirationTimeInUTC)
	local UseLocalizationResult = UseLocalizationFunction({
		endTime = {
			"Feature.InExperienceShop.Label.EndTime",
			timeRemaining = UseRemainingTimeTextModuleResult or ""
		}
	})
	
	return if UseRemainingTimeTextModuleResult == nil then nil else ReactModule.createElement(FoundationModule.Badge, {
		LayoutOrder = p1.layoutOrder,
		icon = {
			name = BuilderIconsModule.Icon.Clock,
			variant = IconVariant.Filled,
			position = IconPosition.Left
		},
		text = UseLocalizationResult.endTime,
		variant = BadgeVariant.Standard,
		shape = BadgeShape.Box
	})
end