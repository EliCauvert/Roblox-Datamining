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
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagisPublishOnBuildRevertModule = require(buildExperience.Flags.FFlagisPublishOnBuildRevert)
local getAgentRollbackRequestStoreModule = require(buildExperience.Stores.GetAgentRollbackRequestStore)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local rollbackPlaceWithRetryModule = require(buildExperience.utils.rollbackPlaceWithRetry)
local var1 = if fFlagBuildAgentRollbackModule then require(script.Parent.AgentRollbackSnackbar) else nil
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
	local var2 = if match_1 then tonumber(match_1) else nil
	local var3 = if match_2 then tonumber(match_2) else nil
	assert(match ~= nil and (var2 ~= nil and (var3 ~= nil and p2[var2] ~= nil)), `Place version createdTime must be an ISO date: {p1}`)
	
	return localizationStringsModule.formatVersionHistoryCreatedDate(p2[var2], var3, match)
end

local function mapVersionToEntry(p1, p2, p3)
	-- upvalues: localizationStringsModule (ref), formatCreatedDate (ref), versionHistoryUtilsModule (ref)
	local version = p1.version
	local var2 = assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p1.version}`)
	
	return {
		id = tostring(var2),
		versionNumber = var2,
		versionLabel = localizationStringsModule.formatVersionHistoryVersionLabel(var2, formatCreatedDate(p1.createdTime, p2)),
		title = if p1.title == nil or p1.title == "" then localizationStringsModule.formatVersionHistoryVersionTitle(var2) else p1.title,
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
	local var2 = if match_1 then tonumber(match_1) else nil
	local var3 = if match_2 then tonumber(match_2) else nil
	assert(match ~= nil and (var2 ~= nil and (var3 ~= nil and p5[var2] ~= nil)), `Place version createdTime must be an ISO date: {p4}`)
	
	return p6:Format(localizationStringsModule.VERSION_HISTORY_CREATED_DATE, { MONTH = p5[var2], DAY = var3, YEAR = match })
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
	local var2 = assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p4.version}`)
	local badgeKind = versionHistoryUtilsModule.getBadgeKind(p4)
	
	return {
		id = tostring(var2),
		versionNumber = var2,
		versionLabel = p7:Format(localizationStringsModule.VERSION_HISTORY_VERSION_LABEL, {
			VERSION = p7:Format(if var2 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = var2 }),
			CREATED_DATE = formatLocalizedCreatedDate(p4.createdTime, p5, p7)
		}),
		title = if p4.title == nil or p4.title == "" then p7:Format(localizationStringsModule.VERSION_HISTORY_VERSION_TITLE, { VERSION = var2 }) else p4.title,
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

local function useAgentRollbackRestore(p8, p9, p10)
	-- upvalues: reactModule (ref), getAgentRollbackRequestStoreModule (ref), signalsReactModule (ref)
	local var2, var3 = reactModule.useState(nil)
	local var4 = reactModule.useRef(false)
	local var5 = getAgentRollbackRequestStoreModule(false)
	local isPendingForPlaceId = var5.getIsPendingForPlaceId(p8.placeId)
	local var6 = signalsReactModule.useSignalState(isPendingForPlaceId)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		var4.current = true
		
		return function()
			-- upvalues: var4 (copy)
			var4.current = false
		end
	end, {})
	
	return {
		clearError = reactModule.useCallback(function()
			-- upvalues: var3 (ref)
			var3(nil)
		end, {}),
		errorText = var2,
		isPending = var6,
		onRestore = reactModule.useCallback(function(p11)
			-- upvalues: isPendingForPlaceId (ref), p10 (ref), var3 (ref), var5 (ref), p11 (ref), var4 (ref), p9 (ref)
			if isPendingForPlaceId(false) or p10 then
				return
			end
			var3(nil)
			local var7 = var5.request({ universeId = p11.universeId, placeId = p11.placeId }, {
				versionNumber = p11.versionNumber,
				noteTitle = p11.noteTitle,
				noteDescription = p11.noteDescription
			})
			var7:catch(function()
				-- upvalues: var4 (copy), var3 (copy), p9 (copy)
				if var4.current then
					var3(p9)
				end
			end)
			
			return var7
		end, {
			p10, isPendingForPlaceId, var5, p8.universeId, p8.placeId, p9
		})
	}
end

return function(p8)
	-- upvalues: useLocalization (ref), dateHelper (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationModule (ref), placeVersionHistoryModule (ref), signalsReactModule (ref), useScrollToTopAfterRestoreModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildAgentRollbackModule (ref), useAgentRollbackRestore (ref), rollbackPlaceWithRetryModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildNoPublishOnRevertModule (ref), fFlagisPublishOnBuildRevertModule (ref), mapLocalizedHistoryToEntries (ref), mapHistoryToEntries (ref), dataStatus (ref), versionHistoryBottomSheetModule (ref), var1 (ref)
	local VERSION_HISTORY_RESTORE_FAILED, VERSION_HISTORY_FALLBACK_DESCRIPTION
	local var2 = useLocalization(dateHelper.MonthsLocalizationKeys)
	local var3 = if fFlagBuildLocalization then useLocalization({
		empty = localizationStringsModule.VERSION_HISTORY_EMPTY,
		fallbackDescription = localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION,
		loadFailed = localizationStringsModule.VERSION_HISTORY_LOAD_FAILED,
		loading = localizationStringsModule.VERSION_HISTORY_LOADING,
		restoreFailed = localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
	}) else nil
	local var4 = if fFlagBuildLocalization then reactModule.useContext(localizationModule.LocalizationRoactContext) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		VERSION_HISTORY_RESTORE_FAILED = var3.restoreFailed
		VERSION_HISTORY_FALLBACK_DESCRIPTION = var3.fallbackDescription
	else
		VERSION_HISTORY_RESTORE_FAILED = localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
		VERSION_HISTORY_FALLBACK_DESCRIPTION = localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION
	end
	local var5 = reactModule.useMemo(function()
		-- upvalues: p8 (ref), placeVersionHistoryModule (copy)
		return p8.store or placeVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p8.store })
	local var6 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), p8 (ref)
		return var5.getAndFetchHistory(p8.placeId)
	end, { var5, p8.placeId })
	local var7 = signalsReactModule.useSignalState(var6.data)
	local var8 = signalsReactModule.useSignalState(var6.status)
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(nil)
	local var13 = useScrollToTopAfterRestoreModule()
	local var14 = signalsReactModule.useSignalState(reactModule.useCallback(function(p9)
		-- upvalues: getPlaytestLoadingStoreModule (copy), p9 (ref)
		return getPlaytestLoadingStoreModule(p9).getAgentStatusForPlaceId(p9.placeId)(p9) == "Loading"
	end, { p8.placeId }))
	local var15 = if fFlagBuildAgentRollbackModule then useAgentRollbackRestore(p8, VERSION_HISTORY_RESTORE_FAILED, var14) else nil
	local var16 = reactModule.useCallback(function(p9)
		-- upvalues: var9 (ref), var14 (ref), var10 (ref), var12 (ref), rollbackPlaceWithRetryModule (copy), p9 (ref), fFlagEnableTeamTestLua (copy), fFlagBuildNoPublishOnRevertModule (copy), fFlagisPublishOnBuildRevertModule (copy), var13 (ref), VERSION_HISTORY_RESTORE_FAILED (write)
		if var9 or var14 then
			return
		end
		var10(true)
		var12(nil)
		rollbackPlaceWithRetryModule(p9.placeId, p9.versionNumber, {
			debugSource = "version_history restore",
			note = { title = p9.noteTitle, description = p9.noteDescription },
			published = if fFlagEnableTeamTestLua then if fFlagBuildNoPublishOnRevertModule then false else true else fFlagisPublishOnBuildRevertModule
		}):andThen(function()
			-- upvalues: var13 (copy)
			var13.scrollToTopAfterRestore()
		end):catch(function(_)
			-- upvalues: var12 (copy), VERSION_HISTORY_RESTORE_FAILED (copy)
			var12(VERSION_HISTORY_RESTORE_FAILED)
		end):finally(function()
			-- upvalues: var10 (copy)
			var10(false)
		end)
	end, {
		var9,
		var14,
		p8.placeId,
		VERSION_HISTORY_RESTORE_FAILED,
		var13
	})
	local var2 = reactModule.useMemo(function()
		-- upvalues: fFlagBuildLocalization (copy), mapLocalizedHistoryToEntries (copy), var7 (ref), var2 (ref), VERSION_HISTORY_FALLBACK_DESCRIPTION (write), var4 (ref), mapHistoryToEntries (copy)
		return if fFlagBuildLocalization then mapLocalizedHistoryToEntries(var7, var2, VERSION_HISTORY_FALLBACK_DESCRIPTION, var4) else mapHistoryToEntries(var7, var2, VERSION_HISTORY_FALLBACK_DESCRIPTION)
	end, {
		var7,
		var2,
		VERSION_HISTORY_FALLBACK_DESCRIPTION,
		var4,
		if fFlagBuildLocalization then var3[localizationModule.RobloxLocaleIdKey] else nil
	})
	local var2 = if fFlagBuildAgentRollbackModule then nil else var11
	local var3 = if var2 ~= nil then if var8 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif var8 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #var2 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else var2
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		BottomSheet = reactModule.createElement(versionHistoryBottomSheetModule, {
			isOpen = p8.isOpen,
			entries = var2,
			statusText = if fFlagBuildLocalization then if var3 == localizationStringsModule.VERSION_HISTORY_LOADING then var3.loading elseif var3 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then var3.loadFailed elseif var3 == localizationStringsModule.VERSION_HISTORY_EMPTY then var3.empty else var3 else var3,
			isRestoreDisabled = if fFlagBuildAgentRollbackModule then var15.isPending or var14 else var9 or var14,
			onClose = p8.onClose,
			onRestore = if fFlagBuildAgentRollbackModule then var15.onRestore else var16,
			onRestoreStarted = if fFlagBuildAgentRollbackModule then p8.onAgentRollbackStarted else nil,
			scrollingFrameRef = var13.scrollingFrameRef,
			testId = p8.testId
		}),
		RestoreErrorSnackbar = if fFlagBuildAgentRollbackModule and var15.errorText ~= nil then reactModule.createElement(var2, { title = var15.errorText, onClose = var15.clearError }) else nil
	})
end