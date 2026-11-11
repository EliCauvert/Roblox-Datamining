local Parent = script.Parent
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)

return require(game:GetService("CorePackages").Packages.Rodux).combineReducers({
	AvatarType = require(Parent.AvatarType),
	AvatarScales = require(Parent.AvatarScales),
	BodyColor3s = require(Parent.BodyColor3s),
	BodyPartRangeIds = require(Parent.BodyPartRangeIds),
	EquippedAssets = require(Parent.EquippedAssets),
	OwnedItemIdsBySubtype = require(Parent.OwnedItemIdsBySubtype),
	OutfitOrAsset = require(Parent.OutfitOrAsset)
})