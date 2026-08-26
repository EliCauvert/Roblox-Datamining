local buildExperience = script:FindFirstAncestor("BuildExperience")
local placeVersionHistoryModule = require(buildExperience.Parent.DataHydration.PlaceVersionHistory)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local versionHistoryConstantsModule = require(script.Parent.VersionHistoryConstants)
local publishStatus = placeVersionHistoryModule.PublishStatus
local saveType = placeVersionHistoryModule.SaveType

local function _(p1)
	return if type(p1) == "number" then p1 elseif type(p1) == "string" then tonumber(p1) else nil
end

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
	getCreatedDateParts = function(p1)
		assert(type(p1) == "string" and p1 ~= "", "Place version createdTime must not be empty")
		local match, match_1, match_2 = string.match(p1, "^(%d%d%d%d)%-(%d%d)%-(%d%d)")
		local var1 = if match_1 then tonumber(match_1) else nil
		local var2 = if match_2 then tonumber(match_2) else nil
		assert(match ~= nil and (var1 ~= nil and var2 ~= nil), `Place version createdTime must be an ISO date: {p1}`)
		
		return var1, var2, match
	end,
	getVersionNumber = function(p1)
		local version = p1.version
		local var1 = if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil
		assert(var1 ~= nil, `Place version must be numeric: {p1.version}`)
		
		return var1
	end,
	shouldShowEntry = function(p1, p2)
		-- upvalues: versionHistoryConstantsModule (ref)
		return not p2 or p1 ~= versionHistoryConstantsModule.AUTOSAVED_BADGE_TEXT
	end
}