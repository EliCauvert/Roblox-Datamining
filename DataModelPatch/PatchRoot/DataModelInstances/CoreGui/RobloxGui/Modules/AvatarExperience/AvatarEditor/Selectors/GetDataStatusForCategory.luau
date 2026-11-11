local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local UtilsModule1 = require(Modules.AvatarExperience.Common.Utils)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)

return function(p1)
	-- upvalues: UtilsModule1 (copy), UtilsModule (copy), RetrievalStatusModule (copy), PerformFetch (copy), ConstantsModule (copy)
	local IsRenderOutfitItemTiles = UtilsModule1.getAvatarEditorCategoryInfoFromState(p1).RenderOutfitItemTiles == true
	local SelectAssetTypeKeyResult = UtilsModule.selectAssetTypeKey(p1)
	local Failed = RetrievalStatusModule.Failed
	
	if SelectAssetTypeKeyResult then
		if IsRenderOutfitItemTiles then
			return (PerformFetch.GetStatus(p1, ConstantsModule.OutfitsKey .. SelectAssetTypeKeyResult))
		end
		Failed = PerformFetch.GetStatus(p1, ConstantsModule.UserInventoryKey .. SelectAssetTypeKeyResult)
	end
	return Failed
end