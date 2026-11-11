local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)

return require(CorePackages.Packages.Rodux).combineReducers({
	AnalyticsMetadata = AvatarExperienceRoduxModule.Reducers.AnalyticsMetadata,
	AvatarEditor = require(Modules.AvatarExperience.AvatarEditor.Reducers.AvatarEditor),
	Catalog = require(Modules.AvatarExperience.Catalog.Reducers.Catalog),
	ProfilePictureEditor = require(Modules.AvatarExperience.ProfilePictureEditor.Reducers.ProfilePictureEditor),
	Common = require(Modules.AvatarExperience.Common.Reducers.Common),
	AvatarScene = require(Modules.AvatarExperience.Common.Reducers.AvatarScene),
	ExternalNavigationRequest = require(Modules.AvatarExperience.Common.Reducers.ExternalNavigationRequest),
	AvatarAutocompleteSuggestions = require(Modules.AvatarExperience.Catalog.Reducers.AvatarAutocompleteSuggestions),
	AccessoryAdjustment = require(Modules.AvatarExperience.AccessoryAdjustment.Reducers.AccessoryAdjustment),
	LayeredClothingSort = require(Modules.AvatarExperience.LayeredClothingSort.Reducers.LayeredClothingSort),
	CameraButton = AvatarExperienceRoduxModule.Reducers.CameraButton
})