local CorePackages = game:GetService("CorePackages")
local EnumerateModule = require(CorePackages.Packages.enumerate)
local List = {
	"AllowInventoryReadAccess", "SaveAvatar", "CreateOutfit", "EnterOutfitName",
	"SetFavorite", "DeleteOutfit", "RenameOutfit", "UpdateOutfit"
}

if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlowIE then
	table.insert(List, "SaveAvatarTimeout")
end
return EnumerateModule("PromptType", List)