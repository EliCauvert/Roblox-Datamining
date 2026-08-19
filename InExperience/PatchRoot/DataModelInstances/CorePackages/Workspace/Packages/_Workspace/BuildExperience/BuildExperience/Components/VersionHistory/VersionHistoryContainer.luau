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
	local var22 = if match_1 then tonumber(match_1) else nil
	local var23 = if match_2 then tonumber(match_2) else nil
	assert(match ~= nil and (var22 ~= nil and (var23 ~= nil and p5[var22] ~= nil)), `Place version createdTime must be an ISO date: {p4}`)
	
	return localizationStringsModule.formatVersionHistoryCreatedDate(p5[var22], var23, match)
end

local function mapVersionToEntry(p6, p7, p8) --[[ line: 72 ]]
	-- upvalues: localizationStringsModule (ref), formatCreatedDate (ref), versionHistoryUtilsModule (ref)
	local version = p6.version
	local var24 = assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p6.version}`)
	
	return {
		id = tostring(var24),
		versionNumber = var24,
		versionLabel = localizationStringsModule.formatVersionHistoryVersionLabel(var24, formatCreatedDate(p6.createdTime, p7)),
		title = if p6.title == nil or p6.title == "" then localizationStringsModule.formatVersionHistoryVersionTitle(var24) else p6.title,
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

local _ = function(p12, p13, p14) --[[ line: 114 | named "getStatusText" ]]
	-- upvalues: dataStatus (ref), localizationStringsModule (ref)
	return if p14 == nil then if p12 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif p12 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #p13 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else p14
end

local _ = function(p15, p16, p17, p18) --[[ line: 128 | named "localizeStatusText" ]]
	-- upvalues: localizationStringsModule (ref)
	return if p15 == localizationStringsModule.VERSION_HISTORY_LOADING then p16 elseif p15 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then p17 elseif p15 == localizationStringsModule.VERSION_HISTORY_EMPTY then p18 else p15
end

return function(p19) --[[ line: 139 | named "VersionHistoryContainer" ]]
	-- upvalues: useLocalization (ref), dateHelper (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), reactModule (ref), placeVersionHistoryModule (ref), signalsReactModule (ref), useScrollToTopAfterRestoreModule (ref), getPlaytestLoadingStoreModule (ref), mapHistoryToEntries (ref), dataStatus (ref), rollbackPlaceWithRetryModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildNoPublishOnRevertModule (ref), fFlagisPublishOnBuildRevertModule (ref), versionHistoryBottomSheetModule (ref)
	local var26 = useLocalization(dateHelper.MonthsLocalizationKeys)
	local var27 = if fFlagBuildLocalization then useLocalization({
		empty = localizationStringsModule.VERSION_HISTORY_EMPTY,
		fallbackDescription = localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION,
		loadFailed = localizationStringsModule.VERSION_HISTORY_LOAD_FAILED,
		loading = localizationStringsModule.VERSION_HISTORY_LOADING,
		restoreFailed = localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
	}) else nil
	local var28 = if fFlagBuildLocalization then var27.restoreFailed else localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
	local var29 = if fFlagBuildLocalization then var27.fallbackDescription else localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION
	local var30 = reactModule.useMemo(function() --[[ line: 156 ]]
		-- upvalues: p19 (ref), placeVersionHistoryModule (copy)
		return p19.store or placeVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p19.store })
	local var31 = reactModule.useMemo(function() --[[ line: 159 ]]
		-- upvalues: var30 (ref), p19 (ref)
		return var30.getAndFetchHistory(p19.placeId)
	end, { var30, p19.placeId })
	local var32 = signalsReactModule.useSignalState(var31.data)
	local var33 = signalsReactModule.useSignalState(var31.status)
	local var34, var35 = reactModule.useState(false)
	local var36, var37 = reactModule.useState(nil)
	local var38 = useScrollToTopAfterRestoreModule()
	local var39 = signalsReactModule.useSignalState(reactModule.useCallback(function(p20) --[[ line: 167 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy), p19 (ref)
		return getPlaytestLoadingStoreModule(p20).getAgentStatusForPlaceId(p19.placeId)(p20) == "Loading"
	end, { p19.placeId }))
	local var40 = reactModule.useMemo(function() --[[ line: 172 ]]
		-- upvalues: mapHistoryToEntries (copy), var32 (ref), var26 (ref), var29 (ref)
		return mapHistoryToEntries(var32, var26, var29)
	end, { var32, var26, var29 })
	local var41 = if var36 ~= nil then if var33 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif var33 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #var40 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else var36
	
	return reactModule.createElement(versionHistoryBottomSheetModule, {
		isOpen = p19.isOpen,
		entries = var40,
		statusText = if fFlagBuildLocalization then if var41 == localizationStringsModule.VERSION_HISTORY_LOADING then var27.loading elseif var41 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then var27.loadFailed elseif var41 == localizationStringsModule.VERSION_HISTORY_EMPTY then var27.empty else var41 else var41,
		isRestoreDisabled = var34 or var39,
		onClose = p19.onClose,
		onRestore = reactModule.useCallback(function(p21) --[[ line: 180 ]]
			-- upvalues: var34 (ref), var39 (ref), var35 (ref), var37 (ref), rollbackPlaceWithRetryModule (copy), p19 (ref), fFlagEnableTeamTestLua (copy), fFlagBuildNoPublishOnRevertModule (copy), fFlagisPublishOnBuildRevertModule (copy), var38 (ref), var28 (ref)
			if var34 or var39 then
				return
			end
			var35(true)
			var37(nil)
			rollbackPlaceWithRetryModule(p19.placeId, p21.versionNumber, {
				debugSource = "version_history restore",
				note = { title = p21.noteTitle, description = p21.noteDescription },
				published = if fFlagEnableTeamTestLua then if fFlagBuildNoPublishOnRevertModule then false else true else fFlagisPublishOnBuildRevertModule
			}):andThen(function() --[[ line: 197 ]]
				-- upvalues: var38 (copy)
				var38.scrollToTopAfterRestore()
			end):catch(function(_) --[[ line: 200 ]]
				-- upvalues: var37 (copy), var28 (copy)
				var37(var28)
			end):finally(function() --[[ line: 203 ]]
				-- upvalues: var35 (copy)
				var35(false)
			end)
		end, {
			var34, var39, var28, var38, var30, p19.placeId
		}),
		scrollingFrameRef = var38.scrollingFrameRef,
		testId = p19.testId
	})
end