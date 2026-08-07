local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local localizationModule = require(parent.Localization)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local reactModule = require(parent.React)
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
local useLocalization = localizationModule.Hooks.useLocalization

local function _(p0) --[[ line: 36 | named "toNumber" ]]
	return if type(p0) == "number" then p0 elseif type(p0) == "string" then tonumber(p0) else nil
end

local _ = function(p1) --[[ line: 46 | named "getVersionNumber" ]]
	local version = p1.version
	
	return assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p1.version}`)
end

local _ = function(p2, p3) --[[ line: 50 | named "getRequiredString" ]]
	assert(type(p2) == "string" and p2 ~= "", `Place version {p3} must not be empty`)
	
	return p2
end

local function formatCreatedDate(p4, p5) --[[ line: 55 ]]
	-- upvalues: localizationStringsModule (ref)
	assert(type(p4) == "string" and p4 ~= "", "Place version createdTime must not be empty")
	local match, match_1, match_2 = string.match(p4, "^(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local var20 = if match_1 then tonumber(match_1) else nil
	local var21 = if match_2 then tonumber(match_2) else nil
	assert(match ~= nil and (var20 ~= nil and (var21 ~= nil and p5[var20] ~= nil)), `Place version createdTime must be an ISO date: {p4}`)
	
	return localizationStringsModule.formatVersionHistoryCreatedDate(p5[var20], var21, match)
end

local function mapVersionToEntry(p6, p7) --[[ line: 68 ]]
	-- upvalues: localizationStringsModule (ref), formatCreatedDate (ref), versionHistoryUtilsModule (ref)
	local version = p6.version
	local var22 = assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p6.version}`)
	
	return {
		id = tostring(var22),
		versionNumber = var22,
		versionLabel = localizationStringsModule.formatVersionHistoryVersionLabel(var22, formatCreatedDate(p6.createdTime, p7)),
		title = if p6.title == nil or p6.title == "" then localizationStringsModule.formatVersionHistoryVersionTitle(var22) else p6.title,
		description = if p6.description == nil or p6.description == "" then localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION else p6.description,
		noteTitle = p6.title,
		noteDescription = p6.description,
		badgeText = versionHistoryUtilsModule.getBadgeText(p6)
	}
end

local function mapHistoryToEntries(p8, p9) --[[ line: 90 ]]
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

local _ = function(p10, p11, p12) --[[ line: 105 | named "getStatusText" ]]
	-- upvalues: dataStatus (ref), localizationStringsModule (ref)
	return if p12 == nil then if p10 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif p10 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #p11 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else p12
end

return function(p13) --[[ line: 119 | named "VersionHistoryContainer" ]]
	-- upvalues: useLocalization (ref), dateHelper (ref), reactModule (ref), placeVersionHistoryModule (ref), signalsReactModule (ref), useScrollToTopAfterRestoreModule (ref), getPlaytestLoadingStoreModule (ref), mapHistoryToEntries (ref), dataStatus (ref), localizationStringsModule (ref), rollbackPlaceWithRetryModule (ref), fFlagisPublishOnBuildRevertModule (ref), versionHistoryBottomSheetModule (ref)
	local var24 = useLocalization(dateHelper.MonthsLocalizationKeys)
	local var25 = reactModule.useMemo(function() --[[ line: 121 ]]
		-- upvalues: p13 (ref), placeVersionHistoryModule (copy)
		return p13.store or placeVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p13.store })
	local var26 = reactModule.useMemo(function() --[[ line: 124 ]]
		-- upvalues: var25 (ref), p13 (ref)
		return var25.getAndFetchHistory(p13.placeId)
	end, { var25, p13.placeId })
	local var27 = signalsReactModule.useSignalState(var26.data)
	local var28 = signalsReactModule.useSignalState(var26.status)
	local var29, var30 = reactModule.useState(false)
	local var31, var32 = reactModule.useState(nil)
	local var33 = useScrollToTopAfterRestoreModule()
	local var34 = signalsReactModule.useSignalState(reactModule.useCallback(function(p14) --[[ line: 132 ]]
		-- upvalues: getPlaytestLoadingStoreModule (copy), p13 (ref)
		return getPlaytestLoadingStoreModule(p14).getAgentStatusForPlaceId(p13.placeId)(p14) == "Loading"
	end, { p13.placeId }))
	local var35 = reactModule.useMemo(function() --[[ line: 137 ]]
		-- upvalues: mapHistoryToEntries (copy), var27 (ref), var24 (ref)
		return mapHistoryToEntries(var27, var24)
	end, { var27, var24 })
	
	return reactModule.createElement(versionHistoryBottomSheetModule, {
		isOpen = p13.isOpen,
		entries = var35,
		statusText = if var31 ~= nil then if var28 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif var28 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #var35 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else var31,
		isRestoreDisabled = var29 or var34,
		onClose = p13.onClose,
		onRestore = reactModule.useCallback(function(p15) --[[ line: 142 ]]
			-- upvalues: var29 (ref), var34 (ref), var30 (ref), var32 (ref), rollbackPlaceWithRetryModule (copy), p13 (ref), fFlagisPublishOnBuildRevertModule (copy), var33 (ref), localizationStringsModule (copy)
			if var29 or var34 then
				return
			end
			var30(true)
			var32(nil)
			rollbackPlaceWithRetryModule(p13.placeId, p15.versionNumber, {
				debugSource = "version_history restore",
				note = { title = p15.noteTitle, description = p15.noteDescription },
				published = fFlagisPublishOnBuildRevertModule
			}):andThen(function() --[[ line: 157 ]]
				-- upvalues: var33 (copy)
				var33.scrollToTopAfterRestore()
			end):catch(function(_) --[[ line: 160 ]]
				-- upvalues: var32 (copy), localizationStringsModule (copy)
				var32(localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED)
			end):finally(function() --[[ line: 163 ]]
				-- upvalues: var30 (copy)
				var30(false)
			end)
		end, {
			var29,
			var34,
			var33,
			var25,
			p13.placeId
		}),
		scrollingFrameRef = var33.scrollingFrameRef,
		testId = p13.testId
	})
end