local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local localizationModule = require(parent.Localization)
local useLocalization = localizationModule.Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useGetAdCampaignsModule = require(script.Parent.useGetAdCampaigns)
local useGetCampaignStatsModule = require(script.Parent.useGetCampaignStats)
local campaignStatsModule = require(parent.DataHydration.CampaignStats)
local _ = require(script.Parent.AdsStatsView)
local _ = require(script.Parent.PastCampaignRow)
local _ = require(buildExperience.Components.Analytics.StatsCard.StatsCard)
local statsCardUnitModule = require(buildExperience.Components.Analytics.StatsCard.StatsCardUnit)
local statsCardValueFormatModule = require(buildExperience.Components.Analytics.StatsCard.StatsCardValueFormat)
local foundationModule = require(parent.Foundation)
local iconName = foundationModule.Enums.IconName
local iconPosition = foundationModule.Enums.IconPosition
local WINDOW_DAYS = campaignStatsModule.WINDOW_DAYS
local t = {
	plays = 0,
	adClicks = 0,
	adViews = 0,
	playtimeSeconds = 0
}

local function _(p1)
	if type(p1) ~= "string" then
		return 0
	end
	local ok, status = pcall(DateTime.fromIsoDate, p1)
	
	return if ok and status ~= nil then status.UnixTimestampMillis else 0
end

local _ = function(p1, p2)
	return p1 + math.max(0, p2 - 1) * 86400000
end

local _ = function(p1, p2)
	return p1 + math.max(0, p2) * 86400000
end

local _ = function(a)
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
		return t[p4] or "{" .. p8 .. "}"
	end)
end

local _ = function(p1, p2, p3)
	-- upvalues: statsCardUnitModule (ref), statsCardValueFormatModule (ref), iconPosition (ref)
	return {
		deltaValue = 0,
		title = p1,
		statValue = p2,
		statUnit = statsCardUnitModule.Scalar,
		statValueFormat = statsCardValueFormatModule.Regular,
		statIcon = p3,
		statIconPosition = iconPosition.Left,
		deltaUnit = statsCardUnitModule.Percent
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: useGetAdCampaignsModule (ref), useGetCampaignStatsModule (ref), reactModule (ref), useLocalization (ref), localizationStringsModule (ref), localizationModule (ref), WINDOW_DAYS (ref), t (ref), iconName (ref), statsCardUnitModule (ref), statsCardValueFormatModule (ref), iconPosition (ref), formatDateRange (ref)
	local var1, var2 = useGetAdCampaignsModule(p2)
	local var3, var4 = useGetCampaignStatsModule(p1, p3)
	local var5 = reactModule.useMemo(function()
		-- upvalues: p4 (ref)
		return if p4 == nil then DateTime.now().UnixTimestampMillis else p4
	end, { p4 })
	local var6 = useLocalization({
		gamePlays = localizationStringsModule.ADS_STATS_GAME_PLAYS,
		adClicks = localizationStringsModule.ADS_STATS_AD_CLICKS,
		adViews = localizationStringsModule.ADS_STATS_AD_VIEWS,
		playTime = localizationStringsModule.ADS_STATS_PLAY_TIME,
		pastCampaigns = localizationStringsModule.ADS_STATS_PAST_CAMPAIGNS,
		error = localizationStringsModule.ADS_STATS_ERROR,
		dateRange = localizationStringsModule.ADS_STATS_DATE_RANGE
	})
	local gamePlays = var6.gamePlays
	local adClicks = var6.adClicks
	local adViews = var6.adViews
	local playTime = var6.playTime
	local pastCampaigns = var6.pastCampaigns
	local error = var6.error
	local dateRange = var6.dateRange
	local var7 = if var2 ~= "Failed" then var4 == "Failed" else true
	local var8 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var3 (ref), var5 (ref), WINDOW_DAYS (copy), p1 (ref), t (copy), gamePlays (ref), iconName (copy), statsCardUnitModule (copy), statsCardValueFormatModule (copy), iconPosition (copy), adClicks (ref), adViews (ref), playTime (ref), formatDateRange (copy), dateRange (ref)
		local var9 = var1 or {}
		local var10 = var3 or {}
		local var11 = var5 - WINDOW_DAYS * 86400000
		local var12 = if p1 ~= nil then nil else tostring(p1)
		local t_1 = {}
		local t_2 = {}
		
		for i, v in var9 do
			if var12 ~= nil and v.targetUniverseId == var12 then
				local var13
				local id = var10[v.id] or t
				local startTime = v.schedule.startTime
				
				if type(startTime) == "string" then
					local ok, status = pcall(DateTime.fromIsoDate, startTime)
					var13 = if ok and status ~= nil then status.UnixTimestampMillis else 0
				else
					var13 = 0
				end
				local var14 = var13 + math.max(0, v.schedule.durationInDays - 1) * 86400000
				
				if v.status ~= "CANCELLED" and var5 < var13 + math.max(0, v.schedule.durationInDays) * 86400000 then
					table.insert(t_1, { id = v.id, stats = id, startMs = var13, endMs = var14 })
				elseif var11 <= var13 then
					table.insert(t_2, { stats = id, startMs = var13, endMs = var14 })
				end
			end
		end
		table.sort(t_1, function(p5, p6)
			return if p5.startMs == p6.startMs then p5.id < p6.id else p6.startMs < p5.startMs
		end)
		table.sort(t_2, function(p5, p6)
			return p6.endMs < p5.endMs
		end)
		
		local function buildSummaryCards(p5)
			-- upvalues: gamePlays (copy), iconName (copy), statsCardUnitModule (copy), statsCardValueFormatModule (copy), iconPosition (copy), adClicks (copy), adViews (copy), playTime (copy)
			return {
				{
					deltaValue = 0,
					title = gamePlays,
					statValue = p5.plays,
					statUnit = statsCardUnitModule.Scalar,
					statValueFormat = statsCardValueFormatModule.Regular,
					statIcon = iconName.CirclePlay,
					statIconPosition = iconPosition.Left,
					deltaUnit = statsCardUnitModule.Percent
				},
				{
					deltaValue = 0,
					title = adClicks,
					statValue = p5.adClicks,
					statUnit = statsCardUnitModule.Scalar,
					statValueFormat = statsCardValueFormatModule.Regular,
					statIcon = iconName.Crosshairs,
					statIconPosition = iconPosition.Left,
					deltaUnit = statsCardUnitModule.Percent
				},
				{
					deltaValue = 0,
					title = adViews,
					statValue = p5.adViews,
					statUnit = statsCardUnitModule.Scalar,
					statValueFormat = statsCardValueFormatModule.Regular,
					statIcon = iconName.Eye,
					statIconPosition = iconPosition.Left,
					deltaUnit = statsCardUnitModule.Percent
				},
				{
					deltaValue = 0,
					title = playTime,
					statValue = p5.playtimeSeconds / 60,
					statUnit = statsCardUnitModule.Temporal,
					statIcon = iconName.Clock,
					statIconPosition = iconPosition.Left,
					deltaUnit = statsCardUnitModule.Percent
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
		p1, var1, var3, var5, gamePlays, adClicks, adViews, playTime, dateRange,
		var6[localizationModule.RobloxLocaleIdKey]
	})
	
	return {
		activeCampaigns = var8.activeCampaigns,
		pastCampaignsTitle = pastCampaigns,
		pastCampaigns = var8.pastCampaigns,
		errorText = error,
		isLoading = not var7 and (if var2 ~= "NotReady" then var4 == "NotReady" else true),
		isFailed = var7
	}
end