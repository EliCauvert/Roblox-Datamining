local CorePackages = game:GetService("CorePackages")
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local Parent = script.Parent

return require(CorePackages.Packages.Rodux).combineReducers({
	Character = require(Parent.Character),
	TryOn = require(Parent.TryOn),
	AvatarRoute = AvatarExperienceRoduxModule.Reducers.AvatarRoute,
	OutfitTryOn = require(Parent.OutfitTryOn),
	Looks = require(Parent.Looks),
	LastSavedTriedOnOutfit = require(Parent.LastSavedTriedOnOutfit),
	HeadRefinement = require(CorePackages.Workspace.Packages.AvatarExperienceHeadRefinement).Reducers.HeadRefinementReducer,
	ProfileConfiguration = AvatarExperienceRoduxModule.Reducers.ProfileConfiguration
})