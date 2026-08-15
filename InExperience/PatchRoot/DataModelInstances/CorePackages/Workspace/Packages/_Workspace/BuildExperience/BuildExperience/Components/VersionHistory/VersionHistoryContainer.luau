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
local fFlagBuildNoPublishOnRevertModule = require(buildExperience.Flags.FFlagBuildNoPublishOnRevert)
local useLocalization = localizationModule.Hooks.useLocalization

local function _(p0) --[[ line: 39 | named "toNumber" ]]
	return if type(p0) == "number" then p0 elseif type(p0) == "string" then tonumber(p0) else nil
end

local _ = function(p1) --[[ line: 49 | named "getVersionNumber" ]]
	local version = p1.version
	
	return assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p1.version}`)
end

local _ = function(p2, p3) --[[ line: 53 | named "getRequiredString" ]]
	assert(type(p2) == "string" and p2 ~= "", `Place version {p3} must not be empty`)
	
	return p2
end

local function formatCreatedDate(p4, p5) --[[ line: 58 ]]
	-- upvalues: localizationStringsModule (ref)
	assert(type(p4) == "string" and p4 ~= "", "Place version createdTime must not be empty")
	local match, match_1, match_2 = string.match(p4, "^(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local var22 = if match_1 then tonumber(match_1) else nil
	local var23 = if match_2 then tonumber(match_2) else nil
	assert(match ~= nil and (var22 ~= nil and (var23 ~= nil and p5[var22] ~= nil)), `Place version createdTime must be an ISO date: {p4}`)
	
	return localizationStringsModule.formatVersionHistoryCreatedDate(p5[var22], var23, match)
end

local function mapVersionToEntry(p6, p7) --[[ line: 71 ]]
	-- upvalues: localizationStringsModule (ref), formatCreatedDate (ref), versionHistoryUtilsModule (ref)
	local version = p6.version
	local var24 = assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p6.version}`)
	
	return {
		id = tostring(var24),
		versionNumber = var24,
		versionLabel = localizationStringsModule.formatVersionHistoryVersionLabel(var24, formatCreatedDate(p6.createdTime, p7)),
		title = if p6.title == nil or p6.title == "" then localizationStringsModule.formatVersionHistoryVersionTitle(var24) else p6.title,
		description = if p6.description == nil or p6.description == "" then localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION else p6.description,
		noteTitle = p6.title,
		noteDescription = p6.description,
		badgeText = versionHistoryUtilsModule.getBadgeText(p6)
	}
end

local function mapHistoryToEntries(p8, p9) --[[ line: 93 ]]
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

local _ = function(p10, p11, p12) --[[ line: 108 | named "getStatusText" ]]
	-- upvalues: dataStatus (ref), localizationStringsModule (ref)
	return if p12 == nil then if p10 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif p10 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #p11 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else p12
end

return function(p13) --[[ line: 122 | named "VersionHistoryContainer" ]]
	-- upvalues: useLocalization (ref), dateHelper (ref), reactModule (ref), placeVersionHistoryModule (ref), signalsReactModule (ref), useScrollToTopAfterRestoreModule (ref), getPlaytestLoadingStoreModule (ref), mapHistoryToEntries (ref), dataStatus (ref), localizationStringsModule (ref), rollbackPlaceWithRetryModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildNoPublishOnRevertModule (ref), fFlagisPublishOnBuildRevertModule (ref), versionHistoryBottomSheetModule (ref)
	local var26 = useLocalization(dateHelper.MonthsLocalizationKeys)
	local var27 = reactModule.useMemo(function() --[[ line: 124 ]]
		-- upvalues: p13 (ref), placeVersionHistoryModule (copy)
		return p13.store or placeVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p13.store })
	local var28 = reactModule.useMemo(function() --[[ line: 127 ]]
		-- upvalues: var27 (ref), p13 (ref)
		return var27.getAndFetchHistory(p13.placeId)
	end, { var27, p13.placeId })
	local var29 = signalsReactModule.useSignalState(var28.data)
	local var30 = signalsReactModule.useSignalState(var28.status)
	local var31, var32 = reactModule.useState(false)
	local var33, var34 = reactModule.useState(nil)
	local var35 = useScrollToTopAfterRestoreModule()
	local var36 = signalsReactModule.useSignalState(reactModule.useCallback(function(p14) --[[ line: 135 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy), p13 (ref)
		return getPlaytestLoadingStoreModule(p14).getAgentStatusForPlaceId(p13.placeId)(p14) == "Loading"
	end, { p13.placeId }))
	local var37 = reactModule.useMemo(function() --[[ line: 140 ]]
		-- upvalues: mapHistoryToEntries (copy), var29 (ref), var26 (ref)
		return mapHistoryToEntries(var29, var26)
	end, { var29, var26 })
	
	return reactModule.createElement(versionHistoryBottomSheetModule, {
		isOpen = p13.isOpen,
		entries = var37,
		statusText = if var33 ~= nil then if var30 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif var30 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #var37 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else var33,
		isRestoreDisabled = var31 or var36,
		onClose = p13.onClose,
		onRestore = reactModule.useCallback(function(p15) --[[ line: 145 ]]
			-- upvalues: var31 (ref), var36 (ref), var32 (ref), var34 (ref), rollbackPlaceWithRetryModule (copy), p13 (ref), fFlagEnableTeamTestLua (copy), fFlagBuildNoPublishOnRevertModule (copy), fFlagisPublishOnBuildRevertModule (copy), var35 (ref), localizationStringsModule (copy)
			if var31 or var36 then
				return
			end
			var32(true)
			var34(nil)
			rollbackPlaceWithRetryModule(p13.placeId, p15.versionNumber, {
				debugSource = "version_history restore",
				note = { title = p15.noteTitle, description = p15.noteDescription },
				published = if fFlagEnableTeamTestLua then if fFlagBuildNoPublishOnRevertModule then false else true else fFlagisPublishOnBuildRevertModule
			}):andThen(function() --[[ line: 162 ]]
				-- upvalues: var35 (copy)
				var35.scrollToTopAfterRestore()
			end):catch(function(_) --[[ line: 165 ]]
				-- upvalues: var34 (copy), localizationStringsModule (copy)
				var34(localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED)
			end):finally(function() --[[ line: 168 ]]
				-- upvalues: var32 (copy)
				var32(false)
			end)
		end, {
			var31,
			var36,
			var35,
			var27,
			p13.placeId
		}),
		scrollingFrameRef = var35.scrollingFrameRef,
		testId = p13.testId
	})
end