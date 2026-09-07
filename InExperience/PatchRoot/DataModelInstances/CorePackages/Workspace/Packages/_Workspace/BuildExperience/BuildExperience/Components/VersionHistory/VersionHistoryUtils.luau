local buildExperience = script:FindFirstAncestor("BuildExperience")
local placeVersionHistoryModule = require(buildExperience.Parent.DataHydration.PlaceVersionHistory)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local versionHistoryConstantsModule = require(script.Parent.VersionHistoryConstants)
local publishStatus = placeVersionHistoryModule.PublishStatus
local saveType = placeVersionHistoryModule.SaveType

return {
	formatVersionNumber = function(p1)
		-- upvalues: localizationStringsModule (ref)
		return localizationStringsModule.formatVersionHistoryVersionNumber(p1)
	end,
	getBadgeKind = function(p1)
		-- upvalues: publishStatus (ref), saveType (ref)
		return if p1.publishStatus == publishStatus.Live then "published" elseif p1.publishStatus == publishStatus.PreviouslyPublished then "previouslyPublished" elseif p1.parentAssetVersionId == nil then if p1.saveType == saveType.AutoSave then "autosaved" else nil else "restored"
	end,
	getBadgeText = function(p1)
		-- upvalues: publishStatus (ref), localizationStringsModule (ref), saveType (ref), versionHistoryConstantsModule (ref)
		return if p1.publishStatus == publishStatus.Live then localizationStringsModule.VERSION_HISTORY_PUBLISHED elseif p1.publishStatus == publishStatus.PreviouslyPublished then localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED elseif p1.parentAssetVersionId == nil then if p1.saveType == saveType.AutoSave then versionHistoryConstantsModule.AUTOSAVED_BADGE_TEXT else nil else localizationStringsModule.formatVersionHistoryRestoredBadge(p1.parentAssetVersionId)
	end,
	shouldShowEntry = function(p1, p2)
		-- upvalues: versionHistoryConstantsModule (ref)
		return not p2 or p1 ~= versionHistoryConstantsModule.AUTOSAVED_BADGE_TEXT
	end
}