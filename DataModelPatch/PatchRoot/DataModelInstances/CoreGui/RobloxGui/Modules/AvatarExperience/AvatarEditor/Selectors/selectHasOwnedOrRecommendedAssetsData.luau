local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ReducerUtils = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceRodux).Utils.ReducerUtils
local GetFFlagAXEnableRecommendationTypeAllInCustomizeModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableRecommendationTypeAllInCustomize)

return function(p1): boolean
	-- upvalues: UtilsModule (copy), GetFFlagAXEnableRecommendationTypeAllInCustomizeModule (copy), ReducerUtils (copy)
	local OwnedItemIdsBySubtype = p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype
	local AvatarEditorCategoryInfoFromState = UtilsModule.getAvatarEditorCategoryInfoFromState(p1)
	local SearchUuid = if AvatarEditorCategoryInfoFromState.SearchUuid then AvatarEditorCategoryInfoFromState.SearchUuid else AvatarEditorCategoryInfoFromState.Name
	local RecommendedKey = UtilsModule.getRecommendedKey(AvatarEditorCategoryInfoFromState)
	
	if GetFFlagAXEnableRecommendationTypeAllInCustomizeModule() then
		RecommendedKey = ReducerUtils.generateRecommendedItemsKey(RecommendedKey, AvatarEditorCategoryInfoFromState.RecommendationsType)
	end
	local v1: boolean = OwnedItemIdsBySubtype ~= nil and SearchUuid ~= nil and OwnedItemIdsBySubtype[SearchUuid] ~= nil and #OwnedItemIdsBySubtype[SearchUuid] > 0
	local RecommendedItem = p1.AvatarExperience.AvatarEditor.RecommendedItems[RecommendedKey] or {}
	
	return AvatarEditorCategoryInfoFromState and not AvatarEditorCategoryInfoFromState.RenderItemTiles or (v1 or #RecommendedItem > 0)
end