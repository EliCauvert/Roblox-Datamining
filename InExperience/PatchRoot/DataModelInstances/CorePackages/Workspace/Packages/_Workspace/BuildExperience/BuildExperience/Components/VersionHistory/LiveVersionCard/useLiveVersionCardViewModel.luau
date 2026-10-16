local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local GameGetGameInfoStoreModule = require(Parent.DataHydration.GameGetGameInfoStore)
local GameGetVotesStoreModule = require(Parent.DataHydration.GameGetVotesStore)
local LocalizationModule = require(Parent.Localization)
local PlaceVersionHistoryModule = require(Parent.DataHydration.PlaceVersionHistory)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagBuildEventsUpdate1Module = require(BuildExperience.Flags.FFlagBuildEventsUpdate1)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local LaunchExperienceModule = require(Parent.BuildExperiencePlaytestLaunch.launchExperience)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local VersionHistoryUtilsModule = require(script.Parent.Parent.VersionHistoryUtils)
local _ = require(script.Parent.LiveVersionCardView)
local DateHelper = require(Parent.Time).DateHelper
local UseAbbreviatedNumberLocalizationFunction = LocalizationModule.Hooks.useAbbreviatedNumberLocalization
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization

return function(p1) --[[ Line: 36 | Named "useLiveVersionCardViewModel" ]]
	-- upvalues: PlaceVersionHistoryModule (copy), ReactModule (copy), SignalsReactModule (copy), GameGetGameInfoStoreModule (copy), GameGetVotesStoreModule (copy), VersionHistoryUtilsModule (copy), UseLocalizationFunction (copy), DateHelper (copy), LocalizationStringsModule (copy), UseAbbreviatedNumberLocalizationFunction (copy), SendBuildExperienceEventModule (copy), FFlagBuildEventsUpdate1Module (copy), LaunchExperienceModule (copy)
	local PlaceVersionHistoryStore = PlaceVersionHistoryModule.getPlaceVersionHistoryStore()
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function() --[[ Line: 38 ]]
		-- upvalues: PlaceVersionHistoryStore (copy), p1 (copy)
		return PlaceVersionHistoryStore.getLiveVersion(p1.placeId)
	end, { p1.placeId, PlaceVersionHistoryStore }).data)
	ReactModule.useEffect(function() --[[ Line: 43 ]]
		-- upvalues: PlaceVersionHistoryStore (copy), p1 (copy)
		PlaceVersionHistoryStore.fetchLiveVersion(p1.placeId)
	end, { p1.placeId, PlaceVersionHistoryStore })
	local Text = if p1.universeId == nil or p1.universeId == 0 then nil else tostring(p1.universeId)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(function(p2) --[[ Line: 50 | Named "getGameInfo" ]]
		-- upvalues: GameGetGameInfoStoreModule (upval), Text (copy)
		local GameGetGameInfoStoreModuleResult = GameGetGameInfoStoreModule(p2)
		
		return if Text == nil then nil else GameGetGameInfoStoreModuleResult.getAndFetchGameInfo(Text).data(p2)
	end)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(function(p2): boolean --[[ Line: 55 | Named "getIsGameInfoLoading" ]]
		-- upvalues: GameGetGameInfoStoreModule (upval), Text (copy)
		local GameGetGameInfoStoreModuleResult = GameGetGameInfoStoreModule(p2)
		
		return Text ~= nil and GameGetGameInfoStoreModuleResult.getAndFetchGameInfo(Text).status(p2) == "NotReady"
	end)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(function(p2) --[[ Line: 62 | Named "getVotes" ]]
		-- upvalues: GameGetVotesStoreModule (upval), Text (copy)
		local GameGetVotesStoreModuleResult = GameGetVotesStoreModule(p2)
		
		return if Text == nil then nil else GameGetVotesStoreModuleResult.getAndFetchVote(Text).data(p2)
	end)
	local UseSignalStateResult4 = SignalsReactModule.useSignalState(function(p2): boolean --[[ Line: 67 | Named "getAreVotesLoading" ]]
		-- upvalues: GameGetVotesStoreModule (upval), Text (copy)
		local GameGetVotesStoreModuleResult = GameGetVotesStoreModule(p2)
		
		return Text ~= nil and GameGetVotesStoreModuleResult.getAndFetchVote(Text).status(p2) == "NotReady"
	end)
	local PlaceVersion = if UseSignalStateResult then UseSignalStateResult.placeVersion else nil
	local VersionNumber = if PlaceVersion then VersionHistoryUtilsModule.getVersionNumber(PlaceVersion) else 0
	local v1 = 1
	local v2 = 0
	local v3 = ""
	
	if PlaceVersion then
		v1, v2, v26 = VersionHistoryUtilsModule.getCreatedDateParts(PlaceVersion.createdTime)
	end
	local UseLocalizationResult = UseLocalizationFunction({
		createdDate = {
			LocalizationStringsModule.LIVE_VERSION_CARD_CREATED_DATE,
			MONTH = UseLocalizationFunction(DateHelper.MonthsLocalizationKeys)[v1],
			DAY = v2,
			YEAR = v3
		},
		fallbackDescription = LocalizationStringsModule.LIVE_VERSION_CARD_FALLBACK_DESCRIPTION,
		play = LocalizationStringsModule.LIVE_VERSION_CARD_PLAY,
		versionNumber = {
			if VersionNumber < 10 then LocalizationStringsModule.LIVE_VERSION_CARD_VERSION_PADDED else LocalizationStringsModule.LIVE_VERSION_CARD_VERSION_COMPACT,
			VERSION_NUMBER = VersionNumber
		},
		versionTitle = {
			LocalizationStringsModule.LIVE_VERSION_CARD_VERSION_TITLE,
			VERSION = VersionNumber
		}
	})
	local UseLocalizationResult1 = UseLocalizationFunction({
		versionLabel = {
			LocalizationStringsModule.VERSION_HISTORY_VERSION_LABEL,
			VERSION = UseLocalizationResult.versionNumber,
			CREATED_DATE = UseLocalizationResult.createdDate
		}
	})
	local UseAbbreviatedNumberLocalizationResult = UseAbbreviatedNumberLocalizationFunction(if UseSignalStateResult3 then UseSignalStateResult3.upVotes else nil)
	local UseAbbreviatedNumberLocalizationResult1 = UseAbbreviatedNumberLocalizationFunction(if UseSignalStateResult1 then UseSignalStateResult1.totalVisits else nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 112 ]]
		-- upvalues: SendBuildExperienceEventModule (upval), FFlagBuildEventsUpdate1Module (upval), p1 (copy), LaunchExperienceModule (upval)
		SendBuildExperienceEventModule(if FFlagBuildEventsUpdate1Module then "PLAYTEST_CLICK" else "PLAY_CLICK", { universeId = p1.universeId, placeId = p1.placeId }, if FFlagBuildEventsUpdate1Module then { context = "LiveVersionCard" } else nil)
		LaunchExperienceModule(p1.placeId, "LiveVersionCard")
		
		if p1.onPlayActivated then
			p1.onPlayActivated()
		end
	end, { p1.placeId, p1.universeId, p1.onPlayActivated })
	
	return if PlaceVersion == nil then nil else {
		versionLabel = UseLocalizationResult1.versionLabel,
		title = if PlaceVersion.title == nil or PlaceVersion.title == "" then UseLocalizationResult.versionTitle else PlaceVersion.title,
		description = if PlaceVersion.description == nil or PlaceVersion.description == "" then UseLocalizationResult.fallbackDescription else PlaceVersion.description,
		totalUpVotes = UseAbbreviatedNumberLocalizationResult,
		totalVisits = UseAbbreviatedNumberLocalizationResult1,
		isTotalUpVotesLoading = UseSignalStateResult4,
		isTotalVisitsLoading = UseSignalStateResult2,
		playText = UseLocalizationResult.play,
		isPlayDisabled = p1.isPlayDisabled,
		onPlayActivated = UseResult,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end