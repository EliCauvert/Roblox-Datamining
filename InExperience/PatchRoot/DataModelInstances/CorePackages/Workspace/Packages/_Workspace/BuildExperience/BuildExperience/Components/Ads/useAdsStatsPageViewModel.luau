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
local _ = require(parent.DataHydration.CreatorAgentChat)
local fFlagEnablePaidAdsModule = require(buildExperience.Flags.FFlagEnablePaidAds)
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
	-- upvalues: useGetAdCampaignsModule (ref), useGetCampaignStatsModule (ref), useGetAdCampaignEligibilityModule (ref), useCreateAdCampaignModule (ref), reactModule (ref), fFlagEnablePaidAdsModule (ref), useLocalization (ref), localizationStringsModule (ref), localizationModule (ref), WINDOW_DAYS (ref), mSPERDAY (ref), t (ref), toStartMs (ref), campaignEndMs (ref), campaignEndExclusiveMs (ref), iconName (ref), analyticsUnitModule (ref), statsCardValueFormatModule (ref), iconPosition (ref), formatDateRange (ref), adCampaignEligibilityUtilsModule (ref), useOpenWebViewWithResumeRefreshModule (ref), var1 (ref)
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
	local var6, var7, var8 = useGetCampaignStatsModule(if var4 then p1 else nil, p3)
	local var9, var10 = useGetAdCampaignEligibilityModule(p1, p5)
	local var11 = useCreateAdCampaignModule(p1, nil, p6)
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(nil)
	local var16 = nil
	local var17 = nil
	
	if fFlagEnablePaidAdsModule then
		local var18, var19 = reactModule.useState(nil)
		var16 = var18
		var17 = var19
	end
	local var20, var21 = reactModule.useState(false)
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), fFlagEnablePaidAdsModule (copy), var11 (ref)
		var13(false)
		
		if fFlagEnablePaidAdsModule then
			var11.clearCreateError()
		end
	end, { var11.clearCreateError })
	local var24, var25 = reactModule.useState(false)
	local var26 = reactModule.useCallback(function()
		-- upvalues: var25 (ref)
		var25(false)
	end, {})
	local var27 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var27 (ref), var11 (ref), var13 (ref), var25 (ref), var21 (ref), var22 (ref)
		local current = var27.current
		var27.current = var11.isCreatePending
		
		if current and not var11.isCreatePending and not var11.hasCreateError then
			var13(false)
			var25(true)
			var21(var22.current ~= nil)
		end
	end, { var11.isCreatePending, var11.hasCreateError })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var9 (ref), var22 (ref), var20 (ref), var21 (ref)
		if var20 and ((var10 == "Ready" and (var9 ~= nil and var9 ~= var22.current)) or var10 == "Failed") then
			var22.current = nil
			var21(false)
		end
	end, { var20, var10, var9 })
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), var21 (ref), fFlagEnablePaidAdsModule (copy), var17 (write)
		var22.current = nil
		var21(false)
		
		if fFlagEnablePaidAdsModule then
			var17(nil)
		end
	end, { p1 })
	local var28 = reactModule.useMemo(function()
		-- upvalues: p4 (ref)
		return if p4 == nil then DateTime.now().UnixTimestampMillis else p4
	end, { p4 })
	local var29 = useLocalization({
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
	local gamePlays = var29.gamePlays
	local adClicks = var29.adClicks
	local adViews = var29.adViews
	local playTime = var29.playTime
	local pastCampaigns = var29.pastCampaigns
	local error = var29.error
	local dateRange = var29.dateRange
	local var30 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var6 (ref), var28 (ref), WINDOW_DAYS (copy), mSPERDAY (copy), p1 (ref), t (copy), toStartMs (copy), campaignEndMs (copy), campaignEndExclusiveMs (copy), gamePlays (ref), iconName (copy), var8 (ref), analyticsUnitModule (copy), statsCardValueFormatModule (copy), iconPosition (copy), adClicks (ref), adViews (ref), playTime (ref), formatDateRange (copy), dateRange (ref)
		local var31 = var2 or {}
		local var32 = var6 or {}
		local var33 = var28 - WINDOW_DAYS * mSPERDAY
		local var34 = if p1 ~= nil then nil else tostring(p1)
		local t_1 = {}
		local t_2 = {}
		
		for i, v in var31 do
			if var34 ~= nil and v.targetUniverseId == var34 then
				local id = var32[v.id] or t
				local var35 = toStartMs(v.schedule.startTime)
				local var36 = campaignEndMs(var35, v.schedule.durationInDays)
				
				if not (v.status == "CANCELLED") and var28 < campaignEndExclusiveMs(var35, v.schedule.durationInDays) then
					table.insert(t_1, { id = v.id, stats = id, startMs = var35, endMs = var36 })
				elseif var33 <= var35 then
					table.insert(t_2, { stats = id, startMs = var35, endMs = var36 })
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
			-- upvalues: gamePlays (copy), iconName (copy), var8 (copy), analyticsUnitModule (copy), statsCardValueFormatModule (copy), iconPosition (copy), adClicks (copy), adViews (copy), playTime (copy)
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
					hasData = not var8.plays
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
					hasData = not var8.adClicks
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
					hasData = not var8.adViews
				},
				{
					deltaValue = 0,
					title = playTime,
					statValue = p7.playtimeSeconds / 60,
					statUnit = analyticsUnitModule.Temporal,
					statIcon = iconName.Clock,
					statIconPosition = iconPosition.Left,
					deltaUnit = analyticsUnitModule.Percent,
					hasData = not var8.playtimeSeconds
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
				adViews = if var8.adViews then nil else v_2.stats.adViews,
				adClicks = if var8.adClicks then nil else v_2.stats.adClicks,
				gamePlays = if var8.plays then nil else v_2.stats.plays,
				labels = {
					adViews = adViews,
					adClicks = adClicks,
					gamePlays = gamePlays
				}
			})
		end
		return { activeCampaigns = t_3, pastCampaigns = t_4 }
	end, {
		p1, var2, var6, var8, var28, gamePlays, adClicks, adViews, playTime,
		dateRange, var29[localizationModule.RobloxLocaleIdKey]
	})
	local var37 = if #var30.activeCampaigns <= 0 then #var30.pastCampaigns > 0 else true
	local var38 = if var3 ~= "Failed" then var4 and var7 == "Failed" else true
	local var39 = not var38 and (if var3 ~= "NotReady" then if var4 then true else not var37 and (p1 ~= nil and var10 == "NotReady") else true)
	local var40 = var24 and (not var39 and not var38)
	local var41 = if var9 ~= nil then nil else var9.offer
	local var42 = if fFlagEnablePaidAdsModule then adCampaignEligibilityUtilsModule.getSelectableOffers(var9) else nil
	local var43 = if var41 ~= nil then nil else var41.durationDays
	local var44 = if var14 == nil or var43 == nil then nil else var14 + math.max(0, var43 - 1) * mSPERDAY
	local var45 = adCampaignEligibilityUtilsModule.isEligibleForFreePromotion(var9) and adCampaignEligibilityUtilsModule.hasFreeCredit(var9)
	local var46 = adCampaignEligibilityUtilsModule.canCreateCampaign(var9)
	local var47 = useOpenWebViewWithResumeRefreshModule(var1(), var29.adsManager, var11.refresh)
	
	return {
		activeCampaigns = var30.activeCampaigns,
		pastCampaignsTitle = pastCampaigns,
		pastCampaigns = var30.pastCampaigns,
		errorText = error,
		isLoading = var39,
		isFailed = var38,
		hasCampaigns = var37,
		emptyTitle = if var45 then var29.emptyTitleFree else var29.emptyTitle,
		emptySubtitle = if var45 then var29.emptySubtitleFree else var29.emptySubtitle,
		createButtonText = var29.create,
		createButtonIsExternal = not var46,
		isPromotionCreatePending = var11.isCreatePending or var20,
		hasPromotionCreateError = var11.hasCreateError,
		promotionCreateErrorKind = var11.createErrorKind,
		showCreateSuccessToast = var40,
		createSuccessToastText = var29.createSuccess,
		onDismissCreateSuccessToast = var26,
		isPromotionSheetOpen = var12,
		adCampaignDurationDays = var43,
		adCampaignEstimatedPriceRobux = if var41 ~= nil then nil else var41.displayAmountRobux,
		adCampaignOffers = var16,
		adCampaignRunStartTimeMs = var14,
		adCampaignRunEndTimeMs = var44,
		onCreatePrimary = reactModule.useCallback(function()
			-- upvalues: var20 (ref), var46 (ref), var25 (ref), fFlagEnablePaidAdsModule (copy), var11 (ref), var15 (ref), var17 (write), var42 (ref), var13 (ref), var47 (ref)
			if var20 then return end
			if not var46 then
				var47()
				
				return
			end
			var25(false)
			
			if not fFlagEnablePaidAdsModule then
				var11.clearCreateError()
			end
			var15(DateTime.now().UnixTimestampMillis)
			
			if fFlagEnablePaidAdsModule then
				var17(function(p7)
					-- upvalues: var11 (copy), var42 (copy)
					return if var11.hasCreateError and p7 ~= nil then p7 else var42
				end)
			end
			var13(true)
		end, {
			var20, var46, var47, var11.clearCreateError, var11.hasCreateError, var42
		}),
		onClosePromotionSheet = var23,
		onCreateCampaign = reactModule.useCallback(function(p7)
			-- upvalues: var22 (ref), var9 (ref), var11 (ref), fFlagEnablePaidAdsModule (copy)
			var22.current = var9
			var11.createCampaign(if fFlagEnablePaidAdsModule then p7 else nil)
		end, { var9, var11.createCampaign })
	}
end