local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local Parent = AvatarExperienceSave.Parent
local TutilsModule = require(Parent.tutils)
local _ = require(AvatarExperienceSave.Context.AvatarSaveContext)
local ItemTypeEnum = require(Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local GetSubstateToTrackForChangesModule = require(AvatarExperienceSave.Utils.getSubstateToTrackForChanges)
local AssetOrderRelativelyEqualModule = require(AvatarExperienceSave.Utils.assetOrderRelativelyEqual)
local Constants = require(Parent.AvatarExperienceCommon).Constants
local _ = require(Parent.AvatarExperienceRodux)

return function(p1, p2): boolean --[[ Line: 19 | Named "shouldInsertNewHistoryEntry" ]]
	-- upvalues: GetSubstateToTrackForChangesModule (copy), TutilsModule (copy), AssetOrderRelativelyEqualModule (copy), Constants (copy), ItemTypeEnum (copy)
	local SubstateToTrackForChangesModule = GetSubstateToTrackForChangesModule(p1, true)
	local SubstateToTrackForChangesModule1 = GetSubstateToTrackForChangesModule(p2, true)
	
	if TutilsModule.deepEqual(SubstateToTrackForChangesModule, SubstateToTrackForChangesModule1) and AssetOrderRelativelyEqualModule(p1, p2, Constants.LAYERED_ASSET_TYPES) and AssetOrderRelativelyEqualModule(p1, p2, Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE) then
		return false
	end
	local Flag = true
	local TryOnItems = SubstateToTrackForChangesModule1.OutfitTryOn.TryOnItems or {}
	for _, tryOnItem in TryOnItems do
		if tryOnItem.itemType == ItemTypeEnum.Bundle and TutilsModule.fieldCount(tryOnItem.bundleInfo or {}) == 0 then
			Flag = false
			
			return Flag
		end
	end
	return Flag
end