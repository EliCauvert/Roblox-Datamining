local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local localizationModule = require(parent.Localization)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local timeModule = require(parent.Time)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagisPublishOnBuildRevertModule = require(buildExperience.Flags.FFlagisPublishOnBuildRevert)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local rollbackPlaceWithRetryModule = require(buildExperience.utils.rollbackPlaceWithRetry)
local versionHistoryBottomSheetModule = require(script.Parent.VersionHistoryBottomSheet)
local versionHistoryUtilsModule = require(script.Parent.VersionHistoryUtils)
local useScrollToTopAfterRestoreModule = require(script.Parent.useScrollToTopAfterRestore)
local dataStatus = dataHydrationModule.DataStatus
local dateHelper = timeModule.DateHelper
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local fFlagBuildNoPublishOnRevertModule = require(buildExperience.Flags.FFlagBuildNoPublishOnRevert)
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

local function formatCreatedDate(p4, p5) --[[ line: 59 ]]
	-- upvalues: localizationStringsModule (ref)
	assert(type(p4) == "string" and p4 ~= "", "Place version createdTime must not be empty")
	local match, match_1, match_2 = string.match(p4, "^(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local var26 = if match_1 then tonumber(match_1) else nil
	local var27 = if match_2 then tonumber(match_2) else nil
	assert(match ~= nil and (var26 ~= nil and (var27 ~= nil and p5[var26] ~= nil)), `Place version createdTime must be an ISO date: {p4}`)
	
	return localizationStringsModule.formatVersionHistoryCreatedDate(p5[var26], var27, match)
end

local function mapVersionToEntry(p6, p7, p8) --[[ line: 72 ]]
	-- upvalues: localizationStringsModule (ref), formatCreatedDate (ref), versionHistoryUtilsModule (ref)
	local version = p6.version
	local var28 = assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p6.version}`)
	
	return {
		id = tostring(var28),
		versionNumber = var28,
		versionLabel = localizationStringsModule.formatVersionHistoryVersionLabel(var28, formatCreatedDate(p6.createdTime, p7)),
		title = if p6.title == nil or p6.title == "" then localizationStringsModule.formatVersionHistoryVersionTitle(var28) else p6.title,
		description = if p6.description == nil or p6.description == "" then p8 else p6.description,
		noteTitle = p6.title,
		noteDescription = p6.description,
		badgeText = versionHistoryUtilsModule.getBadgeText(p6)
	}
end

local function mapHistoryToEntries(p9, p10, p11) --[[ line: 98 ]]
	-- upvalues: mapVersionToEntry (ref)
	if p9 == nil or p9.placeVersions == nil then
		return {}
	end
	local t = {}
	
	for i, v in p9.placeVersions do
		table.insert(t, mapVersionToEntry(v, p10, p11))
	end
	return t
end

local _ = function(p12, p13) --[[ line: 114 | named "formatLocalizedVersionNumber" ]]
	-- upvalues: localizationStringsModule (ref)
	return p13:Format(if p12 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = p12 })
end

local function formatLocalizedCreatedDate(p14, p15, p16) --[[ line: 125 ]]
	-- upvalues: localizationStringsModule (ref)
	assert(type(p14) == "string" and p14 ~= "", "Place version createdTime must not be empty")
	local match, match_1, match_2 = string.match(p14, "^(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local var33 = if match_1 then tonumber(match_1) else nil
	local var34 = if match_2 then tonumber(match_2) else nil
	assert(match ~= nil and (var33 ~= nil and (var34 ~= nil and p15[var33] ~= nil)), `Place version createdTime must be an ISO date: {p14}`)
	
	return p16:Format(localizationStringsModule.VERSION_HISTORY_CREATED_DATE, { MONTH = p15[var33], DAY = var34, YEAR = match })
end

local function formatLocalizedBadge(p17, p18, p19) --[[ line: 146 ]]
	-- upvalues: localizationStringsModule (ref)
	if p18 == "published" then
		return p19:Format(localizationStringsModule.VERSION_HISTORY_PUBLISHED)
	elseif p18 == "previouslyPublished" then
		return p19:Format(localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED)
	elseif p18 == "restored" and p17.parentAssetVersionId ~= nil then
		local VERSION_HISTORY_RESTORED_BADGE = localizationStringsModule.VERSION_HISTORY_RESTORED_BADGE
		local t = {}
		local parentAssetVersionId = p17.parentAssetVersionId
		t.VERSION = p19:Format(if parentAssetVersionId < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = parentAssetVersionId })
		
		return p19:Format(VERSION_HISTORY_RESTORED_BADGE, t)
	end
	return if p18 == "autosaved" then p19:Format(localizationStringsModule.VERSION_HISTORY_AUTOSAVED) else nil
end

local function mapLocalizedVersionToEntry(p20, p21, p22, p23) --[[ line: 161 ]]
	-- upvalues: localizationStringsModule (ref), formatLocalizedCreatedDate (ref), versionHistoryUtilsModule (ref), formatLocalizedBadge (ref)
	local version = p20.version
	local var36 = assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p20.version}`)
	local badgeKind = versionHistoryUtilsModule.getBadgeKind(p20)
	
	return {
		id = tostring(var36),
		versionNumber = var36,
		versionLabel = p23:Format(localizationStringsModule.VERSION_HISTORY_VERSION_LABEL, {
			VERSION = p23:Format(if var36 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = var36 }),
			CREATED_DATE = formatLocalizedCreatedDate(p20.createdTime, p21, p23)
		}),
		title = if p20.title == nil or p20.title == "" then p23:Format(localizationStringsModule.VERSION_HISTORY_VERSION_TITLE, { VERSION = var36 }) else p20.title,
		description = if p20.description == nil or p20.description == "" then p22 else p20.description,
		noteTitle = p20.title,
		noteDescription = p20.description,
		badgeText = formatLocalizedBadge(p20, badgeKind, p23),
		isAutosaved = badgeKind == "autosaved"
	}
end

local function mapLocalizedHistoryToEntries(p24, p25, p26, p27) --[[ line: 195 ]]
	-- upvalues: mapLocalizedVersionToEntry (ref)
	if p24 == nil or p24.placeVersions == nil then
		return {}
	end
	local t = {}
	
	for i, v in p24.placeVersions do
		table.insert(t, mapLocalizedVersionToEntry(v, p25, p26, p27))
	end
	return t
end

local _ = function(p28, p29, p30) --[[ line: 215 | named "getStatusText" ]]
	-- upvalues: dataStatus (ref), localizationStringsModule (ref)
	return if p30 == nil then if p28 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif p28 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #p29 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else p30
end

local _ = function(p31, p32, p33, p34) --[[ line: 229 | named "localizeStatusText" ]]
	-- upvalues: localizationStringsModule (ref)
	return if p31 == localizationStringsModule.VERSION_HISTORY_LOADING then p32 elseif p31 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then p33 elseif p31 == localizationStringsModule.VERSION_HISTORY_EMPTY then p34 else p31
end

return function(p35) --[[ line: 240 | named "VersionHistoryContainer" ]]
	-- upvalues: useLocalization (ref), dateHelper (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationModule (ref), placeVersionHistoryModule (ref), signalsReactModule (ref), useScrollToTopAfterRestoreModule (ref), getPlaytestLoadingStoreModule (ref), mapLocalizedHistoryToEntries (ref), mapHistoryToEntries (ref), dataStatus (ref), rollbackPlaceWithRetryModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildNoPublishOnRevertModule (ref), fFlagisPublishOnBuildRevertModule (ref), versionHistoryBottomSheetModule (ref)
	local VERSION_HISTORY_RESTORE_FAILED, VERSION_HISTORY_FALLBACK_DESCRIPTION
	local var39 = useLocalization(dateHelper.MonthsLocalizationKeys)
	local var40 = if fFlagBuildLocalization then useLocalization({
		empty = localizationStringsModule.VERSION_HISTORY_EMPTY,
		fallbackDescription = localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION,
		loadFailed = localizationStringsModule.VERSION_HISTORY_LOAD_FAILED,
		loading = localizationStringsModule.VERSION_HISTORY_LOADING,
		restoreFailed = localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
	}) else nil
	local var41 = if fFlagBuildLocalization then reactModule.useContext(localizationModule.LocalizationRoactContext) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		VERSION_HISTORY_RESTORE_FAILED = var40.restoreFailed
		VERSION_HISTORY_FALLBACK_DESCRIPTION = var40.fallbackDescription
	else
		VERSION_HISTORY_RESTORE_FAILED = localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
		VERSION_HISTORY_FALLBACK_DESCRIPTION = localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION
	end
	local var42 = reactModule.useMemo(function() --[[ line: 263 ]]
		-- upvalues: p35 (ref), placeVersionHistoryModule (copy)
		return p35.store or placeVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p35.store })
	local var43 = reactModule.useMemo(function() --[[ line: 266 ]]
		-- upvalues: var42 (ref), p35 (ref)
		return var42.getAndFetchHistory(p35.placeId)
	end, { var42, p35.placeId })
	local var44 = signalsReactModule.useSignalState(var43.data)
	local var45 = signalsReactModule.useSignalState(var43.status)
	local var46, var47 = reactModule.useState(false)
	local var48, var49 = reactModule.useState(nil)
	local var50 = useScrollToTopAfterRestoreModule()
	local var51 = signalsReactModule.useSignalState(reactModule.useCallback(function(p36) --[[ line: 274 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy), p35 (ref)
		return getPlaytestLoadingStoreModule(p36).getAgentStatusForPlaceId(p35.placeId)(p36) == "Loading"
	end, { p35.placeId }))
	local var52 = reactModule.useMemo(function() --[[ line: 280 ]]
		-- upvalues: fFlagBuildLocalization (copy), mapLocalizedHistoryToEntries (copy), var44 (ref), var39 (ref), VERSION_HISTORY_FALLBACK_DESCRIPTION (write), var41 (ref), mapHistoryToEntries (copy)
		return if fFlagBuildLocalization then mapLocalizedHistoryToEntries(var44, var39, VERSION_HISTORY_FALLBACK_DESCRIPTION, var41) else mapHistoryToEntries(var44, var39, VERSION_HISTORY_FALLBACK_DESCRIPTION)
	end, {
		var44,
		var39,
		VERSION_HISTORY_FALLBACK_DESCRIPTION,
		var41,
		if fFlagBuildLocalization then var40[localizationModule.RobloxLocaleIdKey] else nil
	})
	local var53 = if var48 ~= nil then if var45 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif var45 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #var52 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else var48
	
	return reactModule.createElement(versionHistoryBottomSheetModule, {
		isOpen = p35.isOpen,
		entries = var52,
		statusText = if fFlagBuildLocalization then if var53 == localizationStringsModule.VERSION_HISTORY_LOADING then var40.loading elseif var53 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then var40.loadFailed elseif var53 == localizationStringsModule.VERSION_HISTORY_EMPTY then var40.empty else var53 else var53,
		isRestoreDisabled = var46 or var51,
		onClose = p35.onClose,
		onRestore = reactModule.useCallback(function(p37) --[[ line: 309 ]]
			-- upvalues: var46 (ref), var51 (ref), var47 (ref), var49 (ref), rollbackPlaceWithRetryModule (copy), p35 (ref), fFlagEnableTeamTestLua (copy), fFlagBuildNoPublishOnRevertModule (copy), fFlagisPublishOnBuildRevertModule (copy), var50 (ref), VERSION_HISTORY_RESTORE_FAILED (write)
			if var46 or var51 then
				return
			end
			var47(true)
			var49(nil)
			rollbackPlaceWithRetryModule(p35.placeId, p37.versionNumber, {
				debugSource = "version_history restore",
				note = { title = p37.noteTitle, description = p37.noteDescription },
				published = if fFlagEnableTeamTestLua then if fFlagBuildNoPublishOnRevertModule then false else true else fFlagisPublishOnBuildRevertModule
			}):andThen(function() --[[ line: 326 ]]
				-- upvalues: var50 (copy)
				var50.scrollToTopAfterRestore()
			end):catch(function(_) --[[ line: 329 ]]
				-- upvalues: var49 (copy), VERSION_HISTORY_RESTORE_FAILED (copy)
				var49(VERSION_HISTORY_RESTORE_FAILED)
			end):finally(function() --[[ line: 332 ]]
				-- upvalues: var47 (copy)
				var47(false)
			end)
		end, {
			var46, var51, VERSION_HISTORY_RESTORE_FAILED, var50, var42, p35.placeId
		}),
		scrollingFrameRef = var50.scrollingFrameRef,
		testId = p35.testId
	})
end