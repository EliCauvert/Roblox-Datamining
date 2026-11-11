local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local _ = require(Modules.AvatarExperience.AvatarEditor.Reducers.Character)
local _ = require(Modules.AvatarExperience.Common.Types)
local FFlagAXOutfitPageRevamp = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXOutfitPageRevamp

local function v7(OwnedItemIdsBySubtypeEntry, Character, OutfitInfos)
	-- upvalues: UtilsModule (copy)
	return UtilsModule.getIdOfOutfitBeingWorn(OwnedItemIdsBySubtypeEntry, OutfitInfos, Character)
end

return function(p1, p2)
	-- upvalues: FFlagAXOutfitPageRevamp (copy), UtilsModule (copy), v7 (copy)
	return if FFlagAXOutfitPageRevamp then v7(p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[UtilsModule.getOutfitSubtypeKey(p2, true)] or {}, p1.AvatarExperience.AvatarEditor.Character, p1.AvatarExperience.AvatarEditor.OutfitInfos) else nil
end