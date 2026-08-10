local eventNamesModule = require(script.EventNames)
local funnelEventNamesModule = require(script.FunnelEventNames)
local recommendationSourceModule = require(script.RecommendationSource)
local sessionManagerModule = require(script.SessionManager)
local _ = require(script.Types)
local reportMomentsRealtimeEventModule = require(script.reportMomentsRealtimeEvent)

return {
	EventNames = eventNamesModule,
	FunnelEventNames = funnelEventNamesModule,
	RecommendationSource = recommendationSourceModule,
	SessionManager = sessionManagerModule,
	fireAnalyticsEvent = require(script.fireAnalyticsEvent),
	fireFunnelAnalyticsEvent = require(script.fireFunnelAnalyticsEvent),
	reportMomentSkip = require(script.reportMomentSkip),
	reportMomentsFeedLoadAttempt = reportMomentsRealtimeEventModule.reportMomentsFeedLoadAttempt,
	reportMomentsFeedLoadMore = reportMomentsRealtimeEventModule.reportMomentsFeedLoadMore,
	reportMomentsFeedMediaLoad = reportMomentsRealtimeEventModule.reportMomentsFeedMediaLoad,
	reportMomentsFeedState = reportMomentsRealtimeEventModule.reportMomentsFeedState,
	reportMomentsSurfaceLoadAbort = reportMomentsRealtimeEventModule.reportMomentsSurfaceLoadAbort,
	reportMomentsViewBegan = reportMomentsRealtimeEventModule.reportMomentsViewBegan
}