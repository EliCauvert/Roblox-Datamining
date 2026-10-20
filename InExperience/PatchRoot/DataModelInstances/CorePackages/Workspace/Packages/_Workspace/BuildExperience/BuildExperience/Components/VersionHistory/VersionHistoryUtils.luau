local PlaceVersionHistoryModule = require(script:FindFirstAncestor("BuildExperience").Parent.DataHydration.PlaceVersionHistory)
local VersionHistoryConstantsModule = require(script.Parent.VersionHistoryConstants)
local PublishStatus = PlaceVersionHistoryModule.PublishStatus
local SaveType = PlaceVersionHistoryModule.SaveType

local function _(p1)
	return if type(p1) == "number" then p1 elseif type(p1) == "string" then tonumber(p1) else nil
end

return {
	getBadgeKind = function(p1)
		-- upvalues: PublishStatus (copy), SaveType (copy)
		return if p1.publishStatus == PublishStatus.Live then "published" elseif p1.publishStatus == PublishStatus.PreviouslyPublished then "previouslyPublished" elseif p1.parentAssetVersionId == nil then if p1.saveType == SaveType.AutoSave then "autosaved" else nil else "restored"
	end,
	getCreatedDateParts = function(Text: string)
		assert(type(Text) == "string" and Text ~= "", "Place version createdTime must not be empty")
		local Match, Match2, Match3 = string.match(Text, "^(%d%d%d%d)%-(%d%d)%-(%d%d)")
		local Number = if Match2 then tonumber(Match2) else nil
		local Number1 = if Match3 then tonumber(Match3) else nil
		assert(Match ~= nil and (Number ~= nil and Number1 ~= nil), `Place version createdTime must be an ISO date: {Text}`)
		
		return Number, Number1, Match
	end,
	getVersionNumber = function(p1)
		local Version = p1.version
		local Version1 = if type(Version) == "number" then Version elseif type(Version) == "string" then tonumber(Version) else nil
		assert(Version1 ~= nil, `Place version must be numeric: {p1.version}`)
		
		return Version1
	end,
	shouldShowEntry = function(AUTOSAVEDBADGETEXT, p1): boolean
		-- upvalues: VersionHistoryConstantsModule (copy)
		return not p1 or AUTOSAVEDBADGETEXT ~= VersionHistoryConstantsModule.AUTOSAVED_BADGE_TEXT
	end
}