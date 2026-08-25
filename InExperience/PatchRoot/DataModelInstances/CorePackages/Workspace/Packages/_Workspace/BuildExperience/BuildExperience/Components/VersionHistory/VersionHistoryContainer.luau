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

local _ = function(p1, p2)
	-- upvalues: localizationStringsModule (ref)
	return p2:Format(if p1 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = p1 })
end

local function formatLocalizedCreatedDate(p1, p2, p3)
	-- upvalues: localizationStringsModule (ref)
	assert(type(p1) == "string" and p1 ~= "", "Place version createdTime must not be empty")
	local match, match_1, match_2 = string.match(p1, "^(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local var1 = if match_1 then tonumber(match_1) else nil
	local var2 = if match_2 then tonumber(match_2) else nil
	assert(match ~= nil and (var1 ~= nil and (var2 ~= nil and p2[var1] ~= nil)), `Place version createdTime must be an ISO date: {p1}`)
	
	return p3:Format(localizationStringsModule.VERSION_HISTORY_CREATED_DATE, { MONTH = p2[var1], DAY = var2, YEAR = match })
end

local function formatLocalizedBadge(p1, p2, p3)
	-- upvalues: localizationStringsModule (ref)
	if p2 == "published" then
		return p3:Format(localizationStringsModule.VERSION_HISTORY_PUBLISHED)
	elseif p2 == "previouslyPublished" then
		return p3:Format(localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED)
	elseif p2 == "restored" and p1.parentAssetVersionId ~= nil then
		local VERSION_HISTORY_RESTORED_BADGE = localizationStringsModule.VERSION_HISTORY_RESTORED_BADGE
		local t = {}
		local parentAssetVersionId = p1.parentAssetVersionId
		t.VERSION = p3:Format(if parentAssetVersionId < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = parentAssetVersionId })
		
		return p3:Format(VERSION_HISTORY_RESTORED_BADGE, t)
	end
	return if p2 == "autosaved" then p3:Format(localizationStringsModule.VERSION_HISTORY_AUTOSAVED) else nil
end

local function mapLocalizedVersionToEntry(p1, p2, p3, p4)
	-- upvalues: localizationStringsModule (ref), formatLocalizedCreatedDate (ref), versionHistoryUtilsModule (ref), formatLocalizedBadge (ref)
	local version = p1.version
	local var1 = assert(if type(version) == "number" then version elseif type(version) == "string" then tonumber(version) else nil, `Place version must be numeric: {p1.version}`)
	local badgeKind = versionHistoryUtilsModule.getBadgeKind(p1)
	
	return {
		id = tostring(var1),
		versionNumber = var1,
		versionLabel = p4:Format(localizationStringsModule.VERSION_HISTORY_VERSION_LABEL, {
			VERSION = p4:Format(if var1 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = var1 }),
			CREATED_DATE = formatLocalizedCreatedDate(p1.createdTime, p2, p4)
		}),
		title = if p1.title == nil or p1.title == "" then p4:Format(localizationStringsModule.VERSION_HISTORY_VERSION_TITLE, { VERSION = var1 }) else p1.title,
		description = if p1.description == nil or p1.description == "" then p3 else p1.description,
		noteTitle = p1.title,
		noteDescription = p1.description,
		badgeText = formatLocalizedBadge(p1, badgeKind, p4),
		isAutosaved = badgeKind == "autosaved"
	}
end

local function mapLocalizedHistoryToEntries(p1, p2, p3, p4)
	-- upvalues: mapLocalizedVersionToEntry (ref)
	if p1 == nil or p1.placeVersions == nil then
		return {}
	end
	local t = {}
	
	for i, v in p1.placeVersions do
		table.insert(t, mapLocalizedVersionToEntry(v, p2, p3, p4))
	end
	return t
end

local _ = function(p1, p2, p3)
	-- upvalues: dataStatus (ref), localizationStringsModule (ref)
	return if p3 == nil then if p1 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif p1 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #p2 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else p3
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: localizationStringsModule (ref)
	return if p1 == localizationStringsModule.VERSION_HISTORY_LOADING then p2 elseif p1 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then p3 elseif p1 == localizationStringsModule.VERSION_HISTORY_EMPTY then p4 else p1
end

local function useAgentRollbackRestore(p1, p2, p3)
	-- upvalues: reactModule (ref), getAgentRollbackRequestStoreModule (ref), signalsReactModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useRef(false)
	local var4 = getAgentRollbackRequestStoreModule(false)
	local isPendingForPlaceId = var4.getIsPendingForPlaceId(p1.placeId)
	local var5 = signalsReactModule.useSignalState(isPendingForPlaceId)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		var3.current = true
		
		return function()
			-- upvalues: var3 (copy)
			var3.current = false
		end
	end, {})
	
	return {
		clearError = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(nil)
		end, {}),
		errorText = var1,
		isPending = var5,
		onRestore = reactModule.useCallback(function(p1)
			-- upvalues: isPendingForPlaceId (ref), p3 (ref), var2 (ref), var4 (ref), p1 (ref), var3 (ref), p2 (ref)
			if isPendingForPlaceId(false) or p3 then
				return
			end
			var2(nil)
			local var1 = var4.request({ universeId = p1.universeId, placeId = p1.placeId }, {
				versionNumber = p1.versionNumber,
				noteTitle = p1.noteTitle,
				noteDescription = p1.noteDescription
			})
			var1:catch(function()
				-- upvalues: var3 (copy), var2 (copy), p2 (copy)
				if var3.current then
					var2(p2)
				end
			end)
			
			return var1
		end, {
			p3, isPendingForPlaceId, var4, p1.universeId, p1.placeId, p2
		})
	}
end

return function(p1)
	-- upvalues: useLocalization (ref), dateHelper (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationModule (ref), placeVersionHistoryModule (ref), signalsReactModule (ref), useScrollToTopAfterRestoreModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildAgentRollbackModule (ref), useAgentRollbackRestore (ref), rollbackPlaceWithRetryModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildNoPublishOnRevertModule (ref), fFlagisPublishOnBuildRevertModule (ref), mapLocalizedHistoryToEntries (ref), mapHistoryToEntries (ref), dataStatus (ref), versionHistoryBottomSheetModule (ref), var1 (ref)
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
		-- upvalues: p1 (ref), placeVersionHistoryModule (copy)
		return p1.store or placeVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p1.store })
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), p1 (ref)
		return var4.getAndFetchHistory(p1.placeId)
	end, { var4, p1.placeId })
	local var6 = signalsReactModule.useSignalState(var5.data)
	local var7 = signalsReactModule.useSignalState(var5.status)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState(nil)
	local var12 = useScrollToTopAfterRestoreModule()
	local var13 = signalsReactModule.useSignalState(reactModule.useCallback(function(p1)
		-- upvalues: getPlaytestLoadingStoreModule (copy), p1 (ref)
		return getPlaytestLoadingStoreModule(p1).getAgentStatusForPlaceId(p1.placeId)(p1) == "Loading"
	end, { p1.placeId }))
	local var14 = if fFlagBuildAgentRollbackModule then useAgentRollbackRestore(p1, VERSION_HISTORY_RESTORE_FAILED, var13) else nil
	local var15 = reactModule.useCallback(function(p1)
		-- upvalues: var8 (ref), var13 (ref), var9 (ref), var11 (ref), rollbackPlaceWithRetryModule (copy), p1 (ref), fFlagEnableTeamTestLua (copy), fFlagBuildNoPublishOnRevertModule (copy), fFlagisPublishOnBuildRevertModule (copy), var12 (ref), VERSION_HISTORY_RESTORE_FAILED (write)
		if var8 or var13 then
			return
		end
		var9(true)
		var11(nil)
		rollbackPlaceWithRetryModule(p1.placeId, p1.versionNumber, {
			debugSource = "version_history restore",
			note = { title = p1.noteTitle, description = p1.noteDescription },
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
		var8,
		var13,
		p1.placeId,
		VERSION_HISTORY_RESTORE_FAILED,
		var12
	})
	local var1 = reactModule.useMemo(function()
		-- upvalues: fFlagBuildLocalization (copy), mapLocalizedHistoryToEntries (copy), var6 (ref), var1 (ref), VERSION_HISTORY_FALLBACK_DESCRIPTION (write), var3 (ref), mapHistoryToEntries (copy)
		return if fFlagBuildLocalization then mapLocalizedHistoryToEntries(var6, var1, VERSION_HISTORY_FALLBACK_DESCRIPTION, var3) else mapHistoryToEntries(var6, var1, VERSION_HISTORY_FALLBACK_DESCRIPTION)
	end, {
		var6,
		var1,
		VERSION_HISTORY_FALLBACK_DESCRIPTION,
		var3,
		if fFlagBuildLocalization then var2[localizationModule.RobloxLocaleIdKey] else nil
	})
	local var1 = if fFlagBuildAgentRollbackModule then nil else var10
	local var2 = if var1 ~= nil then if var7 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif var7 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #var1 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else var1
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		BottomSheet = reactModule.createElement(versionHistoryBottomSheetModule, {
			isOpen = p1.isOpen,
			entries = var1,
			statusText = if fFlagBuildLocalization then if var2 == localizationStringsModule.VERSION_HISTORY_LOADING then var2.loading elseif var2 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then var2.loadFailed elseif var2 == localizationStringsModule.VERSION_HISTORY_EMPTY then var2.empty else var2 else var2,
			isRestoreDisabled = if fFlagBuildAgentRollbackModule then var14.isPending or var13 else var8 or var13,
			onClose = p1.onClose,
			onRestore = if fFlagBuildAgentRollbackModule then var14.onRestore else var15,
			onRestoreStarted = if fFlagBuildAgentRollbackModule then p1.onAgentRollbackStarted else nil,
			scrollingFrameRef = var12.scrollingFrameRef,
			testId = p1.testId
		}),
		RestoreErrorSnackbar = if fFlagBuildAgentRollbackModule and var14.errorText ~= nil then reactModule.createElement(var1, { title = var14.errorText, onClose = var14.clearError }) else nil
	})
end