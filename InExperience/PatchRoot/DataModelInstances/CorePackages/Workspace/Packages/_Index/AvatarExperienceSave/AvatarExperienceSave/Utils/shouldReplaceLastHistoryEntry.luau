local avatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local parent = avatarExperienceSave.Parent
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local getSubstateToTrackForChangesModule = require(script.Parent.getSubstateToTrackForChanges)
local assetOrderRelativelyEqualModule = require(script.Parent.assetOrderRelativelyEqual)
local tutilsModule = require(parent.tutils)
local _ = require(avatarExperienceSave.Context.AvatarSaveContext)
local constants = avatarExperienceCommonModule.Constants

return function(p0, p1)
	-- upvalues: tutilsModule (ref), getSubstateToTrackForChangesModule (ref), assetOrderRelativelyEqualModule (ref), constants (ref)
	return not tutilsModule.deepEqual(getSubstateToTrackForChangesModule(p0, false), getSubstateToTrackForChangesModule(p1, false)) and (tutilsModule.deepEqual(getSubstateToTrackForChangesModule(p0, true), getSubstateToTrackForChangesModule(p1, true)) and (assetOrderRelativelyEqualModule(p0, p1, constants.LAYERED_ASSET_TYPES) and assetOrderRelativelyEqualModule(p0, p1, constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE)))
end