local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local localizationModule = require(parent.Localization)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local timeModule = require(parent.Time)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local versionHistoryBottomSheetModule = require(script.Parent.VersionHistoryBottomSheet)
local dataStatus = dataHydrationModule.DataStatus
local dateHelper = timeModule.DateHelper
local debug = creatorAgentChatModule.debug
local useLocalization = localizationModule.Hooks.useLocalization

local function _(p0) --[[ line: 40 | named "toNumber" ]]
	return if type(p0) == "number" then p0 elseif type(p0) == "string" then tonumber(p0) else nil
end

local _ = function(p1) --[[ line: 50 | named "getVersionNumber" ]]
	local version = p1.version
	
	return assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p1.version}`)
end

local _ = function(p2, p3) --[[ line: 54 | named "getRequiredString" ]]
	assert(type(p2) == "string" and p2 ~= "", `Place version {p3} must not be empty`)
	
	return p2
end

local _ = function(p4) --[[ line: 59 | named "formatVersionNumber" ]]
	return if p4 < 10 then `v0{p4}` else `v{p4}`
end

local function formatCreatedDate(p5, p6) --[[ line: 67 ]]
	assert(type(p5) == "string" and p5 ~= "", "Place version createdTime must not be empty")
	local match, match_1, match_2 = string.match(p5, "^(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local var16 = if match_1 then tonumber(match_1) else nil
	local var17 = if match_2 then tonumber(match_2) else nil
	assert(match ~= nil and (var16 ~= nil and (var17 ~= nil and p6[var16] ~= nil)), `Place version createdTime must be an ISO date: {p5}`)
	
	return `{p6[var16]} {var17}, {match}`
end

local _ = function(p7) --[[ line: 80 | named "getBadgeText" ]]
	if p7.isPublished == true then
		return "Published"
	elseif p7.parentAssetVersionId == nil then
		return nil
	end
	local parentAssetVersionId = p7.parentAssetVersionId
	
	return `Restored {if parentAssetVersionId < 10 then `v0{parentAssetVersionId}` else `v{parentAssetVersionId}`}`
end

local function mapVersionToEntry(p8, p9) --[[ line: 90 ]]
	-- upvalues: formatCreatedDate (ref)
	local var20
	local version = p8.version
	local var18 = assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p8.version}`)
	local t = {
		id = tostring(var18),
		versionNumber = var18,
		versionLabel = `{if var18 < 10 then `v0{var18}` else `v{var18}`} \194\183 {formatCreatedDate(p8.createdTime, p9)}`,
		title = if p8.title == nil or p8.title == "" then `Version {var18}` else p8.title,
		description = if p8.description == nil or p8.description == "" then "No description provided." else p8.description,
		noteTitle = p8.title,
		noteDescription = p8.description,
		restoreMessage = p8.description
	}
	
	if p8.isPublished == true then
		var20 = "Published"
	elseif p8.parentAssetVersionId == nil then
		var20 = nil
	else
		local parentAssetVersionId = p8.parentAssetVersionId
		var20 = `Restored {if parentAssetVersionId < 10 then `v0{parentAssetVersionId}` else `v{parentAssetVersionId}`}`
	end
	t.badgeText = var20
	
	return t
end

local function mapHistoryToEntries(p10, p11) --[[ line: 113 ]]
	-- upvalues: mapVersionToEntry (ref)
	if p10 == nil or p10.placeVersions == nil then
		return {}
	end
	local t = {}
	
	for i, v in p10.placeVersions do
		table.insert(t, mapVersionToEntry(v, p11))
	end
	return t
end

local _ = function(p12, p13, p14) --[[ line: 128 | named "getStatusText" ]]
	-- upvalues: dataStatus (ref)
	return if p14 == nil then if p12 == dataStatus.NotReady then "Loading version history..." elseif p12 == dataStatus.Failed then "Version history couldn't load." elseif #p13 == 0 then "No version history yet." else nil else p14
end

return function(p15) --[[ line: 142 | named "VersionHistoryContainer" ]]
	-- upvalues: useLocalization (ref), dateHelper (ref), reactModule (ref), placeVersionHistoryModule (ref), signalsReactModule (ref), getPlaytestLoadingStoreModule (ref), mapHistoryToEntries (ref), dataStatus (ref), debug (ref), versionHistoryBottomSheetModule (ref)
	local var22 = useLocalization(dateHelper.MonthsLocalizationKeys)
	local var23 = reactModule.useMemo(function() --[[ line: 144 ]]
		-- upvalues: p15 (ref), placeVersionHistoryModule (copy)
		return p15.store or placeVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p15.store })
	local var24 = reactModule.useMemo(function() --[[ line: 147 ]]
		-- upvalues: var23 (ref), p15 (ref)
		return var23.getAndFetchHistory(p15.placeId)
	end, { var23, p15.placeId })
	local var25 = signalsReactModule.useSignalState(var24.data)
	local var26 = signalsReactModule.useSignalState(var24.status)
	local var27, var28 = reactModule.useState(false)
	local var29, var30 = reactModule.useState(nil)
	local var31 = signalsReactModule.useSignalState(reactModule.useCallback(function(p16) --[[ line: 154 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy), p15 (ref)
		return getPlaytestLoadingStoreModule(p16).getAgentStatusForPlaceId(p15.placeId)(p16) == "Loading"
	end, { p15.placeId }))
	local var32 = reactModule.useMemo(function() --[[ line: 159 ]]
		-- upvalues: mapHistoryToEntries (copy), var25 (ref), var22 (ref)
		return mapHistoryToEntries(var25, var22)
	end, { var25, var22 })
	
	return reactModule.createElement(versionHistoryBottomSheetModule, {
		isOpen = p15.isOpen,
		entries = var32,
		statusText = if var29 ~= nil then if var26 == dataStatus.NotReady then "Loading version history..." elseif var26 == dataStatus.Failed then "Version history couldn't load." elseif #var32 == 0 then "No version history yet." else nil else var29,
		isRestoreDisabled = var27 or var31,
		onClose = p15.onClose,
		onRestore = reactModule.useCallback(function(p17) --[[ line: 164 ]]
			-- upvalues: var27 (ref), var31 (ref), var28 (ref), var30 (ref), var23 (ref), p15 (ref), debug (copy)
			if var27 or var31 then
				return
			end
			var28(true)
			var30(nil)
			var23.rollbackPlace(p15.placeId, p17.versionNumber, p17.restoreMessage, true):andThen(function(p18) --[[ line: 173 ]]
				-- upvalues: debug (copy), p15 (copy), p17 (ref), var23 (copy)
				if p18.newVersionNumber == nil then
					debug.log("info", "version_history restore note copy skipped", {
						reason = "newVersionNumber_nil",
						placeId = p15.placeId,
						restoredVersion = p17.versionNumber
					})
					
					return nil
				end
				local var33 = tostring(p18.newVersionNumber)
				local t = { title = p17.noteTitle, description = p17.noteDescription }
				
				return var23.addVersionNote(p15.placeId, var33, t):catch(function(p19) --[[ line: 189 ]]
					-- upvalues: debug (copy), p15 (copy), p17 (copy), var33 (ref), t (ref)
					debug.log("warn", "version_history restore note copy failed", {
						placeId = p15.placeId,
						restoredVersion = p17.versionNumber,
						newVersion = var33,
						titleLength = if t.title == nil then nil else #t.title,
						descriptionLength = if t.description == nil then nil else #t.description,
						error = tostring(p19)
					})
					error(p19)
				end)
			end):catch(function(_) --[[ line: 201 ]]
				-- upvalues: var30 (copy)
				var30("Couldn't restore this version. Try again.")
			end):finally(function() --[[ line: 204 ]]
				-- upvalues: var28 (copy)
				var28(false)
			end)
		end, { var27, var31, var23, p15.placeId }),
		testId = p15.testId
	})
end