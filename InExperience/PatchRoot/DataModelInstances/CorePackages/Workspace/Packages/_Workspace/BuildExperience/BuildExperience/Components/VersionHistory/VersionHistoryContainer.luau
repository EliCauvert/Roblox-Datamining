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
local fFlagBuildVersionHistoryUpdatesModule = require(buildExperience.Flags.FFlagBuildVersionHistoryUpdates)
local fFlagisPublishOnBuildRevertModule = require(buildExperience.Flags.FFlagisPublishOnBuildRevert)
local getAgentRollbackRequestStoreModule = require(buildExperience.Stores.GetAgentRollbackRequestStore)
local getPlaytestLoadingStoreModule = require(buildExperience.Stores.GetPlaytestLoadingStore)
local rollbackPlaceWithRetryModule = require(buildExperience.utils.rollbackPlaceWithRetry)
local var1 = if fFlagBuildAgentRollbackModule then require(script.Parent.AgentRollbackSnackbar) else nil
local useLiveVersionCardViewModelModule = require(script.Parent.LiveVersionCard.useLiveVersionCardViewModel)
local versionHistoryBottomSheetModule = require(script.Parent.VersionHistoryBottomSheet)
local versionHistoryUtilsModule = require(script.Parent.VersionHistoryUtils)
local useScrollToTopAfterRestoreModule = require(script.Parent.useScrollToTopAfterRestore)
local dataStatus = dataHydrationModule.DataStatus
local dateHelper = timeModule.DateHelper
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local fFlagBuildNoPublishOnRevertModule = require(buildExperience.Flags.FFlagBuildNoPublishOnRevert)
local useLocalization = localizationModule.Hooks.useLocalization

local function _(p1, p2)
	-- upvalues: versionHistoryUtilsModule (ref), localizationStringsModule (ref)
	local createdDateParts, createdDateParts_1, createdDateParts_2 = versionHistoryUtilsModule.getCreatedDateParts(p1)
	assert(p2[createdDateParts] ~= nil, `No localized month found for month {createdDateParts}`)
	
	return localizationStringsModule.formatVersionHistoryCreatedDate(p2[createdDateParts], createdDateParts_1, createdDateParts_2)
end

local function mapVersionToEntry(p3, p4, p5)
	-- upvalues: versionHistoryUtilsModule (ref), localizationStringsModule (ref)
	local versionNumber = versionHistoryUtilsModule.getVersionNumber(p3)
	local var2 = if p3.title == nil or p3.title == "" then localizationStringsModule.formatVersionHistoryVersionTitle(versionNumber) else p3.title
	local var3 = if p3.description == nil or p3.description == "" then p5 else p3.description
	local createdDateParts, createdDateParts_1, createdDateParts_2 = versionHistoryUtilsModule.getCreatedDateParts(p3.createdTime)
	assert(p4[createdDateParts] ~= nil, `No localized month found for month {createdDateParts}`)
	
	return {
		id = tostring(versionNumber),
		versionNumber = versionNumber,
		versionLabel = localizationStringsModule.formatVersionHistoryVersionLabel(versionNumber, localizationStringsModule.formatVersionHistoryCreatedDate(p4[createdDateParts], createdDateParts_1, createdDateParts_2)),
		title = var2,
		description = var3,
		noteTitle = p3.title,
		noteDescription = p3.description,
		badgeText = versionHistoryUtilsModule.getBadgeText(p3)
	}
end

local function mapHistoryToEntries(p6, p7, p8)
	-- upvalues: mapVersionToEntry (ref)
	if p6 == nil or p6.placeVersions == nil then
		return {}
	end
	local t = {}
	
	for i, v in p6.placeVersions do
		table.insert(t, mapVersionToEntry(v, p7, p8))
	end
	return t
end

local _ = function(p9, p10)
	-- upvalues: localizationStringsModule (ref)
	return p10:Format(if p9 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = p9 })
end

local function formatLocalizedCreatedDate(p9, p10, p11)
	-- upvalues: versionHistoryUtilsModule (ref), localizationStringsModule (ref)
	local createdDateParts, createdDateParts_1, createdDateParts_2 = versionHistoryUtilsModule.getCreatedDateParts(p9)
	assert(p10[createdDateParts] ~= nil, `No localized month found for month {createdDateParts}`)
	
	return p11:Format(localizationStringsModule.VERSION_HISTORY_CREATED_DATE, {
		MONTH = p10[createdDateParts],
		DAY = createdDateParts_1,
		YEAR = createdDateParts_2
	})
end

local function formatLocalizedBadge(p12, p13, p14)
	-- upvalues: localizationStringsModule (ref)
	if p13 == "published" then
		return p14:Format(localizationStringsModule.VERSION_HISTORY_PUBLISHED)
	elseif p13 == "previouslyPublished" then
		return p14:Format(localizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED)
	elseif p13 == "restored" and p12.parentAssetVersionId ~= nil then
		local VERSION_HISTORY_RESTORED_BADGE = localizationStringsModule.VERSION_HISTORY_RESTORED_BADGE
		local t = {}
		local parentAssetVersionId = p12.parentAssetVersionId
		t.VERSION = p14:Format(if parentAssetVersionId < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = parentAssetVersionId })
		
		return p14:Format(VERSION_HISTORY_RESTORED_BADGE, t)
	end
	return if p13 == "autosaved" then p14:Format(localizationStringsModule.VERSION_HISTORY_AUTOSAVED) else nil
end

local function mapLocalizedVersionToEntry(p12, p13, p14, p15)
	-- upvalues: versionHistoryUtilsModule (ref), localizationStringsModule (ref), formatLocalizedCreatedDate (ref), formatLocalizedBadge (ref)
	local versionNumber = versionHistoryUtilsModule.getVersionNumber(p12)
	local badgeKind = versionHistoryUtilsModule.getBadgeKind(p12)
	
	return {
		id = tostring(versionNumber),
		versionNumber = versionNumber,
		versionLabel = p15:Format(localizationStringsModule.VERSION_HISTORY_VERSION_LABEL, {
			VERSION = p15:Format(if versionNumber < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = versionNumber }),
			CREATED_DATE = formatLocalizedCreatedDate(p12.createdTime, p13, p15)
		}),
		title = if p12.title == nil or p12.title == "" then p15:Format(localizationStringsModule.VERSION_HISTORY_VERSION_TITLE, { VERSION = versionNumber }) else p12.title,
		description = if p12.description == nil or p12.description == "" then p14 else p12.description,
		noteTitle = p12.title,
		noteDescription = p12.description,
		badgeText = formatLocalizedBadge(p12, badgeKind, p15),
		isAutosaved = badgeKind == "autosaved"
	}
end

local function mapLocalizedHistoryToEntries(p12, p13, p14, p15)
	-- upvalues: mapLocalizedVersionToEntry (ref)
	if p12 == nil or p12.placeVersions == nil then
		return {}
	end
	local t = {}
	
	for i, v in p12.placeVersions do
		table.insert(t, mapLocalizedVersionToEntry(v, p13, p14, p15))
	end
	return t
end

local _ = function(p16, p17, p18)
	-- upvalues: dataStatus (ref), localizationStringsModule (ref)
	return if p18 == nil then if p16 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif p16 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #p17 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else p18
end

local _ = function(p16, p17, p18, p19)
	-- upvalues: localizationStringsModule (ref)
	return if p16 == localizationStringsModule.VERSION_HISTORY_LOADING then p17 elseif p16 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then p18 elseif p16 == localizationStringsModule.VERSION_HISTORY_EMPTY then p19 else p16
end

local function useAgentRollbackRestore(p16, p17, p18)
	-- upvalues: reactModule (ref), getAgentRollbackRequestStoreModule (ref), signalsReactModule (ref)
	local var4, var5 = reactModule.useState(nil)
	local var6 = reactModule.useRef(false)
	local var7 = getAgentRollbackRequestStoreModule(false)
	local isPendingForPlaceId = var7.getIsPendingForPlaceId(p16.placeId)
	local var8 = signalsReactModule.useSignalState(isPendingForPlaceId)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref)
		var6.current = true
		
		return function()
			-- upvalues: var6 (copy)
			var6.current = false
		end
	end, {})
	
	return {
		clearError = reactModule.useCallback(function()
			-- upvalues: var5 (ref)
			var5(nil)
		end, {}),
		errorText = var4,
		isPending = var8,
		onRestore = reactModule.useCallback(function(p19)
			-- upvalues: isPendingForPlaceId (ref), p18 (ref), var5 (ref), var7 (ref), p16 (ref), var6 (ref), p17 (ref)
			if isPendingForPlaceId(false) or p18 then
				return
			end
			var5(nil)
			local var9 = var7.request({ universeId = p16.universeId, placeId = p16.placeId }, {
				versionNumber = p19.versionNumber,
				noteTitle = p19.noteTitle,
				noteDescription = p19.noteDescription
			})
			var9:catch(function()
				-- upvalues: var6 (copy), var5 (copy), p17 (copy)
				if var6.current then
					var5(p17)
				end
			end)
			
			return var9
		end, {
			p18, isPendingForPlaceId, var7, p16.universeId, p16.placeId, p17
		})
	}
end

return function(p16)
	-- upvalues: useLocalization (ref), dateHelper (ref), fFlagBuildLocalization (ref), localizationStringsModule (ref), reactModule (ref), localizationModule (ref), placeVersionHistoryModule (ref), signalsReactModule (ref), useScrollToTopAfterRestoreModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildVersionHistoryUpdatesModule (ref), useLiveVersionCardViewModelModule (ref), fFlagBuildAgentRollbackModule (ref), useAgentRollbackRestore (ref), rollbackPlaceWithRetryModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildNoPublishOnRevertModule (ref), fFlagisPublishOnBuildRevertModule (ref), mapLocalizedHistoryToEntries (ref), mapHistoryToEntries (ref), dataStatus (ref), versionHistoryBottomSheetModule (ref), var1 (ref)
	local VERSION_HISTORY_RESTORE_FAILED, VERSION_HISTORY_FALLBACK_DESCRIPTION
	local var4 = useLocalization(dateHelper.MonthsLocalizationKeys)
	local var5 = if fFlagBuildLocalization then useLocalization({
		empty = localizationStringsModule.VERSION_HISTORY_EMPTY,
		fallbackDescription = localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION,
		loadFailed = localizationStringsModule.VERSION_HISTORY_LOAD_FAILED,
		loading = localizationStringsModule.VERSION_HISTORY_LOADING,
		restoreFailed = localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
	}) else nil
	local var6 = if fFlagBuildLocalization then reactModule.useContext(localizationModule.LocalizationRoactContext) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		VERSION_HISTORY_RESTORE_FAILED = var5.restoreFailed
		VERSION_HISTORY_FALLBACK_DESCRIPTION = var5.fallbackDescription
	else
		VERSION_HISTORY_RESTORE_FAILED = localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
		VERSION_HISTORY_FALLBACK_DESCRIPTION = localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION
	end
	local var7 = reactModule.useMemo(function()
		-- upvalues: p16 (ref), placeVersionHistoryModule (copy)
		return p16.store or placeVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p16.store })
	local var8 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), p16 (ref)
		return var7.getAndFetchHistory(p16.placeId)
	end, { var7, p16.placeId })
	local var9 = signalsReactModule.useSignalState(var8.data)
	local var10 = signalsReactModule.useSignalState(var8.status)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(nil)
	local var15 = useScrollToTopAfterRestoreModule()
	local var16 = signalsReactModule.useSignalState(reactModule.useCallback(function(p17)
		-- upvalues: getPlaytestLoadingStoreModule (copy), p16 (ref)
		return getPlaytestLoadingStoreModule(p17).getAgentStatusForPlaceId(p16.placeId)(p17) == "Loading"
	end, { p16.placeId }))
	local var17 = if fFlagBuildVersionHistoryUpdatesModule then useLiveVersionCardViewModelModule({
		placeId = p16.placeId,
		universeId = p16.universeId,
		testId = if p16.testId then `{p16.testId}-live-version-card` else nil
	}) else nil
	local var18 = if fFlagBuildAgentRollbackModule then useAgentRollbackRestore(p16, VERSION_HISTORY_RESTORE_FAILED, var16) else nil
	local var19 = reactModule.useCallback(function(p17)
		-- upvalues: var11 (ref), var16 (ref), var12 (ref), var14 (ref), rollbackPlaceWithRetryModule (copy), p16 (ref), fFlagEnableTeamTestLua (copy), fFlagBuildNoPublishOnRevertModule (copy), fFlagisPublishOnBuildRevertModule (copy), var15 (ref), VERSION_HISTORY_RESTORE_FAILED (write)
		if var11 or var16 then
			return
		end
		var12(true)
		var14(nil)
		rollbackPlaceWithRetryModule(p16.placeId, p17.versionNumber, {
			debugSource = "version_history restore",
			note = { title = p17.noteTitle, description = p17.noteDescription },
			published = if fFlagEnableTeamTestLua then if fFlagBuildNoPublishOnRevertModule then false else true else fFlagisPublishOnBuildRevertModule
		}):andThen(function()
			-- upvalues: var15 (copy)
			var15.scrollToTopAfterRestore()
		end):catch(function(_)
			-- upvalues: var14 (copy), VERSION_HISTORY_RESTORE_FAILED (copy)
			var14(VERSION_HISTORY_RESTORE_FAILED)
		end):finally(function()
			-- upvalues: var12 (copy)
			var12(false)
		end)
	end, {
		var11,
		var16,
		p16.placeId,
		VERSION_HISTORY_RESTORE_FAILED,
		var15
	})
	local var20 = reactModule.useMemo(function()
		-- upvalues: fFlagBuildLocalization (copy), mapLocalizedHistoryToEntries (copy), var9 (ref), var4 (ref), VERSION_HISTORY_FALLBACK_DESCRIPTION (write), var6 (ref), mapHistoryToEntries (copy)
		return if fFlagBuildLocalization then mapLocalizedHistoryToEntries(var9, var4, VERSION_HISTORY_FALLBACK_DESCRIPTION, var6) else mapHistoryToEntries(var9, var4, VERSION_HISTORY_FALLBACK_DESCRIPTION)
	end, {
		var9,
		var4,
		VERSION_HISTORY_FALLBACK_DESCRIPTION,
		var6,
		if fFlagBuildLocalization then var5[localizationModule.RobloxLocaleIdKey] else nil
	})
	local var21 = if fFlagBuildAgentRollbackModule then nil else var13
	local var22 = if var21 ~= nil then if var10 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif var10 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #var20 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else var21
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		BottomSheet = reactModule.createElement(versionHistoryBottomSheetModule, {
			isOpen = p16.isOpen,
			entries = var20,
			statusText = if fFlagBuildLocalization then if var22 == localizationStringsModule.VERSION_HISTORY_LOADING then var5.loading elseif var22 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then var5.loadFailed elseif var22 == localizationStringsModule.VERSION_HISTORY_EMPTY then var5.empty else var22 else var22,
			isRestoreDisabled = if fFlagBuildAgentRollbackModule then var18.isPending or var16 else var11 or var16,
			onClose = p16.onClose,
			onRestore = if fFlagBuildAgentRollbackModule then var18.onRestore else var19,
			onRestoreStarted = if fFlagBuildAgentRollbackModule then p16.onAgentRollbackStarted else nil,
			scrollingFrameRef = var15.scrollingFrameRef,
			testId = p16.testId,
			liveVersion = var17
		}),
		RestoreErrorSnackbar = if fFlagBuildAgentRollbackModule and var18.errorText ~= nil then reactModule.createElement(var1, { title = var18.errorText, onClose = var18.clearError }) else nil
	})
end