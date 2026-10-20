local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local HeroUnitSpotlightCardViewModule = require(Modules.AvatarExperience.Common.Components.Widgets.HeroUnitSpotlightCardView)
local UseHeroUnitSpotlightCardViewModelModule = require(Modules.AvatarExperience.Common.Components.Widgets.useHeroUnitSpotlightCardViewModel)

return function(p1)
	-- upvalues: UseHeroUnitSpotlightCardViewModelModule (copy), ReactModule (copy), HeroUnitSpotlightCardViewModule (copy)
	return ReactModule.createElement(HeroUnitSpotlightCardViewModule, (UseHeroUnitSpotlightCardViewModelModule(p1)))
end