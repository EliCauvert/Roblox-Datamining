local CorePackages = game:GetService("CorePackages")
local Parent = script.Parent
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UprankedItemsModule = require(Parent.UprankedItems)
local PreventSaveAvatarModule = require(Parent.PreventSaveAvatar)
local GrantedItemsModule = require(Parent.GrantedItems)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local _ = require(Modules.AvatarExperience.Common.Types)
local GetFFlagAXEnableAvatarDataRefreshModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableAvatarDataRefresh)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXPhotoboothIsStandalone = AvatarExperienceFlagsModule.FFlagAXPhotoboothIsStandalone
local FFlagAXPhotoboothBugBashFixes = AvatarExperienceFlagsModule.FFlagAXPhotoboothBugBashFixes

return require(CorePackages.Packages.Rodux).combineReducers({
	Character = require(Parent.Character),
	Categories = require(Parent.Categories),
	EquippedEmotes = require(Parent.EquippedEmotes),
	OutfitInfos = require(Parent.OutfitInfos),
	AvatarSettings = require(Parent.AvatarSettings),
	DefaultBodyColorRanges = require(Parent.DefaultBodyColorRanges),
	PageFinished = require(Parent.PageFinished),
	RecommendedItems = require(Parent.RecommendedItems),
	UprankedItems = if require(Modules.AvatarExperience.Flags.FFlagAXUprankBundles)() then UprankedItemsModule else nil,
	PageLoaded = require(Parent.PageLoaded),
	NewItemNotifications = require(Parent.NewItemNotifications),
	BodyColorPickerSettings = require(Parent.BodyColorPickerSettings),
	HasAvatarData = require(Parent.HasAvatarData),
	UserInventoryRecommendations = require(Parent.UserInventoryRecommendations),
	UserInventoryRecommendationsFetchStatus = require(Parent.UserInventoryRecommendationsFetchStatus),
	GrantedItems = if require(Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList)() or FFlagAXPhotoboothIsStandalone and FFlagAXPhotoboothBugBashFixes then GrantedItemsModule else nil,
	PreventSaveAvatar = if GetFFlagAXEnableAvatarDataRefreshModule() then PreventSaveAvatarModule else nil
})