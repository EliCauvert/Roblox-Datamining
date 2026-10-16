local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationModule = require(Parent.Localization)
local PlaceVersionHistoryModule = require(Parent.DataHydration.PlaceVersionHistory)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local GetAgentRollbackRequestStoreModule = require(BuildExperience.Stores.GetAgentRollbackRequestStore)
local GetPlaytestLoadingStoreModule = require(Parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local AgentRollbackSnackbarModule = require(script.Parent.AgentRollbackSnackbar)
local UseLatestVersionCardViewModelModule = require(script.Parent.LatestVersionCard.useLatestVersionCardViewModel)
local UseLiveVersionCardViewModelModule = require(script.Parent.LiveVersionCard.useLiveVersionCardViewModel)
local UseNextHistoryPageModule = require(script.Parent.useNextHistoryPage)
local VersionHistoryBottomSheetModule = require(script.Parent.VersionHistoryBottomSheet)
local VersionHistoryUtilsModule = require(script.Parent.VersionHistoryUtils)
local UseScrollToTopAfterRestoreModule = require(script.Parent.useScrollToTopAfterRestore)
local DataStatus = require(Parent.DataHydration).DataStatus
local DateHelper = require(Parent.Time).DateHelper
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization

local function _(p1: number, p2) --[[ Line: 41 | Named "formatLocalizedVersionNumber" ]]
	-- upvalues: LocalizationStringsModule (copy)
	return p2:Format(if p1 < 10 then LocalizationStringsModule.VERSION_HISTORY_VERSION_PADDED else LocalizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = p1 })
end

local function formatLocalizedCreatedDate(CreatedTime, p1, p2) --[[ Line: 52 ]]
	-- upvalues: VersionHistoryUtilsModule (copy), LocalizationStringsModule (copy)
	local CreatedDateParts, CreatedDateParts2, CreatedDateParts3 = VersionHistoryUtilsModule.getCreatedDateParts(CreatedTime)
	assert(p1[CreatedDateParts] ~= nil, `No localized month found for month {CreatedDateParts}`)
	
	return p2:Format(LocalizationStringsModule.VERSION_HISTORY_CREATED_DATE, {
		MONTH = p1[CreatedDateParts],
		DAY = CreatedDateParts2,
		YEAR = CreatedDateParts3
	})
end

local function formatLocalizedBadge(p3, BadgeKind, p4) --[[ Line: 67 ]]
	-- upvalues: LocalizationStringsModule (copy)
	if BadgeKind == "published" then
		return p4:Format(LocalizationStringsModule.VERSION_HISTORY_PUBLISHED)
	elseif BadgeKind == "previouslyPublished" then
		return p4:Format(LocalizationStringsModule.VERSION_HISTORY_PREVIOUSLY_PUBLISHED)
	elseif BadgeKind == "restored" and p3.parentAssetVersionId ~= nil then
		local ParentAssetVersionId: number = p3.parentAssetVersionId
		
		return p4:Format(LocalizationStringsModule.VERSION_HISTORY_RESTORED_BADGE, {
			VERSION = p4:Format(if ParentAssetVersionId < 10 then LocalizationStringsModule.VERSION_HISTORY_VERSION_PADDED else LocalizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = ParentAssetVersionId })
		})
	else
		return if BadgeKind == "autosaved" then p4:Format(LocalizationStringsModule.VERSION_HISTORY_AUTOSAVED) else nil
	end
end

local function mapLocalizedVersionToEntry(p3, p4, p5, p6) --[[ Line: 82 ]]
	-- upvalues: VersionHistoryUtilsModule (copy), LocalizationStringsModule (copy), formatLocalizedCreatedDate (copy), formatLocalizedBadge (copy)
	local VersionNumber: number = VersionHistoryUtilsModule.getVersionNumber(p3)
	local BadgeKind = VersionHistoryUtilsModule.getBadgeKind(p3)
	
	return {
		id = tostring(VersionNumber),
		versionNumber = VersionNumber,
		versionLabel = p6:Format(LocalizationStringsModule.VERSION_HISTORY_VERSION_LABEL, {
			VERSION = p6:Format(if VersionNumber < 10 then LocalizationStringsModule.VERSION_HISTORY_VERSION_PADDED else LocalizationStringsModule.VERSION_HISTORY_VERSION_COMPACT, { VERSION_NUMBER = VersionNumber }),
			CREATED_DATE = formatLocalizedCreatedDate(p3.createdTime, p4, p6)
		}),
		title = if p3.title == nil or p3.title == "" then p6:Format(LocalizationStringsModule.VERSION_HISTORY_VERSION_TITLE, { VERSION = VersionNumber }) else p3.title,
		description = if p3.description == nil or p3.description == "" then p5 else p3.description,
		noteTitle = p3.title,
		noteDescription = p3.description,
		badgeText = formatLocalizedBadge(p3, BadgeKind, p6),
		isAutosaved = BadgeKind == "autosaved"
	}
end

local function mapLocalizedHistoryToEntries(UseSignalStateResult, p3, FallbackDescription, UseContextResult) --[[ Line: 116 ]]
	-- upvalues: mapLocalizedVersionToEntry (copy)
	if UseSignalStateResult == nil or UseSignalStateResult.placeVersions == nil then
		return {}
	end
	local List = {}
	
	for _, placeVersion in UseSignalStateResult.placeVersions do
		table.insert(List, (mapLocalizedVersionToEntry(placeVersion, p3, FallbackDescription, UseContextResult)))
	end
	return List
end

local _ = function(Failed, p4) --[[ Line: 136 | Named "getStatusText" ]]
	-- upvalues: DataStatus (copy), LocalizationStringsModule (copy)
	return if Failed == DataStatus.NotReady then LocalizationStringsModule.VERSION_HISTORY_LOADING elseif Failed == DataStatus.Failed then LocalizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #p4 == 0 then LocalizationStringsModule.VERSION_HISTORY_EMPTY else nil
end

local _ = function(VERSIONHISTORYEMPTY, p4, p5, p6) --[[ Line: 148 | Named "localizeStatusText" ]]
	-- upvalues: LocalizationStringsModule (copy)
	return if VERSIONHISTORYEMPTY == LocalizationStringsModule.VERSION_HISTORY_LOADING then p4 elseif VERSIONHISTORYEMPTY == LocalizationStringsModule.VERSION_HISTORY_LOAD_FAILED then p5 elseif VERSIONHISTORYEMPTY == LocalizationStringsModule.VERSION_HISTORY_EMPTY then p6 else VERSIONHISTORYEMPTY
end

local function useAgentRollbackRestore(p4, RestoreFailed, UseSignalStateResult) --[[ Line: 159 ]]
	-- upvalues: ReactModule (copy), GetAgentRollbackRequestStoreModule (copy), SignalsReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(false)
	local AgentRollbackRequestStoreModule = GetAgentRollbackRequestStoreModule(false)
	local IsPendingForPlaceId = AgentRollbackRequestStoreModule.getIsPendingForPlaceId(p4.placeId)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(IsPendingForPlaceId)
	ReactModule.useEffect(function() --[[ Line: 166 ]]
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = true
		
		return function() --[[ Line: 168 ]]
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	
	return {
		clearError = ReactModule.useCallback(function() --[[ Line: 173 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end, {}),
		errorText = UseStateResult,
		isPending = UseSignalStateResult1,
		onRestore = ReactModule.useCallback(function(p5) --[[ Line: 177 ]]
			-- upvalues: IsPendingForPlaceId (copy), UseSignalStateResult (copy), UseStateResult2 (copy), AgentRollbackRequestStoreModule (copy), p4 (copy), UseRefResult (copy), RestoreFailed (copy)
			if IsPendingForPlaceId(false) or UseSignalStateResult then return end
			UseStateResult2(nil)
			local RequestResult = AgentRollbackRequestStoreModule.request({ universeId = p4.universeId, placeId = p4.placeId }, {
				versionNumber = p5.versionNumber,
				noteTitle = p5.noteTitle,
				noteDescription = p5.noteDescription
			})
			RequestResult:catch(function() --[[ Line: 191 ]]
				-- upvalues: UseRefResult (upval), UseStateResult2 (upval), RestoreFailed (upval)
				if UseRefResult.current then
					UseStateResult2(RestoreFailed)
				end
			end)
			
			return RequestResult
		end, {
			UseSignalStateResult, IsPendingForPlaceId, AgentRollbackRequestStoreModule,
			p4.universeId, p4.placeId, RestoreFailed
		})
	}
end

return function(p4) --[[ Line: 216 | Named "VersionHistoryContainer" ]]
	-- upvalues: UseLocalizationFunction (copy), DateHelper (copy), LocalizationStringsModule (copy), ReactModule (copy), LocalizationModule (copy), PlaceVersionHistoryModule (copy), SignalsReactModule (copy), UseNextHistoryPageModule (copy), UseScrollToTopAfterRestoreModule (copy), GetPlaytestLoadingStoreModule (copy), UseLiveVersionCardViewModelModule (copy), useAgentRollbackRestore (copy), mapLocalizedHistoryToEntries (copy), UseLatestVersionCardViewModelModule (copy), DataStatus (copy), VersionHistoryBottomSheetModule (copy), AgentRollbackSnackbarModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(DateHelper.MonthsLocalizationKeys)
	local UseLocalizationResult1 = UseLocalizationFunction({
		empty = LocalizationStringsModule.VERSION_HISTORY_EMPTY,
		fallbackDescription = LocalizationStringsModule.VERSION_HISTORY_FALLBACK_DESCRIPTION,
		loadFailed = LocalizationStringsModule.VERSION_HISTORY_LOAD_FAILED,
		loading = LocalizationStringsModule.VERSION_HISTORY_LOADING,
		restoreFailed = LocalizationStringsModule.VERSION_HISTORY_RESTORE_FAILED
	})
	local UseContextResult = ReactModule.useContext(LocalizationModule.LocalizationRoactContext)
	local RestoreFailed = UseLocalizationResult1.restoreFailed
	local FallbackDescription = UseLocalizationResult1.fallbackDescription
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 228 ]]
		-- upvalues: p4 (copy), PlaceVersionHistoryModule (upval)
		return p4.store or PlaceVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p4.store })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 231 ]]
		-- upvalues: UseMemoResult (copy), p4 (copy)
		return UseMemoResult.fetchHistory(p4.placeId)
	end, { UseMemoResult, p4.placeId })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult1.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult1.status)
	local UseNextHistoryPageModuleResult = UseNextHistoryPageModule(UseMemoResult, p4.placeId, UseSignalStateResult)
	local UseScrollToTopAfterRestoreModuleResult = UseScrollToTopAfterRestoreModule()
	local UseSignalStateResult2 = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p5): boolean --[[ Line: 238 ]]
		-- upvalues: GetPlaytestLoadingStoreModule (upval), p4 (copy)
		return GetPlaytestLoadingStoreModule(p5).getAgentStatusForPlaceId(p4.placeId)(p5) == "Loading"
	end, { p4.placeId })))
	local UseLiveVersionCardViewModelModuleResult = UseLiveVersionCardViewModelModule({
		placeId = p4.placeId,
		universeId = p4.universeId,
		testId = if p4.testId then `{p4.testId}-live-version-card` else nil
	})
	local UseAgentRollbackRestoreResult = useAgentRollbackRestore(p4, RestoreFailed, UseSignalStateResult2)
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 250 ]]
		-- upvalues: mapLocalizedHistoryToEntries (upval), UseSignalStateResult (copy), UseLocalizationResult (copy), FallbackDescription (copy), UseContextResult (copy)
		return (mapLocalizedHistoryToEntries(UseSignalStateResult, UseLocalizationResult, FallbackDescription, UseContextResult))
	end, {
		UseSignalStateResult,
		UseLocalizationResult,
		FallbackDescription,
		UseContextResult,
		UseLocalizationResult1[LocalizationModule.RobloxLocaleIdKey]
	})
	local VERSIONHISTORYLOADING = if UseSignalStateResult1 == DataStatus.NotReady then LocalizationStringsModule.VERSION_HISTORY_LOADING elseif UseSignalStateResult1 == DataStatus.Failed then LocalizationStringsModule.VERSION_HISTORY_LOAD_FAILED elseif #UseMemoResult2 == 0 then LocalizationStringsModule.VERSION_HISTORY_EMPTY else nil
	local Loading = UseLocalizationResult1.loading
	local LoadFailed = UseLocalizationResult1.loadFailed
	local Empty = UseLocalizationResult1.empty
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		BottomSheet = ReactModule.createElement(VersionHistoryBottomSheetModule, {
			isOpen = p4.isOpen,
			entries = UseMemoResult2,
			statusText = if VERSIONHISTORYLOADING == LocalizationStringsModule.VERSION_HISTORY_LOADING then Loading elseif VERSIONHISTORYLOADING == LocalizationStringsModule.VERSION_HISTORY_LOAD_FAILED then LoadFailed elseif VERSIONHISTORYLOADING == LocalizationStringsModule.VERSION_HISTORY_EMPTY then Empty else VERSIONHISTORYLOADING,
			isRestoreDisabled = UseAgentRollbackRestoreResult.isPending or UseSignalStateResult2,
			onClose = p4.onClose,
			onRestore = UseAgentRollbackRestoreResult.onRestore,
			onRestoreStarted = p4.onAgentRollbackStarted,
			scrollingFrameRef = UseScrollToTopAfterRestoreModuleResult.scrollingFrameRef,
			onEndReached = UseNextHistoryPageModuleResult,
			testId = p4.testId,
			liveVersion = UseLiveVersionCardViewModelModuleResult,
			latestVersion = UseLatestVersionCardViewModelModule({
				layoutOrder = 0,
				entry = UseMemoResult2[1],
				placeId = p4.placeId,
				universeId = p4.universeId,
				onClose = p4.onClose,
				testId = if p4.testId then `{p4.testId}-latest-version-card` else nil
			})
		}),
		RestoreErrorSnackbar = if UseAgentRollbackRestoreResult.errorText == nil then nil else ReactModule.createElement(AgentRollbackSnackbarModule, {
			title = UseAgentRollbackRestoreResult.errorText,
			onClose = UseAgentRollbackRestoreResult.clearError
		})
	})
end