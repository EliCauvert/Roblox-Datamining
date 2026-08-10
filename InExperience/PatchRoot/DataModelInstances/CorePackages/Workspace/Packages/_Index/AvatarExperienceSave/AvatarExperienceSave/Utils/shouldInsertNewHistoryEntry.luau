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

return function(p0, p1) --[[ line: 18 | named "shouldInsertNewHistoryEntry" ]]
	-- upvalues: getSubstateToTrackForChangesModule (ref), tutilsModule (ref), assetOrderRelativelyEqualModule (ref), constants (ref), itemTypeEnum (ref)
	local var5 = getSubstateToTrackForChangesModule(p1, true)
	
	if tutilsModule.deepEqual(getSubstateToTrackForChangesModule(p0, true), var5) and assetOrderRelativelyEqualModule(p0, p1, constants.LAYERED_ASSET_TYPES) and assetOrderRelativelyEqualModule(p0, p1, constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE) then
		return false
	end
	local var6 = true
	
	for i, v in var5.OutfitTryOn.TryOnItems or {} do
		if v.itemType == itemTypeEnum.Bundle and tutilsModule.fieldCount(v.bundleInfo or {}) == 0 then
			var6 = false
			
			return var6
		end
	end
	return var6
end