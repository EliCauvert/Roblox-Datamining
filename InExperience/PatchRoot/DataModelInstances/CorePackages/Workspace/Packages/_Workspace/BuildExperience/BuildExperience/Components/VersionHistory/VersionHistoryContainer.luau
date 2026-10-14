local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local localizationModule = require(parent.Localization)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local timeModule = require(parent.Time)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local getAgentRollbackRequestStoreModule = require(buildExperience.Stores.GetAgentRollbackRequestStore)
local getPlaytestLoadingStoreModule = require(parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local agentRollbackSnackbarModule = require(script.Parent.AgentRollbackSnackbar)
local useLatestVersionCardViewModelModule = require(script.Parent.LatestVersionCard.useLatestVersionCardViewModel)
local useLiveVersionCardViewModelModule = require(script.Parent.LiveVersionCard.useLiveVersionCardViewModel)
local useNextHistoryPageModule = require(script.Parent.useNextHistoryPage)
local versionHistoryBottomSheetModule = require(script.Parent.VersionHistoryBottomSheet)
local versionHistoryUtilsModule = require(script.Parent.VersionHistoryUtils)
local useScrollToTopAfterRestoreModule = require(script.Parent.useScrollToTopAfterRestore)
local dataStatus = dataHydrationModule.DataStatus
local dateHelper = timeModule.DateHelper
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

local _ = function(p8, p9)
	-- upvalues: dataStatus (ref), localizationStringsModule (ref)
	return if p8 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif p8 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #p9 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil
end

local _ = function(p8, p9, p10, p11)
	-- upvalues: localizationStringsModule (ref)
	return if p8 == localizationStringsModule.VERSION_HISTORY_LOADING then p9 elseif p8 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then p10 elseif p8 == localizationStringsModule.VERSION_HISTORY_EMPTY then p11 else p8
end

local function useAgentRollbackRestore(p8, p9, p10)
	-- upvalues: reactModule (ref), getAgentRollbackRequestStoreModule (ref), signalsReactModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useRef(false)
	local var4 = getAgentRollbackRequestStoreModule(false)
	local isPendingForPlaceId = var4.getIsPendingForPlaceId(p8.placeId)
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
		onRestore = reactModule.useCallback(function(p11)
			-- upvalues: isPendingForPlaceId (ref), p10 (ref), var2 (ref), var4 (ref), p8 (ref), var3 (ref), p9 (ref)
			if isPendingForPlaceId(false) or p10 then
				return
			end
			var2(nil)
			local var6 = var4.request({ universeId = p8.universeId, placeId = p8.placeId }, {
				versionNumber = p11.versionNumber,
				noteTitle = p11.noteTitle,
				noteDescription = p11.noteDescription
			})
			var6:catch(function()
				-- upvalues: var3 (copy), var2 (copy), p9 (copy)
				if var3.current then
					var2(p9)
				end
			end)
			
			return var6
		end, {
			p10, isPendingForPlaceId, var4, p8.universeId, p8.placeId, p9
		})
	}
end

return function(p8)
	-- upvalues: useLocalization (ref), dateHelper (ref), localizationStringsModule (ref), reactModule (ref), localizationModule (ref), placeVersionHistoryModule (ref), signalsReactModule (ref), useNextHistoryPageModule (ref), useScrollToTopAfterRestoreModule (ref), getPlaytestLoadingStoreModule (ref), useLiveVersionCardViewModelModule (ref), useAgentRollbackRestore (ref), mapLocalizedHistoryToEntries (ref), useLatestVersionCardViewModelModule (ref), dataStatus (ref), versionHistoryBottomSheetModule (ref), agentRollbackSnackbarModule (ref)
	local var1 = useLocalization(dateHelper.MonthsLocalizationKeys)
	local var2 = useLocalization({
		empty = localizationStringsModule.VERSION_HISTORY_EMPTY,
		fallbackDescription = localizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION,
		loadFailed = localizationStringsModule.VERSION_HISTORY_LOAD_FAILED,
		loading = localizationStringsModule.VERSION_HISTORY_LOADING,
		restoreFailed = localizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
	})
	local var3 = reactModule.useContext(localizationModule.LocalizationRoactContext)
	local restoreFailed = var2.restoreFailed
	local fallbackDescription = var2.fallbackDescription
	local var4 = reactModule.useMemo(function()
		-- upvalues: p8 (ref), placeVersionHistoryModule (copy)
		return p8.store or placeVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p8.store })
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), p8 (ref)
		return var4.fetchHistory(p8.placeId)
	end, { var4, p8.placeId })
	local var6 = signalsReactModule.useSignalState(var5.data)
	local var7 = signalsReactModule.useSignalState(var5.status)
	local var8 = useNextHistoryPageModule(var4, p8.placeId, var6)
	local var9 = useScrollToTopAfterRestoreModule()
	local var10 = signalsReactModule.useSignalState(reactModule.useCallback(function(p9)
		-- upvalues: getPlaytestLoadingStoreModule (copy), p8 (ref)
		return getPlaytestLoadingStoreModule(p9).getAgentStatusForPlaceId(p8.placeId)(p9) == "Loading"
	end, { p8.placeId }))
	local var11 = useLiveVersionCardViewModelModule({
		placeId = p8.placeId,
		universeId = p8.universeId,
		testId = if p8.testId then `{p8.testId}-live-version-card` else nil
	})
	local var12 = useAgentRollbackRestore(p8, restoreFailed, var10)
	local var13 = reactModule.useMemo(function()
		-- upvalues: mapLocalizedHistoryToEntries (copy), var6 (ref), var1 (ref), fallbackDescription (ref), var3 (ref)
		return mapLocalizedHistoryToEntries(var6, var1, fallbackDescription, var3)
	end, {
		var6,
		var1,
		fallbackDescription,
		var3,
		var2[localizationModule.RobloxLocaleIdKey]
	})
	local var14 = if var7 == dataStatus.NotReady then localizationStringsModule.VERSION_HISTORY_LOADING elseif var7 == dataStatus.Failed then localizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #var13 == 0 then localizationStringsModule.VERSION_HISTORY_EMPTY else nil
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		BottomSheet = reactModule.createElement(versionHistoryBottomSheetModule, {
			isOpen = p8.isOpen,
			entries = var13,
			statusText = if var14 == localizationStringsModule.VERSION_HISTORY_LOADING then var2.loading elseif var14 == localizationStringsModule.VERSION_HISTORY_LOAD_FAILED then var2.loadFailed elseif var14 == localizationStringsModule.VERSION_HISTORY_EMPTY then var2.empty else var14,
			isRestoreDisabled = var12.isPending or var10,
			onClose = p8.onClose,
			onRestore = var12.onRestore,
			onRestoreStarted = p8.onAgentRollbackStarted,
			scrollingFrameRef = var9.scrollingFrameRef,
			onEndReached = var8,
			testId = p8.testId,
			liveVersion = var11,
			latestVersion = useLatestVersionCardViewModelModule({
				layoutOrder = 0,
				entry = var13[1],
				placeId = p8.placeId,
				universeId = p8.universeId,
				onClose = p8.onClose,
				testId = if p8.testId then `{p8.testId}-latest-version-card` else nil
			})
		}),
		RestoreErrorSnackbar = if var12.errorText ~= nil then nil else reactModule.createElement(agentRollbackSnackbarModule, { title = var12.errorText, onClose = var12.clearError })
	})
end