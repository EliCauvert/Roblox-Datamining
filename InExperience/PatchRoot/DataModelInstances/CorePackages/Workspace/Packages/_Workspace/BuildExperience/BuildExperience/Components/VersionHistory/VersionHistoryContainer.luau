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

local function _(p1)
	return if type(p1) == "number" then p1 elseif type(p1) == "string" then tonumber(p1) else nil
end

local _ = function(p1)
	local version = p1.version
	
	return assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p1.version}`)
end

local _ = function(p1, p2)
	assert(type(p1) == "string" and p1 ~= "", `Place version {p2} must not be empty`)
	
	return p1
end

local function formatCreatedDate(p1, p2)
	-- upvalues: localizationStringsModule (ref)
	assert(type(p1) == "string" and p1 ~= "", "Place version createdTime must not be empty")
	local match, match_1, match_2 = string.match(p1, "^(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local var1 = if match_1 then tonumber(match_1) else nil
	local var2 = if match_2 then tonumber(match_2) else nil
	assert(match ~= nil and (var1 ~= nil and (var2 ~= nil and p2[var1] ~= nil)), `Place version createdTime must be an ISO date: {p1}`)
	
	return localizationStringsModule.formatVersionHistoryCreatedDate(p2[var1], var2, match)
end

local function mapVersionToEntry(p1, p2, p3)
	-- upvalues: localizationStringsModule (ref), formatCreatedDate (ref), versionHistoryUtilsModule (ref)
	local version = p1.version
	local var1 = assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p1.version}`)
	
	return {
		id = tostring(var1),
		versionNumber = var1,
		versionLabel = localizationStringsModule.formatVersionHistoryVersionLabel(var1, formatCreatedDate(p1.createdTime, p2)),
		title = if p1.title == nil or p1.title == "" then localizationStringsModule.formatVersionHistoryVersionTitle(var1) else p1.title,
		description = if p1.description == nil or p1.description == "" then p3 else p1.description,
		noteTitle = p1.title,
		noteDescription = p1.description,
		badgeText = versionHistoryUtilsModule.getBadgeText(p1)
	}
end

local function mapHistoryToEntries(p1, p2, p3)
	-- upvalues: mapVersionToEntry (ref)
	if p1 == nil or p1.placeVersions == nil then
		return {}
	end
	local t = {}
	
	for i, v in p1.placeVersions do
		table.insert(t, mapVersionToEntry(v, p2, p3))
	end
	return t
end

local _ = function(p4, p5)
	-- upvalues: localizationStringsModule (ref)
	return p5:Format(if p4 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = p4 })
end

local function formatLocalizedCreatedDate(p4, p5, p6)
	-- upvalues: localizationStringsModule (ref)
	assert(type(p4) == "string" and p4 ~= "", "Place version createdTime must not be empty")
	local match, match_1, match_2 = string.match(p4, "^(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local var1 = if match_1 then tonumber(match_1) else nil
	local var2 = if match_2 then tonumber(match_2) else nil
	assert(match ~= nil and (var1 ~= nil and (var2 ~= nil and p5[var1] ~= nil)), `Place version createdTime must be an ISO date: {p4}`)
	
	return p6:Format(localizationStringsModule.VERSION_HISTORY_CREATED_DATE, { MONTH = p5[var1], DAY = var2, YEAR = match })
end

local function formatLocalizedBadge(p4, p5, p6)
	-- upvalues: localizationStringsModule (ref)
	if p5 == "published" then
		return p6:Format(localizationStringsModule.VERSION_HISTORY_PUBLISHED)
	elseif p5 == "previouslyPublished" then
		return p6:Format(localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED)
	elseif p5 == "restored" and p4.parentAssetVersionId ~= nil then
		local VERSION_HISTORY_RESTORED_BADGE = localizationStringsModule.VERSION_HISTORY_RESTORED_BADGE
		local t = {}
		local parentAssetVersionId = p4.parentAssetVersionId
		t.VERSION = p6:Format(if parentAssetVersionId < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = parentAssetVersionId })
		
		return p6:Format(VERSION_HISTORY_RESTORED_BADGE, t)
	end
	return if p5 == "autosaved" then p6:Format(localizationStringsModule.VERSION_HISTORY_AUTOSAVED) else nil
end

local function mapLocalizedVersionToEntry(p4, p5, p6, p7)
	-- upvalues: localizationStringsModule (ref), formatLocalizedCreatedDate (ref), versionHistoryUtilsModule (ref), formatLocalizedBadge (ref)
	local version = p4.version
	local var1 = assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p4.version}`)
	local badgeKind = versionHistoryUtilsModule.getBadgeKind(p4)
	
	return {
		id = tostring(var1),
		versionNumber = var1,
		versionLabel = p7:Format(localizationStringsModule.VERSION_HISTORY_VERSION_LABEL, {
			VERSION = p7:Format(if var1 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = var1 }),
			CREATED_DATE = formatLocalizedCreatedDate(p4.createdTime, p5, p7)
		}),
		title = if p4.title == nil or p4.title == "" then p7:Format(localizationStringsModule.VERSION_HISTORY_VERSION_TITLE, { VERSION = var1 }) else p4.title,
		description = if p4.description == nil or p4.description == "" then p6 else p4.description,
		noteTitle = p4.title,
		noteDescription = p4.description,
		badgeText = formatLocalizedBadge(p4, badgeKind, p7),
		isAutosaved = badgeKind == "autosaved"
	}
end

local function mapLocalizedHistoryToEntries(p4, p5, p6, p7)
	-- upvalues: mapLocalizedVersionToEntry (ref)
	if p4 == nil or p4.placeVersions == nil then
		return {}
	end
	local t = {}
	
	for i, v in p4.placeVersions do
		table.insert(t, mapLocalizedVersionToEntry(v, p5, p6, p7))
	end
	return t
end

local _ = function(p8, p9, p10)
	-- upvalues: dataStatus (ref), localizationStringsModule (ref)
	return if p10 == nil then if p8 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif p8 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #p9 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else p10
end

local _ = function(p8, p9, p10, p11)
	-- upvalues: localizationStringsModule (ref)
	return if p8 == localizationStringsModule.VERSION_HISTORY_LOADING then p9 elseif p8 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then p10 elseif p8 == localizationStringsModule.VERSION_HISTORY_EMPTY then p11 else p8
end

return function(p8)
	-- upvalues: useLocalization (ref), dateHelper (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationModule (ref), placeVersionHistoryModule (ref), signalsReactModule (ref), useScrollToTopAfterRestoreModule (ref), getPlaytestLoadingStoreModule (ref), mapLocalizedHistoryToEntries (ref), mapHistoryToEntries (ref), dataStatus (ref), rollbackPlaceWithRetryModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildNoPublishOnRevertModule (ref), fFlagisPublishOnBuildRevertModule (ref), versionHistoryBottomSheetModule (ref)
	local VERSION_HISTORY_RESTORE_FAILED, VERSION_HISTORY_FALLBACK_DESCRIPTION
	local var1 = useLocalization(dateHelper.MonthsLocalizationKeys)
	local var2 = if fFlagBuildLocalization then useLocalization({
		empty = localizationStringsModule.VERSION_HISTORY_EMPTY,
		fallbackDescription = localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION,
		loadFailed = localizationStringsModule.VERSION_HISTORY_LOAD_FAILED,
		loading = localizationStringsModule.VERSION_HISTORY_LOADING,
		restoreFailed = localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
	}) else nil
	local var3 = if fFlagBuildLocalization then reactModule.useContext(localizationModule.LocalizationRoactContext) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		VERSION_HISTORY_RESTORE_FAILED = var2.restoreFailed
		VERSION_HISTORY_FALLBACK_DESCRIPTION = var2.fallbackDescription
	else
		VERSION_HISTORY_RESTORE_FAILED = localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
		VERSION_HISTORY_FALLBACK_DESCRIPTION = localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION
	end
	local var4 = reactModule.useMemo(function()
		-- upvalues: p8 (ref), placeVersionHistoryModule (copy)
		return p8.store or placeVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p8.store })
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), p8 (ref)
		return var4.getAndFetchHistory(p8.placeId)
	end, { var4, p8.placeId })
	local var6 = signalsReactModule.useSignalState(var5.data)
	local var7 = signalsReactModule.useSignalState(var5.status)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(nil)
	local var12 = useScrollToTopAfterRestoreModule()
	local var13 = signalsReactModule.useSignalState(reactModule.useCallback(function(p9)
		-- upvalues: getPlaytestLoadingStoreModule (copy), p8 (ref)
		return getPlaytestLoadingStoreModule(p9).getAgentStatusForPlaceId(p8.placeId)(p9) == "Loading"
	end, { p8.placeId }))
	local var14 = reactModule.useMemo(function()
		-- upvalues: fFlagBuildLocalization (copy), mapLocalizedHistoryToEntries (copy), var6 (ref), var1 (ref), VERSION_HISTORY_FALLBACK_DESCRIPTION (write), var3 (ref), mapHistoryToEntries (copy)
		return if fFlagBuildLocalization then mapLocalizedHistoryToEntries(var6, var1, VERSION_HISTORY_FALLBACK_DESCRIPTION, var3) else mapHistoryToEntries(var6, var1, VERSION_HISTORY_FALLBACK_DESCRIPTION)
	end, {
		var6,
		var1,
		VERSION_HISTORY_FALLBACK_DESCRIPTION,
		var3,
		if fFlagBuildLocalization then var2[localizationModule.RobloxLocaleIdKey] else nil
	})
	local var15 = if var10 ~= nil then if var7 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif var7 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #var14 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else var10
	
	return reactModule.createElement(versionHistoryBottomSheetModule, {
		isOpen = p8.isOpen,
		entries = var14,
		statusText = if fFlagBuildLocalization then if var15 == localizationStringsModule.VERSION_HISTORY_LOADING then var2.loading elseif var15 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then var2.loadFailed elseif var15 == localizationStringsModule.VERSION_HISTORY_EMPTY then var2.empty else var15 else var15,
		isRestoreDisabled = var8 or var13,
		onClose = p8.onClose,
		onRestore = reactModule.useCallback(function(p9)
			-- upvalues: var8 (ref), var13 (ref), var9 (ref), var11 (ref), rollbackPlaceWithRetryModule (copy), p8 (ref), fFlagEnableTeamTestLua (copy), fFlagBuildNoPublishOnRevertModule (copy), fFlagisPublishOnBuildRevertModule (copy), var12 (ref), VERSION_HISTORY_RESTORE_FAILED (write)
			if var8 or var13 then
				return
			end
			var9(true)
			var11(nil)
			rollbackPlaceWithRetryModule(p8.placeId, p9.versionNumber, {
				debugSource = "version_history restore",
				note = { title = p9.noteTitle, description = p9.noteDescription },
				published = if fFlagEnableTeamTestLua then if fFlagBuildNoPublishOnRevertModule then false else true else fFlagisPublishOnBuildRevertModule
			}):andThen(function()
				-- upvalues: var12 (copy)
				var12.scrollToTopAfterRestore()
			end):catch(function(_)
				-- upvalues: var11 (copy), VERSION_HISTORY_RESTORE_FAILED (copy)
				var11(VERSION_HISTORY_RESTORE_FAILED)
			end):finally(function()
				-- upvalues: var9 (copy)
				var9(false)
			end)
		end, {
			var8, var13, VERSION_HISTORY_RESTORE_FAILED, var12, var4, p8.placeId
		}),
		scrollingFrameRef = var12.scrollingFrameRef,
		testId = p8.testId
	})
end