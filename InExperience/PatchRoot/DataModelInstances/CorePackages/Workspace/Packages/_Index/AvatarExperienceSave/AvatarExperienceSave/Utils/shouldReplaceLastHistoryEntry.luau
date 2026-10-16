local AvatarExperienceSave = script:FindFirstAncestor("AvatarExperienceSave")
local Parent = AvatarExperienceSave.Parent
local GetSubstateToTrackForChangesModule = require(script.Parent.getSubstateToTrackForChanges)
local AssetOrderRelativelyEqualModule = require(script.Parent.assetOrderRelativelyEqual)
local TutilsModule = require(Parent.tutils)
local _ = require(AvatarExperienceSave.Context.AvatarSaveContext)
local Constants = require(Parent.AvatarExperienceCommon).Constants

return function(p1, p2) --[[ Line: 15 | Named "shouldReplaceLastHistoryEntry" ]]
	-- upvalues: TutilsModule (copy), GetSubstateToTrackForChangesModule (copy), AssetOrderRelativelyEqualModule (copy), Constants (copy)
	return not TutilsModule.deepEqual(GetSubstateToTrackForChangesModule(p1, false), GetSubstateToTrackForChangesModule(p2, false)) and (TutilsModule.deepEqual(GetSubstateToTrackForChangesModule(p1, true), GetSubstateToTrackForChangesModule(p2, true)) and (AssetOrderRelativelyEqualModule(p1, p2, Constants.LAYERED_ASSET_TYPES) and AssetOrderRelativelyEqualModule(p1, p2, Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE)))
end