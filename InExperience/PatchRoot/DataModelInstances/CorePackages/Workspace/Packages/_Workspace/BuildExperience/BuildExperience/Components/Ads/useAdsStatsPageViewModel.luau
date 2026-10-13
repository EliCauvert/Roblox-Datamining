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
local getAdsManagerUrlModule = require(script.Parent.getAdsManagerUrl)
local useOpenWebViewWithResumeRefreshModule = require(buildExperience.utils.useOpenWebViewWithResumeRefresh)
local campaignStatsModule = require(parent.DataHydration.CampaignStats)
local _ = require(script.Parent.AdsStatsView)
local _ = require(script.Parent.PastCampaignRow)
local _ = require(buildExperience.Components.Analytics.StatsCard.StatsCard)
local analyticsUnitModule = require(buildExperience.Analytics.AnalyticsUnit)
local statsCardValueFormatModule = require(buildExperience.Components.Analytics.StatsCard.StatsCardValueFormat)
local foundationModule = require(parent.Foundation)
local _ = require(parent.DataHydration.CreatorAgentChat)
local fFlagEnablePaidAdsModule = require(buildExperience.Flags.FFlagEnablePaidAds)
local fFlagBuildAdsManagerUniverseUrlModule = require(buildExperience.Flags.FFlagBuildAdsManagerUniverseUrl)
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

local _ = function(p1, p2, p3, p4)
	-- upvalues: analyticsUnitModule (ref), statsCardValueFormatModule (ref), iconPosition (ref)
	return {
		deltaValue = 0,
		title = p1,
		statValue = p2,
		statUnit = analyticsUnitModule.Scalar,
		statValueFormat = statsCardValueFormatModule.Regular,
		statIcon = p3,
		statIconPosition = iconPosition.Left,
		deltaUnit = analyticsUnitModule.Percent,
		hasData = p4
	}
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: useGetAdCampaignsModule (ref), useGetCampaignStatsModule (ref), useGetAdCampaignEligibilityModule (ref), useCreateAdCampaignModule (ref), reactModule (ref), fFlagEnablePaidAdsModule (ref), useLocalization (ref), localizationStringsModule (ref), localizationModule (ref), WINDOW_DAYS (ref), mSPERDAY (ref), t (ref), toStartMs (ref), campaignEndMs (ref), campaignEndExclusiveMs (ref), iconName (ref), analyticsUnitModule (ref), statsCardValueFormatModule (ref), iconPosition (ref), formatDateRange (ref), adCampaignEligibilityUtilsModule (ref), fFlagBuildAdsManagerUniverseUrlModule (ref), getAdsManagerUrlModule (ref), useOpenWebViewWithResumeRefreshModule (ref)
	local var1, var2 = useGetAdCampaignsModule(p2)
	local var3 = false
	
	if var1 ~= nil and p1 ~= nil then
		local var4 = tostring(p1)
		
		for i, v in var1 do
			if v.targetUniverseId == var4 then
				var3 = true
				break
			end
		end
	end
	local var5, var6, var7 = useGetCampaignStatsModule(if var3 then p1 else nil, p3)
	local var8, var9 = useGetAdCampaignEligibilityModule(p1, p5)
	local var10 = useCreateAdCampaignModule(p1, nil, p6)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(nil)
	local var15 = nil
	local var16 = nil
	
	if fFlagEnablePaidAdsModule then
		local var17, var18 = reactModule.useState(nil)
		var15 = var17
		var16 = var18
	end
	local var19, var20 = reactModule.useState(false)
	local var21 = reactModule.useRef(nil)
	local var22 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), fFlagEnablePaidAdsModule (copy), var10 (ref)
		var12(false)
		
		if fFlagEnablePaidAdsModule then
			var10.clearCreateError()
		end
	end, { var10.clearCreateError })
	local var23, var24 = reactModule.useState(false)
	local var25 = reactModule.useCallback(function()
		-- upvalues: var24 (ref)
		var24(false)
	end, {})
	local var26 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var26 (ref), var10 (ref), var12 (ref), var24 (ref), var20 (ref), var21 (ref)
		local current = var26.current
		var26.current = var10.isCreatePending
		
		if current and not var10.isCreatePending and not var10.hasCreateError then
			var12(false)
			var24(true)
			var20(var21.current ~= nil)
		end
	end, { var10.isCreatePending, var10.hasCreateError })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var8 (ref), var21 (ref), var19 (ref), var20 (ref)
		if var19 and ((var9 == "Ready" and (var8 ~= nil and var8 ~= var21.current)) or var9 == "Failed") then
			var21.current = nil
			var20(false)
		end
	end, { var19, var9, var8 })
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), var20 (ref), fFlagEnablePaidAdsModule (copy), var16 (write)
		var21.current = nil
		var20(false)
		
		if fFlagEnablePaidAdsModule then
			var16(nil)
		end
	end, { p1 })
	local var27 = reactModule.useMemo(function()
		-- upvalues: p4 (ref)
		return if p4 == nil then DateTime.now().UnixTimestampMillis else p4
	end, { p4 })
	local var28 = useLocalization({
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
	local gamePlays = var28.gamePlays
	local adClicks = var28.adClicks
	local adViews = var28.adViews
	local playTime = var28.playTime
	local pastCampaigns = var28.pastCampaigns
	local error = var28.error
	local dateRange = var28.dateRange
	local var29 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var5 (ref), var27 (ref), WINDOW_DAYS (copy), mSPERDAY (copy), p1 (ref), t (copy), toStartMs (copy), campaignEndMs (copy), campaignEndExclusiveMs (copy), gamePlays (ref), iconName (copy), var7 (ref), analyticsUnitModule (copy), statsCardValueFormatModule (copy), iconPosition (copy), adClicks (ref), adViews (ref), playTime (ref), formatDateRange (copy), dateRange (ref)
		local var30 = var1 or {}
		local var31 = var5 or {}
		local var32 = var27 - WINDOW_DAYS * mSPERDAY
		local var33 = if p1 ~= nil then nil else tostring(p1)
		local t_1 = {}
		local t_2 = {}
		
		for i, v in var30 do
			if var33 ~= nil and v.targetUniverseId == var33 then
				local id = var31[v.id] or t
				local var34 = toStartMs(v.schedule.startTime)
				local var35 = campaignEndMs(var34, v.schedule.durationInDays)
				
				if not (v.status == "CANCELLED") and var27 < campaignEndExclusiveMs(var34, v.schedule.durationInDays) then
					table.insert(t_1, { id = v.id, stats = id, startMs = var34, endMs = var35 })
				elseif var32 <= var34 then
					table.insert(t_2, { stats = id, startMs = var34, endMs = var35 })
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
			-- upvalues: gamePlays (copy), iconName (copy), var7 (copy), analyticsUnitModule (copy), statsCardValueFormatModule (copy), iconPosition (copy), adClicks (copy), adViews (copy), playTime (copy)
			return {
				{
					deltaValue = 0,
					title = gamePlays,
					statValue = p7.plays,
					statUnit = analyticsUnitModule.Scalar,
					statValueFormat = statsCardValueFormatModule.Regular,
					statIcon = iconName.CirclePlay,
					statIconPosition = iconPosition.Left,
					deltaUnit = analyticsUnitModule.Percent,
					hasData = not var7.plays
				},
				{
					deltaValue = 0,
					title = adClicks,
					statValue = p7.adClicks,
					statUnit = analyticsUnitModule.Scalar,
					statValueFormat = statsCardValueFormatModule.Regular,
					statIcon = iconName.Crosshairs,
					statIconPosition = iconPosition.Left,
					deltaUnit = analyticsUnitModule.Percent,
					hasData = not var7.adClicks
				},
				{
					deltaValue = 0,
					title = adViews,
					statValue = p7.adViews,
					statUnit = analyticsUnitModule.Scalar,
					statValueFormat = statsCardValueFormatModule.Regular,
					statIcon = iconName.Eye,
					statIconPosition = iconPosition.Left,
					deltaUnit = analyticsUnitModule.Percent,
					hasData = not var7.adViews
				},
				{
					deltaValue = 0,
					title = playTime,
					statValue = p7.playtimeSeconds / 60,
					statUnit = analyticsUnitModule.Temporal,
					statIcon = iconName.Clock,
					statIconPosition = iconPosition.Left,
					deltaUnit = analyticsUnitModule.Percent,
					hasData = not var7.playtimeSeconds
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
				adViews = if var7.adViews then nil else v_2.stats.adViews,
				adClicks = if var7.adClicks then nil else v_2.stats.adClicks,
				gamePlays = if var7.plays then nil else v_2.stats.plays,
				labels = {
					adViews = adViews,
					adClicks = adClicks,
					gamePlays = gamePlays
				}
			})
		end
		return { activeCampaigns = t_3, pastCampaigns = t_4 }
	end, {
		p1, var1, var5, var7, var27, gamePlays, adClicks, adViews, playTime,
		dateRange, var28[localizationModule.RobloxLocaleIdKey]
	})
	local var36 = if #var29.activeCampaigns <= 0 then #var29.pastCampaigns > 0 else true
	local var37 = if var2 ~= "Failed" then var3 and var6 == "Failed" else true
	local var38 = not var37 and (if var2 ~= "NotReady" then if var3 then true else not var36 and (p1 ~= nil and var9 == "NotReady") else true)
	local var39 = var23 and (not var38 and not var37)
	local var40 = if var8 ~= nil then nil else var8.offer
	local var41 = if fFlagEnablePaidAdsModule then adCampaignEligibilityUtilsModule.getSelectableOffers(var8) else nil
	local var42 = if var40 ~= nil then nil else var40.durationDays
	local var43 = if var13 == nil or var42 == nil then nil else var13 + math.max(0, var42 - 1) * mSPERDAY
	local var44 = adCampaignEligibilityUtilsModule.isEligibleForFreePromotion(var8) and adCampaignEligibilityUtilsModule.hasFreeCredit(var8)
	local var45 = adCampaignEligibilityUtilsModule.canCreateCampaign(var8)
	local var46 = if var44 then var28.emptyTitleFree else var28.emptyTitle
	local var47 = if var44 then var28.emptySubtitleFree else var28.emptySubtitle
	local adsManager = var28.adsManager
	local var48 = if fFlagBuildAdsManagerUniverseUrlModule then useOpenWebViewWithResumeRefreshModule(getAdsManagerUrlModule.getAdsManagerUrl(p1), adsManager, var10.refresh) else useOpenWebViewWithResumeRefreshModule(getAdsManagerUrlModule.getDefaultAdsManagerUrl(), adsManager, var10.refresh)
	
	return {
		activeCampaigns = var29.activeCampaigns,
		universeId = if fFlagBuildAdsManagerUniverseUrlModule then p1 else nil,
		pastCampaignsTitle = pastCampaigns,
		pastCampaigns = var29.pastCampaigns,
		errorText = error,
		isLoading = var38,
		isFailed = var37,
		hasCampaigns = var36,
		emptyTitle = var46,
		emptySubtitle = var47,
		createButtonText = var28.create,
		createButtonIsExternal = not var45,
		isPromotionCreatePending = var10.isCreatePending or var19,
		hasPromotionCreateError = var10.hasCreateError,
		promotionCreateErrorKind = var10.createErrorKind,
		showCreateSuccessToast = var39,
		createSuccessToastText = var28.createSuccess,
		onDismissCreateSuccessToast = var25,
		isPromotionSheetOpen = var11,
		adCampaignDurationDays = var42,
		adCampaignEstimatedPriceRobux = if var40 ~= nil then nil else var40.displayAmountRobux,
		adCampaignOffers = var15,
		adCampaignRunStartTimeMs = var13,
		adCampaignRunEndTimeMs = var43,
		onCreatePrimary = reactModule.useCallback(function()
			-- upvalues: var19 (ref), var45 (ref), var24 (ref), fFlagEnablePaidAdsModule (copy), var10 (ref), var14 (ref), var16 (write), var41 (ref), var12 (ref), var48 (write)
			if var19 then return end
			if not var45 then
				var48()
				
				return
			end
			var24(false)
			
			if not fFlagEnablePaidAdsModule then
				var10.clearCreateError()
			end
			var14(DateTime.now().UnixTimestampMillis)
			
			if fFlagEnablePaidAdsModule then
				var16(function(p7)
					-- upvalues: var10 (copy), var41 (copy)
					return if var10.hasCreateError and p7 ~= nil then p7 else var41
				end)
			end
			var12(true)
		end, {
			var19, var45, var48, var10.clearCreateError, var10.hasCreateError, var41
		}),
		onClosePromotionSheet = var22,
		onCreateCampaign = reactModule.useCallback(function(p7)
			-- upvalues: var21 (ref), var8 (ref), var10 (ref), fFlagEnablePaidAdsModule (copy)
			var21.current = var8
			var10.createCampaign(if fFlagEnablePaidAdsModule then p7 else nil)
		end, { var8, var10.createCampaign })
	}
end