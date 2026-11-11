local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(Modules.AvatarExperience.Common.Types)

return require(CorePackages.Packages.Rodux).combineReducers({
	AssetInfos = require(Modules.AvatarExperience.Common.Reducers.AssetInfos),
	BundleInfos = require(Modules.AvatarExperience.Common.Reducers.BundleInfos),
	Collectibles = require(Modules.AvatarExperience.Common.Reducers.Collectibles),
	ItemDetailsExpanded = require(Modules.AvatarExperience.Common.Reducers.ItemDetailsExpanded),
	ItemDetailsPeekView = AvatarExperienceRoduxModule.Reducers.ItemDetailsPeekView,
	AvatarExperienceLoaded = AvatarExperienceRoduxModule.Reducers.AvatarExperienceLoaded,
	PlayEmoteInBackground = require(Modules.AvatarExperience.Common.Reducers.PlayEmoteInBackground),
	FullView = require(Modules.AvatarExperience.Common.Reducers.FullView),
	Widgets = require(Modules.AvatarExperience.Common.Reducers.Widgets)
})