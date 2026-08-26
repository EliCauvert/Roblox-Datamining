local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local getSubstateToTrackForChangesModule = require(script.Parent.getSubstateToTrackForChanges)
local assetOrderRelativelyEqualModule = require(script.Parent.assetOrderRelativelyEqual)
local tutilsModule = require(parent.tutils)
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)
local constants = avatarExperienceCommonModule.Constants

return function(p1, p2)
	-- upvalues: tutilsModule (ref), getSubstateToTrackForChangesModule (ref), assetOrderRelativelyEqualModule (ref), constants (ref)
	return not tutilsModule.deepEqual(getSubstateToTrackForChangesModule(p1, false), getSubstateToTrackForChangesModule(p2, false)) and (tutilsModule.deepEqual(getSubstateToTrackForChangesModule(p1, true), getSubstateToTrackForChangesModule(p2, true)) and (assetOrderRelativelyEqualModule(p1, p2, constants.LAYERED_ASSET_TYPES) and assetOrderRelativelyEqualModule(p1, p2, constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE)))
end