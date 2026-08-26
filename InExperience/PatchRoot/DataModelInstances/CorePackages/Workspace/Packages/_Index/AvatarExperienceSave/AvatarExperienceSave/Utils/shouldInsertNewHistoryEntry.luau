local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local tutilsModule = require(parent.tutils)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)
local itemTypeEnum = avatarExperienceCommonModule.Enums.ItemTypeEnum
local getSubstateToTrackForChangesModule = require(avatarExperienceSave.Utils.getSubstateToTrackForChanges)
local assetOrderRelativelyEqualModule = require(avatarExperienceSave.Utils.assetOrderRelativelyEqual)
local constants = avatarExperienceCommonModule.Constants
local _ = require(parent.AvatarExperienceRodux)

return function(p1, p2)
	-- upvalues: getSubstateToTrackForChangesModule (ref), tutilsModule (ref), assetOrderRelativelyEqualModule (ref), constants (ref), itemTypeEnum (ref)
	local var1 = getSubstateToTrackForChangesModule(p2, true)
	
	if tutilsModule.deepEqual(getSubstateToTrackForChangesModule(p1, true), var1) and assetOrderRelativelyEqualModule(p1, p2, constants.LAYERED_ASSET_TYPES) and assetOrderRelativelyEqualModule(p1, p2, constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE) then
		return false
	end
	local var2 = true
	
	for i, v in var1.OutfitTryOn.TryOnItems or {} do
		if v.itemType == itemTypeEnum.Bundle and tutilsModule.fieldCount(v.bundleInfo or {}) == 0 then
			var2 = false
			
			return var2
		end
	end
	return var2
end