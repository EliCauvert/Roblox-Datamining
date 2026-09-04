local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local gameGetGameInfoStoreModule = require(parent.DataHydration.GameGetGameInfoStore)
local gameGetVotesStoreModule = require(parent.DataHydration.GameGetVotesStore)
local localizationModule = require(parent.Localization)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local timeModule = require(parent.Time)
local fFlagBuildEventsUpdate1Module = require(buildExperience.Flags.FFlagBuildEventsUpdate1)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local launchExperienceModule = require(parent.BuildExperiencePlaytestLaunch.launchExperience)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local versionHistoryUtilsModule = require(script.Parent.Parent.VersionHistoryUtils)
local _ = require(script.Parent.LiveVersionCardView)
local dateHelper = timeModule.DateHelper
local useAbbreviatedNumberLocalization = localizationModule.Hooks.useAbbreviatedNumberLocalization
local useLocalization = localizationModule.Hooks.useLocalization

return function(p1)
	-- upvalues: placeVersionHistoryModule (ref), reactModule (ref), signalsReactModule (ref), gameGetGameInfoStoreModule (ref), gameGetVotesStoreModule (ref), versionHistoryUtilsModule (ref), useLocalization (ref), dateHelper (ref), localizationStringsModule (ref), useAbbreviatedNumberLocalization (ref), sendBuildExperienceEventModule (ref), fFlagBuildEventsUpdate1Module (ref), launchExperienceModule (ref)
	local placeVersionHistoryStore = placeVersionHistoryModule.getPlaceVersionHistoryStore()
	local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: placeVersionHistoryStore (ref), p1 (ref)
		return placeVersionHistoryStore.getLiveVersion(p1.placeId)
	end, { p1.placeId, placeVersionHistoryStore }).data)
	reactModule.useEffect(function()
		-- upvalues: placeVersionHistoryStore (ref), p1 (ref)
		placeVersionHistoryStore.fetchLiveVersion(p1.placeId)
	end, { p1.placeId, placeVersionHistoryStore })
	local var2 = if p1.universeId == nil or p1.universeId == 0 then nil else tostring(p1.universeId)
	local var3 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: gameGetGameInfoStoreModule (copy), var2 (ref)
		return if var2 == nil then nil else gameGetGameInfoStoreModule(p2).getAndFetchGameInfo(var2).data(p2)
	end)
	local var4 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: gameGetGameInfoStoreModule (copy), var2 (ref)
		return var2 ~= nil and gameGetGameInfoStoreModule(p2).getAndFetchGameInfo(var2).status(p2) == "NotReady"
	end)
	local var5 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: gameGetVotesStoreModule (copy), var2 (ref)
		return if var2 == nil then nil else gameGetVotesStoreModule(p2).getAndFetchVote(var2).data(p2)
	end)
	local var6 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: gameGetVotesStoreModule (copy), var2 (ref)
		return var2 ~= nil and gameGetVotesStoreModule(p2).getAndFetchVote(var2).status(p2) == "NotReady"
	end)
	local var7 = if var1 then var1.placeVersion else nil
	local var8 = if var7 then versionHistoryUtilsModule.getVersionNumber(var7) else 0
	local var9 = 1
	local var10 = 0
	local var11 = ""
	
	if var7 then
		local createdDateParts, createdDateParts_1, createdDateParts_2 = versionHistoryUtilsModule.getCreatedDateParts(var7.createdTime)
		var9 = createdDateParts
		var10 = createdDateParts_1
		var11 = createdDateParts_2
	end
	local var12 = useLocalization({
		createdDate = {
			localizationStringsModule.LIVE_VERSION_CARD_CREATED_DATE,
			MONTH = useLocalization(dateHelper.MonthsLocalizationKeys)[var9],
			DAY = var10,
			YEAR = var11
		},
		fallbackDescription = localizationStringsModule.LIVE_VERSION_CARD_FALLBACK_DESCRIPTION,
		play = localizationStringsModule.LIVE_VERSION_CARD_PLAY,
		versionNumber = {
			if var8 < 10 then localizationStringsModule.LIVE_VERSION_CARD_VERSION_PADDED else localizationStringsModule.LIVE_VERSION_CARD_VERSION_COMPACT,
			VERSION_NUMBER = var8
		},
		versionTitle = {
			localizationStringsModule.LIVE_VERSION_CARD_VERSION_TITLE,
			VERSION = var8
		}
	})
	
	return if var7 == nil then nil else {
		versionLabel = useLocalization({
			versionLabel = {
				localizationStringsModule.VERSION_HISTORY_VERSION_LABEL,
				VERSION = var12.versionNumber,
				CREATED_DATE = var12.createdDate
			}
		}).versionLabel,
		title = if var7.title == nil or var7.title == "" then var12.versionTitle else var7.title,
		description = if var7.description == nil or var7.description == "" then var12.fallbackDescription else var7.description,
		totalUpVotes = useAbbreviatedNumberLocalization(if var5 then var5.upVotes else nil),
		totalVisits = useAbbreviatedNumberLocalization(if var3 then var3.totalVisits else nil),
		isTotalUpVotesLoading = var6,
		isTotalVisitsLoading = var4,
		playText = var12.play,
		isPlayDisabled = p1.isPlayDisabled,
		onPlayActivated = reactModule.useCallback(function()
			-- upvalues: sendBuildExperienceEventModule (copy), fFlagBuildEventsUpdate1Module (copy), p1 (ref), launchExperienceModule (copy)
			sendBuildExperienceEventModule(if fFlagBuildEventsUpdate1Module then "PLAYTEST_CLICK" else "PLAY_CLICK", { universeId = p1.universeId, placeId = p1.placeId }, if fFlagBuildEventsUpdate1Module then { context = "LiveVersionCard" } else nil)
			launchExperienceModule(p1.placeId, "LiveVersionCard")
			
			if p1.onPlayActivated then
				p1.onPlayActivated()
			end
		end, { p1.placeId, p1.universeId, p1.onPlayActivated }),
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end