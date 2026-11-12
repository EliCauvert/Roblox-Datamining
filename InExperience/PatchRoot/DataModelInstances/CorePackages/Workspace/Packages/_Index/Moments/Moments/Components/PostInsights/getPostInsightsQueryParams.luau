local Parent = script:FindFirstAncestor("Moments").Parent
local CreatorAnalyticsModule = require(Parent.DataHydration.CreatorAnalytics)
local _ = require(Parent.MomentsTypes)
local _ = require(script.Parent.metricSeriesToChartPoints)
local Frozen = table.freeze({
	views = "MomentsLifetimeVideoViews",
	watchTime = "MomentsLifetimeWatchTime",
	watchTimeNoReplay = "MomentsLifetimeWatchTimeNoReplay",
	joins = "MomentsLifetimeJoins"
})

local function _(p1): string
	return (os.date("!%Y-%m-%dT%H:%M:%SZ", p1))
end

local _ = function(p1, p2)
	return math.floor(p1 / p2) * p2
end

return function(p1, p2: number)
	-- upvalues: CreatorAnalyticsModule (copy), Frozen (copy)
	local RecommendationMetadata = p1.recommendationMetadata
	local FeedItemId = if RecommendationMetadata == nil then nil else RecommendationMetadata.feedItemId
	
	if FeedItemId == nil or FeedItemId == "" or p1.creatorId == nil then
		return nil
	end
	local ScaledFloored = math.floor(p2 / 3600) * 3600
	local DateInfo = os.date("!%Y-%m-%dT%H:%M:%SZ", ScaledFloored)
	local _DateTime = if p1.createdAt == nil then nil else DateTime.fromIsoDate(p1.createdAt)
	local UnixTimestamp = if _DateTime == nil then nil else _DateTime.UnixTimestamp
	local Window = nil
	
	if UnixTimestamp == nil or p2 - UnixTimestamp >= 259200 then
		local ScaledCeiled = math.ceil((ScaledFloored - 2592000) / 86400) * 86400
		
		if UnixTimestamp ~= nil then
			ScaledCeiled = math.max(ScaledCeiled, math.floor(UnixTimestamp / 86400) * 86400)
		end
		Window = {
			bucketSeconds = 86400,
			granularity = CreatorAnalyticsModule.MetricGranularity.OneDay,
			startUnix = ScaledCeiled,
			endUnix = ScaledFloored
		}
	else
		Window = {
			bucketSeconds = 3600,
			granularity = CreatorAnalyticsModule.MetricGranularity.OneHour,
			startUnix = math.min(math.floor(UnixTimestamp / 3600) * 3600, ScaledFloored - 3600),
			endUnix = ScaledFloored
		}
	end
	local Filters = {
		{
			dimension = "FeedItem",
			values = { FeedItemId },
			operation = CreatorAnalyticsModule.FilterOperation.Equals
		}
	}
	
	local function _(Metric, Granularity, LookbackSeconds)
		-- upvalues: CreatorAnalyticsModule (upval), p1 (copy), DateInfo (copy), Filters (copy)
		return {
			resourceType = CreatorAnalyticsModule.ResourceType.Creator,
			resourceId = tostring(p1.creatorId),
			metric = Metric,
			granularity = Granularity,
			lookbackSeconds = LookbackSeconds,
			endTime = DateInfo,
			filters = Filters
		}
	end
	
	local None = CreatorAnalyticsModule.MetricGranularity.None
	
	return {
		views = {
			metric = "MomentsVideoViews",
			resourceType = CreatorAnalyticsModule.ResourceType.Creator,
			resourceId = tostring(p1.creatorId),
			granularity = Window.granularity,
			lookbackSeconds = ScaledFloored - Window.startUnix,
			endTime = DateInfo,
			filters = Filters
		},
		window = Window,
		lifetime = {
			views = {
				lookbackSeconds = 2588400,
				resourceType = CreatorAnalyticsModule.ResourceType.Creator,
				resourceId = tostring(p1.creatorId),
				metric = Frozen.views,
				granularity = None,
				endTime = DateInfo,
				filters = Filters
			},
			watchTime = {
				lookbackSeconds = 2588400,
				resourceType = CreatorAnalyticsModule.ResourceType.Creator,
				resourceId = tostring(p1.creatorId),
				metric = Frozen.watchTime,
				granularity = None,
				endTime = DateInfo,
				filters = Filters
			},
			watchTimeNoReplay = {
				lookbackSeconds = 2588400,
				resourceType = CreatorAnalyticsModule.ResourceType.Creator,
				resourceId = tostring(p1.creatorId),
				metric = Frozen.watchTimeNoReplay,
				granularity = None,
				endTime = DateInfo,
				filters = Filters
			},
			joins = {
				lookbackSeconds = 2588400,
				resourceType = CreatorAnalyticsModule.ResourceType.Creator,
				resourceId = tostring(p1.creatorId),
				metric = Frozen.joins,
				granularity = None,
				endTime = DateInfo,
				filters = Filters
			}
		}
	}
end