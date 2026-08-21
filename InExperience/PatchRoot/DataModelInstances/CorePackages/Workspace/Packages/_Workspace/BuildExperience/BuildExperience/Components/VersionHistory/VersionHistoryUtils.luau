local buildExperience = script:FindFirstAncestor("BuildExperience")
local placeVersionHistoryModule = require(buildExperience.Parent.DataHydration.PlaceVersionHistory)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local versionHistoryConstantsModule = require(script.Parent.VersionHistoryConstants)
local publishStatus = placeVersionHistoryModule.PublishStatus
local saveType = placeVersionHistoryModule.SaveType

return {
	formatVersionNumber = function(p0) --[[ line: 14 ]]
		-- upvalues: localizationStringsModule (ref)
		return localizationStringsModule.formatVersionHistoryVersionNumber(p0)
	end,
	getBadgeText = function(p1) --[[ line: 18 ]]
		-- upvalues: publishStatus (ref), localizationStringsModule (ref), saveType (ref), versionHistoryConstantsModule (ref)
		return if p1.publishStatus == publishStatus.Live then localizationStringsModule.VERSION_HISTORY_PUBLISHED elseif p1.publishStatus == publishStatus.PreviouslyPublished then localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED elseif p1.parentAssetVersionId == nil then if p1.saveType == saveType.AutoSave then versionHistoryConstantsModule.AUTOSAVED_BADGE_TEXT else nil else localizationStringsModule.formatVersionHistoryRestoredBadge(p1.parentAssetVersionId)
	end,
	shouldShowEntry = function(p2, p3) --[[ line: 32 ]]
		-- upvalues: versionHistoryConstantsModule (ref)
		return not p3 or p2 ~= versionHistoryConstantsModule.AUTOSAVED_BADGE_TEXT
	end
}