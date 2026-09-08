local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local useLocalization = localizationModule.Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useGetAdCampaignsModule = require(script.Parent.useGetAdCampaigns)
local useGetCampaignStatsModule = require(script.Parent.useGetCampaignStats)
local useGetAdCampaignEligibilityModule = require(script.Parent.useGetAdCampaignEligibility)
local useCreateAdCampaignModule = require(script.Parent.useCreateAdCampaign)
local adCampaignEligibilityUtilsModule = require(script.Parent.adCampaignEligibilityUtils)
local adCampaignScheduleUtilsModule = require(script.Parent.adCampaignScheduleUtils)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local useOpenWebViewWithResumeRefreshModule = require(buildExperience.utils.useOpenWebViewWithResumeRefresh)
local campaignStatsModule = require(parent.DataHydration.CampaignStats)
local _ = require(script.Parent.AdsStatsView)
local _ = require(script.Parent.PastCampaignRow)
local _ = require(buildExperience.Components.Analytics.StatsCard.StatsCard)
local analyticsUnitModule = require(buildExperience.Analytics.AnalyticsUnit)
local statsCardValueFormatModule = require(buildExperience.Components.Analytics.StatsCard.StatsCardValueFormat)
local foundationModule = require(parent.Foundation)
local iconName = foundationModule.Enums.IconName
local iconPosition = foundationModule.Enums.IconPosition
local mSPERDAY = adCampaignScheduleUtilsModule.MS_PER_DAY
local toStartMs = adCampaignScheduleUtilsModule.toStartMs
local campaignEndMs = adCampaignScheduleUtilsModule.campaignEndMs
local campaignEndExclusiveMs = adCampaignScheduleUtilsModule.campaignEndExclusiveMs
local WINDOW_DAYS = campaignStatsModule.WINDOW_DAYS
local t = {
	plays = 0,
	adClicks = 0,
	adViews = 0,
	playtimeSeconds = 0
}
local var1 = urlBuilder.fromString("create:advertise")

local function _(a)
	return a / 60
end

local function formatDateRange(p1, p2, p3)
	-- upvalues: localizationStringsModule (ref)
	if p2 == nil or p3 == nil or p2 <= 0 then
		return nil
	end
	local t = {
		startDate = localizationStringsModule.formatCampaignDate(p2),
		endDate = localizationStringsModule.formatCampaignDate(p3)
	}
	
	return string.gsub(p1, "{(%w+)}", function(p4)
		-- upvalues: t (ref)
		return t[p4] or "{" .. p3 .. "}"
	end)
end

local _ = function(p1, p2, p3)
	-- upvalues: analyticsUnitModule (ref), statsCardValueFormatModule (ref), iconPosition (ref)
	return {
		deltaValue = 0,
		title = p1,
		statValue = p2,
		statUnit = analyticsUnitModule.Scalar,
		statValueFormat = statsCardValueFormatModule.Regular,
		statIcon = p3,
		statIconPosition = iconPosition.Left,
		deltaUnit = analyticsUnitModule.Percent
	}
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: useGetAdCampaignsModule (ref), useGetCampaignStatsModule (ref), useGetAdCampaignEligibilityModule (ref), adCampaignEligibilityUtilsModule (ref), useCreateAdCampaignModule (ref), reactModule (ref), useLocalization (ref), localizationStringsModule (ref), localizationModule (ref), WINDOW_DAYS (ref), mSPERDAY (ref), t (ref), toStartMs (ref), campaignEndMs (ref), campaignEndExclusiveMs (ref), iconName (ref), analyticsUnitModule (ref), statsCardValueFormatModule (ref), iconPosition (ref), formatDateRange (ref), useOpenWebViewWithResumeRefreshModule (ref), var1 (ref)
	local var2, var3 = useGetAdCampaignsModule(p2)
	local var4 = false
	
	if var2 ~= nil and p1 ~= nil then
		local var5 = tostring(p1)
		
		for i, v in var2 do
			if v.targetUniverseId == var5 then
				var4 = true
				break
			end
		end
	end
	local var6, var7 = useGetCampaignStatsModule(if var4 then p1 else nil, p3)
	local var8, var9 = useGetAdCampaignEligibilityModule(p1, p5)
	local var10 = adCampaignEligibilityUtilsModule.freeCreditsRemaining(var8)
	local var11 = useCreateAdCampaignModule(p1, nil, p6)
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(nil)
	local var16, var17 = reactModule.useState(false)
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		var13(false)
	end, {})
	local var20, var21 = reactModule.useState(false)
	local var22 = reactModule.useCallback(function()
		-- upvalues: var21 (ref)
		var21(false)
	end, {})
	local var23 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), var11 (ref), var13 (ref), var21 (ref), var17 (ref), var18 (ref)
		local current = var23.current
		var23.current = var11.isCreatePending
		
		if current and not var11.isCreatePending and not var11.hasCreateError then
			var13(false)
			var21(true)
			var17(var18.current ~= nil)
		end
	end, { var11.isCreatePending, var11.hasCreateError })
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), var9 (ref), var8 (ref), var10 (ref), var18 (ref), var17 (ref)
		if var16 and var9 == "Ready" and (var8 ~= nil and var10 ~= var18.current) then
			var18.current = nil
			var17(false)
		end
	end, { var16, var9, var8, var10 })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var17 (ref)
		var18.current = nil
		var17(false)
	end, { p1 })
	local var24 = reactModule.useMemo(function()
		-- upvalues: p4 (ref)
		return if p4 == nil then DateTime.now().UnixTimestampMillis else p4
	end, { p4 })
	local var25 = useLocalization({
		gamePlays = localizationStringsModule.ADS_STATS_GAME_PLAYS,
		adClicks = localizationStringsModule.ADS_STATS_AD_CLICKS,
		adViews = localizationStringsModule.ADS_STATS_AD_VIEWS,
		playTime = localizationStringsModule.ADS_STATS_PLAY_TIME,
		pastCampaigns = localizationStringsModule.ADS_STATS_PAST_CAMPAIGNS,
		error = localizationStringsModule.ADS_STATS_ERROR,
		dateRange = localizationStringsModule.ADS_STATS_DATE_RANGE,
		create = localizationStringsModule.PROMOTION_CREATE_BUTTON,
		emptyTitle = localizationStringsModule.ADS_STATS_EMPTY_TITLE,
		emptySubtitle = localizationStringsModule.ADS_STATS_EMPTY_SUBTITLE,
		emptyTitleFree = localizationStringsModule.ADS_STATS_EMPTY_TITLE_FREE,
		emptySubtitleFree = localizationStringsModule.ADS_STATS_EMPTY_SUBTITLE_FREE,
		adsManager = localizationStringsModule.ADS_STATS_ADS_MANAGER,
		createSuccess = localizationStringsModule.ADS_STATS_CREATE_SUCCESS
	})
	local gamePlays = var25.gamePlays
	local adClicks = var25.adClicks
	local adViews = var25.adViews
	local playTime = var25.playTime
	local pastCampaigns = var25.pastCampaigns
	local error = var25.error
	local dateRange = var25.dateRange
	local var26 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var6 (ref), var24 (ref), WINDOW_DAYS (copy), mSPERDAY (copy), p1 (ref), t (copy), toStartMs (copy), campaignEndMs (copy), campaignEndExclusiveMs (copy), gamePlays (ref), iconName (copy), analyticsUnitModule (copy), statsCardValueFormatModule (copy), iconPosition (copy), adClicks (ref), adViews (ref), playTime (ref), formatDateRange (copy), dateRange (ref)
		local var27 = var2 or {}
		local var28 = var6 or {}
		local var29 = var24 - WINDOW_DAYS * mSPERDAY
		local var30 = if p1 ~= nil then nil else tostring(p1)
		local t_1 = {}
		local t_2 = {}
		
		for i, v in var27 do
			if var30 ~= nil and v.targetUniverseId == var30 then
				local id = var28[v.id] or t
				local var31 = toStartMs(v.schedule.startTime)
				local var32 = campaignEndMs(var31, v.schedule.durationInDays)
				
				if not (v.status == "CANCELLED") and var24 < campaignEndExclusiveMs(var31, v.schedule.durationInDays) then
					table.insert(t_1, { id = v.id, stats = id, startMs = var31, endMs = var32 })
				elseif var29 <= var31 then
					table.insert(t_2, { stats = id, startMs = var31, endMs = var32 })
				end
			end
		end
		table.sort(t_1, function(p7, p8)
			return if p7.startMs == p8.startMs then p7.id < p8.id else p8.startMs < p7.startMs
		end)
		table.sort(t_2, function(p7, p8)
			return p8.endMs < p7.endMs
		end)
		
		local function buildSummaryCards(p7)
			-- upvalues: gamePlays (copy), iconName (copy), analyticsUnitModule (copy), statsCardValueFormatModule (copy), iconPosition (copy), adClicks (copy), adViews (copy), playTime (copy)
			return {
				{
					deltaValue = 0,
					title = gamePlays,
					statValue = p7.plays,
					statUnit = analyticsUnitModule.Scalar,
					statValueFormat = statsCardValueFormatModule.Regular,
					statIcon = iconName.CirclePlay,
					statIconPosition = iconPosition.Left,
					deltaUnit = analyticsUnitModule.Percent
				},
				{
					deltaValue = 0,
					title = adClicks,
					statValue = p7.adClicks,
					statUnit = analyticsUnitModule.Scalar,
					statValueFormat = statsCardValueFormatModule.Regular,
					statIcon = iconName.Crosshairs,
					statIconPosition = iconPosition.Left,
					deltaUnit = analyticsUnitModule.Percent
				},
				{
					deltaValue = 0,
					title = adViews,
					statValue = p7.adViews,
					statUnit = analyticsUnitModule.Scalar,
					statValueFormat = statsCardValueFormatModule.Regular,
					statIcon = iconName.Eye,
					statIconPosition = iconPosition.Left,
					deltaUnit = analyticsUnitModule.Percent
				},
				{
					deltaValue = 0,
					title = playTime,
					statValue = p7.playtimeSeconds / 60,
					statUnit = analyticsUnitModule.Temporal,
					statIcon = iconName.Clock,
					statIconPosition = iconPosition.Left,
					deltaUnit = analyticsUnitModule.Percent
				}
			}
		end
		
		local t_3 = {}
		
		for i_1, v_1 in t_1 do
			table.insert(t_3, {
				id = v_1.id,
				dateText = formatDateRange(dateRange, v_1.startMs, v_1.endMs) or "",
				summaryCards = buildSummaryCards(v_1.stats)
			})
		end
		local t_4 = {}
		
		for i_2, v_2 in t_2 do
			table.insert(t_4, {
				dateText = formatDateRange(dateRange, v_2.startMs, v_2.endMs) or "",
				adViews = v_2.stats.adViews,
				adClicks = v_2.stats.adClicks,
				gamePlays = v_2.stats.plays,
				labels = {
					adViews = adViews,
					adClicks = adClicks,
					gamePlays = gamePlays
				}
			})
		end
		return { activeCampaigns = t_3, pastCampaigns = t_4 }
	end, {
		p1, var2, var6, var24, gamePlays, adClicks, adViews, playTime, dateRange,
		var25[localizationModule.RobloxLocaleIdKey]
	})
	local var33 = if #var26.activeCampaigns <= 0 then #var26.pastCampaigns > 0 else true
	local var34 = if var3 ~= "Failed" then var4 and var7 == "Failed" else true
	local var35 = not var34 and (if var3 ~= "NotReady" then if var4 then true else not var33 and (p1 ~= nil and var9 == "NotReady") else true)
	local var36 = var20 and (not var35 and not var34)
	local var37 = if var8 ~= nil then nil else var8.offer
	local var38 = if var37 ~= nil then nil else var37.durationDays
	local var39 = if var14 == nil or var38 == nil then nil else var14 + math.max(0, var38 - 1) * mSPERDAY
	local var40 = adCampaignEligibilityUtilsModule.isEligibleForFreePromotion(var8) and adCampaignEligibilityUtilsModule.hasFreeCredit(var8)
	local var41 = var40 and adCampaignEligibilityUtilsModule.hasUsableOffer(var8)
	local var42 = useOpenWebViewWithResumeRefreshModule(var1(), var25.adsManager, var11.refresh)
	
	return {
		activeCampaigns = var26.activeCampaigns,
		pastCampaignsTitle = pastCampaigns,
		pastCampaigns = var26.pastCampaigns,
		errorText = error,
		isLoading = var35,
		isFailed = var34,
		hasCampaigns = var33,
		emptyTitle = if var40 then var25.emptyTitleFree else var25.emptyTitle,
		emptySubtitle = if var40 then var25.emptySubtitleFree else var25.emptySubtitle,
		showPromotionCard = var33 and var40,
		promotionFreeCreditsRemaining = adCampaignEligibilityUtilsModule.freeCreditsRemaining(var8),
		createButtonText = var25.create,
		createButtonIsExternal = not var41,
		isPromotionCreatePending = var11.isCreatePending or var16,
		hasPromotionCreateError = var11.hasCreateError,
		showCreateSuccessToast = var36,
		createSuccessToastText = var25.createSuccess,
		onDismissCreateSuccessToast = var22,
		isPromotionSheetOpen = var12,
		adCampaignDurationDays = var38,
		adCampaignEstimatedPriceRobux = if var37 ~= nil then nil else var37.displayAmountRobux,
		adCampaignRunStartTimeMs = var14,
		adCampaignRunEndTimeMs = var39,
		onCreatePrimary = reactModule.useCallback(function()
			-- upvalues: var16 (ref), var41 (ref), var21 (ref), var11 (ref), var15 (ref), var13 (ref), var42 (ref)
			if var16 then return end
			if var41 then
				var21(false)
				var11.clearCreateError()
				var15(DateTime.now().UnixTimestampMillis)
				var13(true)
				
				return
			end
			var42()
		end, { var16, var41, var42, var11.clearCreateError }),
		onClosePromotionSheet = var19,
		onCreateCampaign = reactModule.useCallback(function()
			-- upvalues: var18 (ref), var10 (ref), var11 (ref)
			var18.current = var10
			var11.createCampaign()
		end, { var10, var11.createCampaign })
	}
end