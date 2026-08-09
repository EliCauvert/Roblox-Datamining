local corePackagesService = game:GetService("CorePackages")
local enumerateModule = require(corePackagesService.Packages.enumerate)
local list = {
	"AllowInventoryReadAccess", "SaveAvatar", "CreateOutfit", "EnterOutfitName",
	"SetFavorite", "DeleteOutfit", "RenameOutfit", "UpdateOutfit"
}

if require(corePackagesService.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE then
	table.insert(list, "SaveAvatarTimeout")
end
return enumerateModule("PromptType", list)