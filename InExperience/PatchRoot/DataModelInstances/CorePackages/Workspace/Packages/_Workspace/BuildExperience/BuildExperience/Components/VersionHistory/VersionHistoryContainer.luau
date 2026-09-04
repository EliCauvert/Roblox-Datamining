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
local getPlaytestLoadingStoreModule = require(parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local rollbackPlaceWithRetryModule = require(buildExperience.utils.rollbackPlaceWithRetry)
local var1 = if fFlagBuildAgentRollbackModule then require(script.Parent.AgentRollbackSnackbar) else nil
local useLatestVersionCardViewModelModule = require(script.Parent.LatestVersionCard.useLatestVersionCardViewModel)
local useLiveVersionCardViewModelModule = require(script.Parent.LiveVersionCard.useLiveVersionCardViewModel)
local versionHistoryBottomSheetModule = require(script.Parent.VersionHistoryBottomSheet)
local versionHistoryUtilsModule = require(script.Parent.VersionHistoryUtils)
local useScrollToTopAfterRestoreModule = require(script.Parent.useScrollToTopAfterRestore)
local dataStatus = dataHydrationModule.DataStatus
local dateHelper = timeModule.DateHelper
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local useLocalization = localizationModule.Hooks.useLocalization

local function _(p1, p2)
	-- upvalues: localizationStringsModule (ref)
	return p2:Format(if p1 < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = p1 })
end

local function formatLocalizedCreatedDate(p1, p2, p3)
	-- upvalues: versionHistoryUtilsModule (ref), localizationStringsModule (ref)
	local createdDateParts, createdDateParts_1, createdDateParts_2 = versionHistoryUtilsModule.getCreatedDateParts(p1)
	assert(p2[createdDateParts] ~= nil, `No localized month found for month {createdDateParts}`)
	
	return p3:Format(localizationStringsModule.VERSION_HISTORY_CREATED_DATE, {
		MONTH = p2[createdDateParts],
		DAY = createdDateParts_1,
		YEAR = createdDateParts_2
	})
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
	-- upvalues: versionHistoryUtilsModule (ref), localizationStringsModule (ref), formatLocalizedCreatedDate (ref), formatLocalizedBadge (ref)
	local versionNumber = versionHistoryUtilsModule.getVersionNumber(p4)
	local badgeKind = versionHistoryUtilsModule.getBadgeKind(p4)
	
	return {
		id = tostring(versionNumber),
		versionNumber = versionNumber,
		versionLabel = p7:Format(localizationStringsModule.VERSION_HISTORY_VERSION_LABEL, {
			VERSION = p7:Format(if versionNumber < 10 then localizationStringsModule.VERSION_HISTORY_VERSION_PADDED else localizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = versionNumber }),
			CREATED_DATE = formatLocalizedCreatedDate(p4.createdTime, p5, p7)
		}),
		title = if p4.title == nil or p4.title == "" then p7:Format(localizationStringsModule.VERSION_HISTORY_VERSION_TITLE, { VERSION = versionNumber }) else p4.title,
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
			-- upvalues: isPendingForPlaceId (ref), p10 (ref), var3 (ref), var5 (ref), p8 (ref), var4 (ref), p9 (ref)
			if isPendingForPlaceId(false) or p10 then
				return
			end
			var3(nil)
			local var7 = var5.request({ universeId = p8.universeId, placeId = p8.placeId }, {
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
	-- upvalues: useLocalization (ref), dateHelper (ref), localizationStringsModule (ref), reactModule (ref), localizationModule (ref), placeVersionHistoryModule (ref), signalsReactModule (ref), useScrollToTopAfterRestoreModule (ref), getPlaytestLoadingStoreModule (ref), fFlagBuildVersionHistoryUpdatesModule (ref), useLiveVersionCardViewModelModule (ref), fFlagBuildAgentRollbackModule (ref), useAgentRollbackRestore (ref), rollbackPlaceWithRetryModule (ref), fFlagEnableTeamTestLua (ref), fFlagisPublishOnBuildRevertModule (ref), mapLocalizedHistoryToEntries (ref), useLatestVersionCardViewModelModule (ref), dataStatus (ref), versionHistoryBottomSheetModule (ref), var1 (ref)
	local var2 = useLocalization(dateHelper.MonthsLocalizationKeys)
	local var3 = useLocalization({
		empty = localizationStringsModule.VERSION_HISTORY_EMPTY,
		fallbackDescription = localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION,
		loadFailed = localizationStringsModule.VERSION_HISTORY_LOAD_FAILED,
		loading = localizationStringsModule.VERSION_HISTORY_LOADING,
		restoreFailed = localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
	})
	local var4 = reactModule.useContext(localizationModule.LocalizationRoactContext)
	local restoreFailed = var3.restoreFailed
	local fallbackDescription = var3.fallbackDescription
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
		-- upvalues: getPlaytestLoadingStoreModule (copy), p8 (ref)
		return getPlaytestLoadingStoreModule(p9).getAgentStatusForPlaceId(p8.placeId)(p9) == "Loading"
	end, { p8.placeId }))
	local var15 = if fFlagBuildVersionHistoryUpdatesModule then useLiveVersionCardViewModelModule({
		placeId = p8.placeId,
		universeId = p8.universeId,
		testId = if p8.testId then `{p8.testId}-live-version-card` else nil
	}) else nil
	local var16 = if fFlagBuildAgentRollbackModule then useAgentRollbackRestore(p8, restoreFailed, var14) else nil
	local var17 = reactModule.useCallback(function(p9)
		-- upvalues: var9 (ref), var14 (ref), var10 (ref), var12 (ref), rollbackPlaceWithRetryModule (copy), p8 (ref), fFlagEnableTeamTestLua (copy), fFlagisPublishOnBuildRevertModule (copy), var13 (ref), restoreFailed (ref)
		if var9 or var14 then
			return
		end
		var10(true)
		var12(nil)
		rollbackPlaceWithRetryModule(p8.placeId, p9.versionNumber, {
			debugSource = "version_history restore",
			note = { title = p9.noteTitle, description = p9.noteDescription },
			published = if fFlagEnableTeamTestLua then false else fFlagisPublishOnBuildRevertModule
		}):andThen(function()
			-- upvalues: var13 (copy)
			var13.scrollToTopAfterRestore()
		end):catch(function(_)
			-- upvalues: var12 (copy), restoreFailed (copy)
			var12(restoreFailed)
		end):finally(function()
			-- upvalues: var10 (copy)
			var10(false)
		end)
	end, {
		var9,
		var14,
		p8.placeId,
		restoreFailed,
		var13
	})
	local var18 = reactModule.useMemo(function()
		-- upvalues: mapLocalizedHistoryToEntries (copy), var7 (ref), var2 (ref), fallbackDescription (ref), var4 (ref)
		return mapLocalizedHistoryToEntries(var7, var2, fallbackDescription, var4)
	end, {
		var7,
		var2,
		fallbackDescription,
		var4,
		var3[localizationModule.RobloxLocaleIdKey]
	})
	local var19 = if fFlagBuildVersionHistoryUpdatesModule then useLatestVersionCardViewModelModule({
		layoutOrder = 0,
		entry = var18[1],
		placeId = p8.placeId,
		universeId = p8.universeId,
		onClose = p8.onClose,
		testId = if p8.testId then `{p8.testId}-latest-version-card` else nil
	}) else nil
	local var20 = if fFlagBuildAgentRollbackModule then nil else var11
	local var21 = if var20 ~= nil then if var8 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif var8 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #var18 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil else var20
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		BottomSheet = reactModule.createElement(versionHistoryBottomSheetModule, {
			isOpen = p8.isOpen,
			entries = var18,
			statusText = if var21 == localizationStringsModule.VERSION_HISTORY_LOADING then var3.loading elseif var21 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then var3.loadFailed elseif var21 == localizationStringsModule.VERSION_HISTORY_EMPTY then var3.empty else var21,
			isRestoreDisabled = if fFlagBuildAgentRollbackModule then var16.isPending or var14 else var9 or var14,
			onClose = p8.onClose,
			onRestore = if fFlagBuildAgentRollbackModule then var16.onRestore else var17,
			onRestoreStarted = if fFlagBuildAgentRollbackModule then p8.onAgentRollbackStarted else nil,
			scrollingFrameRef = var13.scrollingFrameRef,
			testId = p8.testId,
			liveVersion = var15,
			latestVersion = var19
		}),
		RestoreErrorSnackbar = if fFlagBuildAgentRollbackModule and var16.errorText ~= nil then reactModule.createElement(var1, { title = var16.errorText, onClose = var16.clearError }) else nil
	})
end