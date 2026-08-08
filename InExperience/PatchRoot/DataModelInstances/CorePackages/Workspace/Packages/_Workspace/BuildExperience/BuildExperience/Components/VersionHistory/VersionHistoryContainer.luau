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
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local useLocalization = localizationModule.Hooks.useLocalization

local function _(p0) --[[ line: 38 | named "toNumber" ]]
	return if type(p0) == "number" then p0 elseif type(p0) == "string" then tonumber(p0) else nil
end

local _ = function(p1) --[[ line: 48 | named "getVersionNumber" ]]
	local version = p1.version
	
	return assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p1.version}`)
end

local _ = function(p2, p3) --[[ line: 52 | named "getRequiredString" ]]
	assert(type(p2) == "string" and p2 ~= "", `Place version {p3} must not be empty`)
	
	return p2
end

local function formatCreatedDate(p4, p5) --[[ line: 57 ]]
	-- upvalues: localizationStringsModule (ref)
	assert(type(p4) == "string" and p4 ~= "", "Place version createdTime must not be empty")
	local match, match_1, match_2 = string.match(p4, "^(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local var21 = if match_1 then tonumber(match_1) else nil
	local var22 = if match_2 then tonumber(match_2) else nil
	assert(match ~= nil and (var21 ~= nil and (var22 ~= nil and p5[var21] ~= nil)), `Place version createdTime must be an ISO date: {p4}`)
	
	return localizationStringsModule.formatVersionHistoryCreatedDate(p5[var21], var22, match)
end

local function mapVersionToEntry(p6, p7) --[[ line: 70 ]]
	-- upvalues: localizationStringsModule (ref), formatCreatedDate (ref), versionHistoryUtilsModule (ref)
	local version = p6.version
	local var23 = assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p6.version}`)
	
	return {
		id = tostring(var23),
		versionNumber = var23,
		versionLabel = localizationStringsModule.formatVersionHistoryVersionLabel(var23, formatCreatedDate(p6.createdTime, p7)),
		title = if p6.title == nil or p6.title == "" then localizationStringsModule.formatVersionHistoryVersionTitle(var23) else p6.title,
		description = if p6.description == nil or p6.description == "" then localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION else p6.description,
		noteTitle = p6.title,
		noteDescription = p6.description,
		badgeText = versionHistoryUtilsModule.getBadgeText(p6)
	}
end

local function mapHistoryToEntries(p8, p9) --[[ line: 92 ]]
	-- upvalues: mapVersionToEntry (ref)
	if p8 == nil or p8.placeVersions == nil then
		return {}
	end
	local t = {}
	
	for i, v in p8.placeVersions do
		table.insert(t, mapVersionToEntry(v, p9))
	end
	return t
end

local _ = function(p10, p11, p12) --[[ line: 107 | named "getStatusText" ]]
	-- upvalues: dataStatus (ref), localizationStringsModule (ref)
	return if p12 == nil then if p10 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif p10 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #p11 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else p12
end

return function(p13) --[[ line: 121 | named "VersionHistoryContainer" ]]
	-- upvalues: useLocalization (ref), dateHelper (ref), reactModule (ref), placeVersionHistoryModule (ref), signalsReactModule (ref), useScrollToTopAfterRestoreModule (ref), getPlaytestLoadingStoreModule (ref), mapHistoryToEntries (ref), dataStatus (ref), localizationStringsModule (ref), rollbackPlaceWithRetryModule (ref), fFlagEnableTeamTestLua (ref), fFlagisPublishOnBuildRevertModule (ref), versionHistoryBottomSheetModule (ref)
	local var25 = useLocalization(dateHelper.MonthsLocalizationKeys)
	local var26 = reactModule.useMemo(function() --[[ line: 123 ]]
		-- upvalues: p13 (ref), placeVersionHistoryModule (copy)
		return p13.store or placeVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p13.store })
	local var27 = reactModule.useMemo(function() --[[ line: 126 ]]
		-- upvalues: var26 (ref), p13 (ref)
		return var26.getAndFetchHistory(p13.placeId)
	end, { var26, p13.placeId })
	local var28 = signalsReactModule.useSignalState(var27.data)
	local var29 = signalsReactModule.useSignalState(var27.status)
	local var30, var31 = reactModule.useState(false)
	local var32, var33 = reactModule.useState(nil)
	local var34 = useScrollToTopAfterRestoreModule()
	local var35 = signalsReactModule.useSignalState(reactModule.useCallback(function(p14) --[[ line: 134 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy), p13 (ref)
		return getPlaytestLoadingStoreModule(p14).getAgentStatusForPlaceId(p13.placeId)(p14) == "Loading"
	end, { p13.placeId }))
	local var36 = reactModule.useMemo(function() --[[ line: 139 ]]
		-- upvalues: mapHistoryToEntries (copy), var28 (ref), var25 (ref)
		return mapHistoryToEntries(var28, var25)
	end, { var28, var25 })
	
	return reactModule.createElement(versionHistoryBottomSheetModule, {
		isOpen = p13.isOpen,
		entries = var36,
		statusText = if var32 ~= nil then if var29 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif var29 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #var36 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else var32,
		isRestoreDisabled = var30 or var35,
		onClose = p13.onClose,
		onRestore = reactModule.useCallback(function(p15) --[[ line: 144 ]]
			-- upvalues: var30 (ref), var35 (ref), var31 (ref), var33 (ref), rollbackPlaceWithRetryModule (copy), p13 (ref), fFlagEnableTeamTestLua (copy), fFlagisPublishOnBuildRevertModule (copy), var34 (ref), localizationStringsModule (copy)
			if var30 or var35 then
				return
			end
			var31(true)
			var33(nil)
			rollbackPlaceWithRetryModule(p13.placeId, p15.versionNumber, {
				debugSource = "version_history restore",
				note = { title = p15.noteTitle, description = p15.noteDescription },
				published = if fFlagEnableTeamTestLua then true else fFlagisPublishOnBuildRevertModule
			}):andThen(function() --[[ line: 159 ]]
				-- upvalues: var34 (copy)
				var34.scrollToTopAfterRestore()
			end):catch(function(_) --[[ line: 162 ]]
				-- upvalues: var33 (copy), localizationStringsModule (copy)
				var33(localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED)
			end):finally(function() --[[ line: 165 ]]
				-- upvalues: var31 (copy)
				var31(false)
			end)
		end, {
			var30,
			var35,
			var34,
			var26,
			p13.placeId
		}),
		scrollingFrameRef = var34.scrollingFrameRef,
		testId = p13.testId
	})
end