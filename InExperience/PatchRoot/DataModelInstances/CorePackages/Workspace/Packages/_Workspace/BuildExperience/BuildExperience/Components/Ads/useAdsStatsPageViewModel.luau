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
	local var20
	local var21, var22 = reactModule.useState(false)
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		var13(false)
	end, {})
	local var25, var26 = reactModule.useState(false)
	local var27 = reactModule.useCallback(function()
		-- upvalues: var26 (ref)
		var26(false)
	end, {})
	local var28 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var28 (ref), var11 (ref), var13 (ref), var26 (ref), var22 (ref), var23 (ref)
		local current = var28.current
		var28.current = var11.isCreatePending
		
		if current and not var11.isCreatePending and not var11.hasCreateError then
			var13(false)
			var26(true)
			var22(var23.current ~= nil)
		end
	end, { var11.isCreatePending, var11.hasCreateError })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var9 (ref), var23 (ref), var21 (ref), var22 (ref)
		if var21 and ((var10 == "Ready" and (var9 ~= nil and var9 ~= var23.current)) or var10 == "Failed") then
			var23.current = nil
			var22(false)
		end
	end, { var21, var10, var9 })
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), var22 (ref), fFlagEnablePaidAdsModule (copy), var17 (write)
		var23.current = nil
		var22(false)
		
		if fFlagEnablePaidAdsModule then
			var17(nil)
		end
	end, { p1 })
	local var29 = reactModule.useMemo(function()
		-- upvalues: p4 (ref)
		return if p4 == nil then DateTime.now().UnixTimestampMillis else p4
	end, { p4 })
	local var30 = useLocalization({
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
	local gamePlays = var30.gamePlays
	local adClicks = var30.adClicks
	local adViews = var30.adViews
	local playTime = var30.playTime
	local pastCampaigns = var30.pastCampaigns
	local error = var30.error
	local dateRange = var30.dateRange
	local var31 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), var6 (ref), var29 (ref), WINDOW_DAYS (copy), mSPERDAY (copy), p1 (ref), t (copy), toStartMs (copy), campaignEndMs (copy), campaignEndExclusiveMs (copy), gamePlays (ref), iconName (copy), var8 (ref), analyticsUnitModule (copy), statsCardValueFormatModule (copy), iconPosition (copy), adClicks (ref), adViews (ref), playTime (ref), formatDateRange (copy), dateRange (ref)
		local var32 = var2 or {}
		local var33 = var6 or {}
		local var34 = var29 - WINDOW_DAYS * mSPERDAY
		local var35 = if p1 ~= nil then nil else tostring(p1)
		local t_1 = {}
		local t_2 = {}
		
		for i, v in var32 do
			if var35 ~= nil and v.targetUniverseId == var35 then
				local id = var33[v.id] or t
				local var36 = toStartMs(v.schedule.startTime)
				local var37 = campaignEndMs(var36, v.schedule.durationInDays)
				
				if not (v.status == "CANCELLED") and var29 < campaignEndExclusiveMs(var36, v.schedule.durationInDays) then
					table.insert(t_1, { id = v.id, stats = id, startMs = var36, endMs = var37 })
				elseif var34 <= var36 then
					table.insert(t_2, { stats = id, startMs = var36, endMs = var37 })
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
		p1, var2, var6, var8, var29, gamePlays, adClicks, adViews, playTime,
		dateRange, var30[localizationModule.RobloxLocaleIdKey]
	})
	local var38 = if #var31.activeCampaigns <= 0 then #var31.pastCampaigns > 0 else true
	local var39 = if var3 ~= "Failed" then var4 and var7 == "Failed" else true
	local var40 = not var39 and (if var3 ~= "NotReady" then if var4 then true else not var38 and (p1 ~= nil and var10 == "NotReady") else true)
	local var41 = var25 and (not var40 and not var39)
	local var42 = if var9 ~= nil then nil else var9.offer
	local var43 = if fFlagEnablePaidAdsModule then adCampaignEligibilityUtilsModule.getSelectableOffers(var9) else nil
	local var44 = if var42 ~= nil then nil else var42.durationDays
	local var45 = if var14 == nil or var44 == nil then nil else var14 + math.max(0, var44 - 1) * mSPERDAY
	local var46 = adCampaignEligibilityUtilsModule.isEligibleForFreePromotion(var9) and adCampaignEligibilityUtilsModule.hasFreeCredit(var9)
	
	if fFlagEnablePaidAdsModule then
		var20 = false
		
		if var9 ~= nil then
			var20 = false
			
			if var9.userEligible == true then
				var20 = false
				
				if var9.universeEligible == true then
					local _ = var43 ~= nil
				end
			end
		end
	else
		var20 = var46 and adCampaignEligibilityUtilsModule.hasUsableOffer(var9)
	end
	local var47 = useOpenWebViewWithResumeRefreshModule(var1(), var30.adsManager, var11.refresh)
	
	return {
		activeCampaigns = var31.activeCampaigns,
		pastCampaignsTitle = pastCampaigns,
		pastCampaigns = var31.pastCampaigns,
		errorText = error,
		isLoading = var40,
		isFailed = var39,
		hasCampaigns = var38,
		emptyTitle = if var46 then var30.emptyTitleFree else var30.emptyTitle,
		emptySubtitle = if var46 then var30.emptySubtitleFree else var30.emptySubtitle,
		showPromotionCard = var38 and var46,
		promotionFreeCreditsRemaining = adCampaignEligibilityUtilsModule.freeCreditsRemaining(var9),
		createButtonText = var30.create,
		createButtonIsExternal = not var20,
		isPromotionCreatePending = var11.isCreatePending or var21,
		hasPromotionCreateError = var11.hasCreateError,
		showCreateSuccessToast = var41,
		createSuccessToastText = var30.createSuccess,
		onDismissCreateSuccessToast = var27,
		isPromotionSheetOpen = var12,
		adCampaignDurationDays = var44,
		adCampaignEstimatedPriceRobux = if var42 ~= nil then nil else var42.displayAmountRobux,
		adCampaignOffers = var16,
		adCampaignRunStartTimeMs = var14,
		adCampaignRunEndTimeMs = var45,
		onCreatePrimary = reactModule.useCallback(function()
			-- upvalues: var21 (ref), var20 (ref), var26 (ref), fFlagEnablePaidAdsModule (copy), var11 (ref), var15 (ref), var17 (write), var43 (ref), var13 (ref), var47 (ref)
			if var21 then return end
			if not var20 then
				var47()
				
				return
			end
			var26(false)
			
			if not fFlagEnablePaidAdsModule then
				var11.clearCreateError()
			end
			var15(DateTime.now().UnixTimestampMillis)
			
			if fFlagEnablePaidAdsModule then
				var17(function(p7)
					-- upvalues: var11 (copy), var43 (copy)
					return if var11.hasCreateError and p7 ~= nil then p7 else var43
				end)
			end
			var13(true)
		end, {
			var21, var20, var47, var11.clearCreateError, var11.hasCreateError, var43
		}),
		onClosePromotionSheet = var24,
		onCreateCampaign = reactModule.useCallback(function(p7)
			-- upvalues: var23 (ref), var9 (ref), var11 (ref), fFlagEnablePaidAdsModule (copy)
			var23.current = var9
			var11.createCampaign(if fFlagEnablePaidAdsModule then p7 else nil)
		end, { var9, var11.createCampaign })
	}
end