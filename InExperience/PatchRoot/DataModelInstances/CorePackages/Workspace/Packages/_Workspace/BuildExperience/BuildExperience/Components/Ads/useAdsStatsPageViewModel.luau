local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local LocalizationModule = require(Parent.Localization)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseGetAdCampaignsModule = require(script.Parent.useGetAdCampaigns)
local UseGetCampaignStatsModule = require(script.Parent.useGetCampaignStats)
local UseGetAdCampaignEligibilityModule = require(script.Parent.useGetAdCampaignEligibility)
local UseCreateAdCampaignModule = require(script.Parent.useCreateAdCampaign)
local AdCampaignEligibilityUtilsModule = require(script.Parent.adCampaignEligibilityUtils)
local AdCampaignScheduleUtilsModule = require(script.Parent.adCampaignScheduleUtils)
local GetAdsManagerUrlModule = require(script.Parent.getAdsManagerUrl)
local UseOpenWebViewWithResumeRefreshModule = require(BuildExperience.utils.useOpenWebViewWithResumeRefresh)
local _ = require(script.Parent.AdsStatsView)
local _ = require(script.Parent.PastCampaignRow)
local _ = require(BuildExperience.Components.Analytics.StatsCard.StatsCard)
local AnalyticsUnitModule = require(BuildExperience.Analytics.AnalyticsUnit)
local StatsCardValueFormatModule = require(BuildExperience.Components.Analytics.StatsCard.StatsCardValueFormat)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.DataHydration.CreatorAgentChat)
local FFlagEnablePaidAdsModule = require(BuildExperience.Flags.FFlagEnablePaidAds)
local FFlagBuildAdsManagerUniverseUrlModule = require(BuildExperience.Flags.FFlagBuildAdsManagerUniverseUrl)
local IconName = FoundationModule.Enums.IconName
local IconPosition = FoundationModule.Enums.IconPosition
local MSPERDAY = AdCampaignScheduleUtilsModule.MS_PER_DAY
local ToStartMsFunction = AdCampaignScheduleUtilsModule.toStartMs
local CampaignEndMsFunction = AdCampaignScheduleUtilsModule.campaignEndMs
local CampaignEndExclusiveMsFunction = AdCampaignScheduleUtilsModule.campaignEndExclusiveMs
local WINDOWDAYS = require(Parent.DataHydration.CampaignStats).WINDOW_DAYS
local config = {
	plays = 0,
	adClicks = 0,
	adViews = 0,
	playtimeSeconds = 0
}

local function _(p1: number): number --[[ Line: 66 | Named "toPlaytimeMinutes" ]]
	return p1 / 60
end

local function formatDateRange(Text: string, StartMs: number, EndMs): string? --[[ Line: 75 ]]
	-- upvalues: LocalizationStringsModule (copy)
	if StartMs == nil or EndMs == nil or StartMs <= 0 then
		return nil
	else
		local config = {
			startDate = LocalizationStringsModule.formatCampaignDate(StartMs),
			endDate = LocalizationStringsModule.formatCampaignDate(EndMs)
		}
		
		return (string.gsub(Text, "{(%w+)}", function(Match) --[[ Line: 83 ]]
			-- upvalues: config (copy)
			return config[Match] or "{" .. Match .. "}"
		end))
	end
end

local _ = function(Title, StatValue, StatIcon, HasData) --[[ Line: 89 | Named "scalarCard" ]]
	-- upvalues: AnalyticsUnitModule (copy), StatsCardValueFormatModule (copy), IconPosition (copy)
	return {
		deltaValue = 0,
		title = Title,
		statValue = StatValue,
		statUnit = AnalyticsUnitModule.Scalar,
		statValueFormat = StatsCardValueFormatModule.Regular,
		statIcon = StatIcon,
		statIconPosition = IconPosition.Left,
		deltaUnit = AnalyticsUnitModule.Percent,
		hasData = HasData
	}
end

return function(p1, p2, p3, p4, p5, p6) --[[ Line: 103 | Named "useAdsStatsPageViewModel" ]]
	-- upvalues: UseGetAdCampaignsModule (copy), UseGetCampaignStatsModule (copy), UseGetAdCampaignEligibilityModule (copy), UseCreateAdCampaignModule (copy), ReactModule (copy), FFlagEnablePaidAdsModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), LocalizationModule (copy), WINDOWDAYS (copy), MSPERDAY (copy), config (copy), ToStartMsFunction (copy), CampaignEndMsFunction (copy), CampaignEndExclusiveMsFunction (copy), IconName (copy), AnalyticsUnitModule (copy), StatsCardValueFormatModule (copy), IconPosition (copy), formatDateRange (copy), AdCampaignEligibilityUtilsModule (copy), FFlagBuildAdsManagerUniverseUrlModule (copy), GetAdsManagerUrlModule (copy), UseOpenWebViewWithResumeRefreshModule (copy)
	local UseGetAdCampaignsModuleResult, UseGetAdCampaignsModuleResult2 = UseGetAdCampaignsModule(p2)
	local Flag = false
	
	if UseGetAdCampaignsModuleResult ~= nil and p1 ~= nil then
		local Text = tostring(p1)
		
		for _, value in UseGetAdCampaignsModuleResult do
			if value.targetUniverseId == Text then
				Flag = true
				break
			end
		end
	end
	local UseGetCampaignStatsModuleResult, UseGetCampaignStatsModuleResult2, UseGetCampaignStatsModuleResult3 = UseGetCampaignStatsModule(if Flag then p1 else nil, p3)
	local UseGetAdCampaignEligibilityModuleResult, UseGetAdCampaignEligibilityModuleResult2 = UseGetAdCampaignEligibilityModule(p1, p5)
	local UseCreateAdCampaignModuleResult = UseCreateAdCampaignModule(p1, nil, p6)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local AdCampaignOffers = nil
	local Callback = nil
	
	if FFlagEnablePaidAdsModule then
		AdCampaignOffers, Callback = ReactModule.useState(nil)
	end
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 151 ]]
		-- upvalues: UseStateResult2 (copy), FFlagEnablePaidAdsModule (upval), UseCreateAdCampaignModuleResult (copy)
		UseStateResult2(false)
		
		if FFlagEnablePaidAdsModule then
			UseCreateAdCampaignModuleResult.clearCreateError()
		end
	end, { UseCreateAdCampaignModuleResult.clearCreateError })
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 162 ]]
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(false)
	end, {})
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 169 ]]
		-- upvalues: UseRefResult1 (copy), UseCreateAdCampaignModuleResult (copy), UseStateResult2 (copy), UseStateResult2_3 (copy), UseStateResult2_2 (copy), UseRefResult (copy)
		local Current = UseRefResult1.current
		UseRefResult1.current = UseCreateAdCampaignModuleResult.isCreatePending
		
		if Current and not UseCreateAdCampaignModuleResult.isCreatePending and not UseCreateAdCampaignModuleResult.hasCreateError then
			UseStateResult2(false)
			UseStateResult2_3(true)
			UseStateResult2_2(UseRefResult.current ~= nil)
		end
	end, {
		UseCreateAdCampaignModuleResult.isCreatePending,
		UseCreateAdCampaignModuleResult.hasCreateError
	})
	ReactModule.useEffect(function() --[[ Line: 184 ]]
		-- upvalues: UseGetAdCampaignEligibilityModuleResult2 (copy), UseGetAdCampaignEligibilityModuleResult (copy), UseRefResult (copy), UseStateResult3 (copy), UseStateResult2_2 (copy)
		local IsNotUseGetAdCampaignEligibilityModuleResultMatch: boolean = UseGetAdCampaignEligibilityModuleResult2 == "Ready" and (UseGetAdCampaignEligibilityModuleResult ~= nil and UseGetAdCampaignEligibilityModuleResult ~= UseRefResult.current)
		
		if UseStateResult3 and (IsNotUseGetAdCampaignEligibilityModuleResultMatch or UseGetAdCampaignEligibilityModuleResult2 == "Failed") then
			UseRefResult.current = nil
			UseStateResult2_2(false)
		end
	end, {
		UseStateResult3,
		UseGetAdCampaignEligibilityModuleResult2,
		UseGetAdCampaignEligibilityModuleResult
	})
	ReactModule.useEffect(function() --[[ Line: 202 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2_2 (copy), FFlagEnablePaidAdsModule (upval), Callback (ref)
		UseRefResult.current = nil
		UseStateResult2_2(false)
		
		if FFlagEnablePaidAdsModule then
			Callback(nil)
		end
	end, { p1 })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 211 ]]
		-- upvalues: p4 (copy)
		return if p4 == nil then DateTime.now().UnixTimestampMillis else p4
	end, { p4 })
	local UseLocalizationResult = UseLocalizationFunction({
		gamePlays = LocalizationStringsModule.ADS_STATS_GAME_PLAYS,
		adClicks = LocalizationStringsModule.ADS_STATS_AD_CLICKS,
		adViews = LocalizationStringsModule.ADS_STATS_AD_VIEWS,
		playTime = LocalizationStringsModule.ADS_STATS_PLAY_TIME,
		pastCampaigns = LocalizationStringsModule.ADS_STATS_PAST_CAMPAIGNS,
		error = LocalizationStringsModule.ADS_STATS_ERROR,
		dateRange = LocalizationStringsModule.ADS_STATS_DATE_RANGE,
		create = LocalizationStringsModule.PROMOTION_CREATE_BUTTON,
		emptyTitle = LocalizationStringsModule.ADS_STATS_EMPTY_TITLE,
		emptySubtitle = LocalizationStringsModule.ADS_STATS_EMPTY_SUBTITLE,
		emptyTitleFree = LocalizationStringsModule.ADS_STATS_EMPTY_TITLE_FREE,
		emptySubtitleFree = LocalizationStringsModule.ADS_STATS_EMPTY_SUBTITLE_FREE,
		adsManager = LocalizationStringsModule.ADS_STATS_ADS_MANAGER,
		createSuccess = LocalizationStringsModule.ADS_STATS_CREATE_SUCCESS
	})
	local GamePlays = UseLocalizationResult.gamePlays
	local AdClicks = UseLocalizationResult.adClicks
	local AdViews = UseLocalizationResult.adViews
	local PlayTime = UseLocalizationResult.playTime
	local DateRange = UseLocalizationResult.dateRange
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 245 ]]
		-- upvalues: UseGetAdCampaignsModuleResult (copy), UseGetCampaignStatsModuleResult (copy), UseMemoResult (copy), WINDOWDAYS (upval), MSPERDAY (upval), p1 (copy), config (upval), ToStartMsFunction (upval), CampaignEndMsFunction (upval), CampaignEndExclusiveMsFunction (upval), GamePlays (copy), IconName (upval), UseGetCampaignStatsModuleResult3 (copy), AnalyticsUnitModule (upval), StatsCardValueFormatModule (upval), IconPosition (upval), AdClicks (copy), AdViews (copy), PlayTime (copy), formatDateRange (upval), DateRange (copy)
		local UseGetCampaignStatsModuleResult1 = UseGetCampaignStatsModuleResult or {}
		local UseMemoResultDelta = UseMemoResult - WINDOWDAYS * MSPERDAY
		local Text = if p1 == nil then nil else tostring(p1)
		local List = {}
		local List1 = {}
		
		for _, value in UseGetAdCampaignsModuleResult or {} do
			if Text ~= nil and value.targetUniverseId == Text then
				local UseGetCampaignStatsModuleResultEntry = UseGetCampaignStatsModuleResult1[value.id] or config
				local StartMs = ToStartMsFunction(value.schedule.startTime)
				local CampaignEndMsResult = CampaignEndMsFunction(StartMs, value.schedule.durationInDays)
				local IsCANCELLED = value.status == "CANCELLED"
				local CampaignEndExclusiveMsResult = CampaignEndExclusiveMsFunction(StartMs, value.schedule.durationInDays)
				
				if not IsCANCELLED and CampaignEndExclusiveMsResult > UseMemoResult then
					table.insert(List, {
						id = value.id,
						stats = UseGetCampaignStatsModuleResultEntry,
						startMs = StartMs,
						endMs = CampaignEndMsResult
					})
				elseif UseMemoResultDelta <= StartMs then
					table.insert(List1, {
						stats = UseGetCampaignStatsModuleResultEntry,
						startMs = StartMs,
						endMs = CampaignEndMsResult
					})
				end
			end
		end
		table.sort(List, function(A, B): boolean --[[ Line: 286 ]]
			return if A.startMs == B.startMs then A.id < B.id else B.startMs < A.startMs
		end)
		table.sort(List1, function(A, B): boolean --[[ Line: 293 ]]
			return B.endMs < A.endMs
		end)
		
		local function buildSummaryCards(Stats) --[[ Line: 298 ]]
			-- upvalues: GamePlays (upval), IconName (upval), UseGetCampaignStatsModuleResult3 (upval), AnalyticsUnitModule (upval), StatsCardValueFormatModule (upval), IconPosition (upval), AdClicks (upval), AdViews (upval), PlayTime (upval)
			return {
				{
					deltaValue = 0,
					title = GamePlays,
					statValue = Stats.plays,
					statUnit = AnalyticsUnitModule.Scalar,
					statValueFormat = StatsCardValueFormatModule.Regular,
					statIcon = IconName.CirclePlay,
					statIconPosition = IconPosition.Left,
					deltaUnit = AnalyticsUnitModule.Percent,
					hasData = not UseGetCampaignStatsModuleResult3.plays
				},
				{
					deltaValue = 0,
					title = AdClicks,
					statValue = Stats.adClicks,
					statUnit = AnalyticsUnitModule.Scalar,
					statValueFormat = StatsCardValueFormatModule.Regular,
					statIcon = IconName.Crosshairs,
					statIconPosition = IconPosition.Left,
					deltaUnit = AnalyticsUnitModule.Percent,
					hasData = not UseGetCampaignStatsModuleResult3.adClicks
				},
				{
					deltaValue = 0,
					title = AdViews,
					statValue = Stats.adViews,
					statUnit = AnalyticsUnitModule.Scalar,
					statValueFormat = StatsCardValueFormatModule.Regular,
					statIcon = IconName.Eye,
					statIconPosition = IconPosition.Left,
					deltaUnit = AnalyticsUnitModule.Percent,
					hasData = not UseGetCampaignStatsModuleResult3.adViews
				},
				{
					deltaValue = 0,
					title = PlayTime,
					statValue = Stats.playtimeSeconds / 60,
					statUnit = AnalyticsUnitModule.Temporal,
					statIcon = IconName.Clock,
					statIconPosition = IconPosition.Left,
					deltaUnit = AnalyticsUnitModule.Percent,
					hasData = not UseGetCampaignStatsModuleResult3.playtimeSeconds
				}
			}
		end
		
		local ActiveCampaigns = {}
		
		for _, value1 in List do
			table.insert(ActiveCampaigns, {
				id = value1.id,
				dateText = formatDateRange(DateRange, value1.startMs, value1.endMs) or "",
				summaryCards = buildSummaryCards(value1.stats)
			})
		end
		local PastCampaigns = {}
		
		for _, value2 in List1 do
			table.insert(PastCampaigns, {
				dateText = formatDateRange(DateRange, value2.startMs, value2.endMs) or "",
				adViews = if UseGetCampaignStatsModuleResult3.adViews then nil else value2.stats.adViews,
				adClicks = if UseGetCampaignStatsModuleResult3.adClicks then nil else value2.stats.adClicks,
				gamePlays = if UseGetCampaignStatsModuleResult3.plays then nil else value2.stats.plays,
				labels = {
					adViews = AdViews,
					adClicks = AdClicks,
					gamePlays = GamePlays
				}
			})
		end
		return {
			activeCampaigns = ActiveCampaigns,
			pastCampaigns = PastCampaigns
		}
	end, {
		p1, UseGetAdCampaignsModuleResult, UseGetCampaignStatsModuleResult,
		UseGetCampaignStatsModuleResult3, UseMemoResult, GamePlays, AdClicks, AdViews,
		PlayTime, DateRange,
		UseLocalizationResult[LocalizationModule.RobloxLocaleIdKey]
	})
	local HasCampaigns: boolean = #UseMemoResult1.activeCampaigns > 0 or #UseMemoResult1.pastCampaigns > 0
	local IsFailed: boolean = UseGetAdCampaignsModuleResult2 == "Failed" or Flag and UseGetCampaignStatsModuleResult2 == "Failed"
	local IsNotReady: boolean = not IsFailed and (UseGetAdCampaignsModuleResult2 == "NotReady" or (Flag and UseGetCampaignStatsModuleResult2 == "NotReady" or not HasCampaigns and (p1 ~= nil and UseGetAdCampaignEligibilityModuleResult2 == "NotReady")))
	local Offer = if UseGetAdCampaignEligibilityModuleResult == nil then nil else UseGetAdCampaignEligibilityModuleResult.offer
	local SelectableOffers = if FFlagEnablePaidAdsModule then AdCampaignEligibilityUtilsModule.getSelectableOffers(UseGetAdCampaignEligibilityModuleResult) else nil
	local DurationDays = if Offer == nil then nil else Offer.durationDays
	local HasFreeCredit = AdCampaignEligibilityUtilsModule.hasFreeCredit(UseGetAdCampaignEligibilityModuleResult)
	local HasFreeCredit1 = AdCampaignEligibilityUtilsModule.isEligibleForFreePromotion(UseGetAdCampaignEligibilityModuleResult) and HasFreeCredit
	local CanCreateCampaign = AdCampaignEligibilityUtilsModule.canCreateCampaign(UseGetAdCampaignEligibilityModuleResult)
	local AdsManager = UseLocalizationResult.adsManager
	local UseOpenWebViewWithResumeRefreshModuleResult = nil
	UseOpenWebViewWithResumeRefreshModuleResult = if FFlagBuildAdsManagerUniverseUrlModule then UseOpenWebViewWithResumeRefreshModule(GetAdsManagerUrlModule.getAdsManagerUrl(p1), AdsManager, UseCreateAdCampaignModuleResult.refresh) else UseOpenWebViewWithResumeRefreshModule(GetAdsManagerUrlModule.getDefaultAdsManagerUrl(), AdsManager, UseCreateAdCampaignModuleResult.refresh)
	
	return {
		activeCampaigns = UseMemoResult1.activeCampaigns,
		universeId = if FFlagBuildAdsManagerUniverseUrlModule then p1 else nil,
		pastCampaignsTitle = UseLocalizationResult.pastCampaigns,
		pastCampaigns = UseMemoResult1.pastCampaigns,
		errorText = UseLocalizationResult.error,
		isLoading = IsNotReady,
		isFailed = IsFailed,
		hasCampaigns = HasCampaigns,
		emptyTitle = if HasFreeCredit1 then UseLocalizationResult.emptyTitleFree else UseLocalizationResult.emptyTitle,
		emptySubtitle = if HasFreeCredit1 then UseLocalizationResult.emptySubtitleFree else UseLocalizationResult.emptySubtitle,
		createButtonText = UseLocalizationResult.create,
		createButtonIsExternal = not CanCreateCampaign,
		isPromotionCreatePending = UseCreateAdCampaignModuleResult.isCreatePending or UseStateResult3,
		hasPromotionCreateError = UseCreateAdCampaignModuleResult.hasCreateError,
		promotionCreateErrorKind = UseCreateAdCampaignModuleResult.createErrorKind,
		showCreateSuccessToast = UseStateResult4 and (not IsNotReady and not IsFailed),
		createSuccessToastText = UseLocalizationResult.createSuccess,
		onDismissCreateSuccessToast = UseResult1,
		isPromotionSheetOpen = UseStateResult,
		adCampaignDurationDays = DurationDays,
		adCampaignEstimatedPriceRobux = if Offer == nil then nil else Offer.displayAmountRobux,
		adCampaignOffers = AdCampaignOffers,
		adCampaignRunStartTimeMs = UseStateResult1,
		adCampaignRunEndTimeMs = if UseStateResult1 == nil or DurationDays == nil then nil else UseStateResult1 + math.max(0, DurationDays - 1) * MSPERDAY,
		onCreatePrimary = ReactModule.useCallback(function() --[[ Line: 420 ]]
			-- upvalues: UseStateResult3 (copy), CanCreateCampaign (copy), UseStateResult2_3 (copy), FFlagEnablePaidAdsModule (upval), UseCreateAdCampaignModuleResult (copy), UseStateResult2_1 (copy), Callback (ref), SelectableOffers (copy), UseStateResult2 (copy), UseOpenWebViewWithResumeRefreshModuleResult (ref)
			if UseStateResult3 then return end
			if not CanCreateCampaign then
				UseOpenWebViewWithResumeRefreshModuleResult()
				
				return
			end
			UseStateResult2_3(false)
			
			if not FFlagEnablePaidAdsModule then
				UseCreateAdCampaignModuleResult.clearCreateError()
			end
			UseStateResult2_1(DateTime.now().UnixTimestampMillis)
			
			if FFlagEnablePaidAdsModule then
				Callback(function(p7) --[[ Line: 433 ]]
					-- upvalues: UseCreateAdCampaignModuleResult (upval), SelectableOffers (upval)
					return if UseCreateAdCampaignModuleResult.hasCreateError and p7 ~= nil then p7 else SelectableOffers
				end)
			end
			UseStateResult2(true)
		end, {
			UseStateResult3, CanCreateCampaign,
			UseOpenWebViewWithResumeRefreshModuleResult,
			UseCreateAdCampaignModuleResult.clearCreateError,
			UseCreateAdCampaignModuleResult.hasCreateError, SelectableOffers
		}),
		onClosePromotionSheet = UseResult,
		onCreateCampaign = ReactModule.useCallback(function(p7) --[[ Line: 453 ]]
			-- upvalues: UseRefResult (copy), UseGetAdCampaignEligibilityModuleResult (copy), UseCreateAdCampaignModuleResult (copy), FFlagEnablePaidAdsModule (upval)
			UseRefResult.current = UseGetAdCampaignEligibilityModuleResult
			UseCreateAdCampaignModuleResult.createCampaign(if FFlagEnablePaidAdsModule then p7 else nil)
		end, {
			UseGetAdCampaignEligibilityModuleResult,
			UseCreateAdCampaignModuleResult.createCampaign
		})
	}
end