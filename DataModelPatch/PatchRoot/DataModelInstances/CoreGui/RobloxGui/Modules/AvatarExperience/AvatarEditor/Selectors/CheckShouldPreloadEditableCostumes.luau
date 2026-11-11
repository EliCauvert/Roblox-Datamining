local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)

return function(p1): boolean
	-- upvalues: PerformFetch (copy), ConstantsModule1 (copy), ConstantsModule (copy), RetrievalStatus (copy)
	if PerformFetch.GetStatus(p1, ConstantsModule1.OutfitsKey .. ConstantsModule.EditableCharacterKey) == RetrievalStatus.Fetching then
		return false
	end
	local PageFinishedEntry = p1.AvatarExperience.AvatarEditor.PageFinished[ConstantsModule.EditableCharacterKey]
	
	if p1.AvatarExperience.AvatarEditor.PageFinished[ConstantsModule.CharacterKey] then
		return false
	elseif PageFinishedEntry then
		return false
	else
		local OwnedItemIdsBySubtypeEntry = p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[ConstantsModule.EditableCharacterKey]
		
		return not OwnedItemIdsBySubtypeEntry or ConstantsModule.MaxPreloadEditableCharacters >= #OwnedItemIdsBySubtypeEntry
	end
end