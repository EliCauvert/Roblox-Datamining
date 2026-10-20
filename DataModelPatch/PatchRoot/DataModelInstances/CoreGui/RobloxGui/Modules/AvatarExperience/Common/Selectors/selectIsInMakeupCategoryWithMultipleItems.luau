local CorePackages = game:GetService("CorePackages")
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local GetAvatarEditorCategoriesModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local SelectCurrentAvatarEditorCategoryFunction = AvatarExperienceCommonModule.State.Selectors.selectCurrentAvatarEditorCategory
local IsMakeupAssetTypeFunction = AvatarExperienceCommonModule.Utils.isMakeupAssetType
local SelectEquippedAssetsFunction = AvatarExperienceCommonModule.State.Selectors.selectEquippedAssets
local AvatarEditorCategories = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.AvatarEditorCategories
local FFlagAXMakeupEquipping = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMakeupEquipping
local MINMAKEUPITEMSFORLAYERINGBUTTON = AvatarExperienceCommonModule.Constants.MIN_MAKEUP_ITEMS_FOR_LAYERING_BUTTON

local function getEquippedMakeupCount(p1): number
	-- upvalues: FFlagAXMakeupEquipping (copy), SelectEquippedAssetsFunction (copy), IsMakeupAssetTypeFunction (copy)
	if not FFlagAXMakeupEquipping then
		return 0
	end
	local SelectEquippedAssetsResult = SelectEquippedAssetsFunction(p1)
	
	if not SelectEquippedAssetsResult then
		return 0
	end
	local Count = 0
	
	for i, value in SelectEquippedAssetsResult do
		if IsMakeupAssetTypeFunction(i) then
			for _ in value do
				Count += 1
			end
		end
	end
	return Count
end

return function(p2): boolean
	-- upvalues: FFlagAXMakeupEquipping (copy), SelectCurrentAvatarEditorCategoryFunction (copy), GetAvatarEditorCategoriesModule (copy), AvatarEditorCategories (copy), getEquippedMakeupCount (copy), MINMAKEUPITEMSFORLAYERINGBUTTON (copy)
	if FFlagAXMakeupEquipping then
		local AvatarEditorCategoriesModuleEntry = GetAvatarEditorCategoriesModule()[SelectCurrentAvatarEditorCategoryFunction(p2)]
		
		return if AvatarEditorCategoriesModuleEntry and AvatarEditorCategoriesModuleEntry.Id == AvatarEditorCategories.Makeup then MINMAKEUPITEMSFORLAYERINGBUTTON <= getEquippedMakeupCount(p2) else false
	else
		return false
	end
end