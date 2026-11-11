local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local _ = require(Modules.AvatarExperience.Common.Types)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local SelectAvatarPreviewColors = if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXColorAdjustmentButtonShouldAccountForTryOns then AvatarExperienceCommonModule.State.Selectors.selectAvatarPreviewColors else require(Modules.AvatarExperience.Common.Selectors.selectAvatarPreviewColors)
local SelectHasBodyTryOnFunction = AvatarExperienceCommonModule.State.Selectors.selectHasBodyTryOn
local UtilsModule = require(Modules.AvatarExperience.AvatarEditor.Utils)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)

return function(p1)
	-- upvalues: ConstantsModule (copy), SelectHasBodyTryOnFunction (copy), UtilsModule (copy), SelectAvatarPreviewColors (copy)
	local AvatarExperience = p1.AvatarExperience
	local BodyPartForSkinColoringIds = ConstantsModule.BodyPartButtonData[AvatarExperience.AvatarEditor.BodyColorPickerSettings.selectedBodyPartIndex].bodyPartForSkinColoringIds
	
	if BodyPartForSkinColoringIds == nil or #BodyPartForSkinColoringIds == 0 then
		return nil
	else
		local BodyPartColorRangeIds = AvatarExperience.AvatarScene.OutfitTryOn.BodyPartColorRangeIds
		local RangeIdSharedByBodyParts = UtilsModule.getRangeIdSharedByBodyParts(BodyPartForSkinColoringIds, if SelectHasBodyTryOnFunction(p1) and BodyPartColorRangeIds then BodyPartColorRangeIds else AvatarExperience.AvatarEditor.Character.BodyPartRangeIds)
		
		return if RangeIdSharedByBodyParts == nil then nil elseif UtilsModule.getColor3SharedByBodyParts(BodyPartForSkinColoringIds, (SelectAvatarPreviewColors(p1))) == nil then nil else RangeIdSharedByBodyParts
	end
end