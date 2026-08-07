local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactAnalytics = require(parent.RoactServiceTags).RoactAnalytics
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local sendItemImpressions = require(parent.UnifiedLogging).SendItemImpressions
local appPage = require(parent.RobloxAppEnums).AppPage
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)

return function(p0, p1, p2, p3, p4) --[[ line: 19 ]]
	-- upvalues: useRoactService (ref), appEventIngestService (ref), roactAnalytics (ref), appPage (ref), useProfileAnalyticsContextModule (ref), reactModule (ref), eventNamesModule (ref), sendItemImpressions (ref)
	local var4 = useRoactService(appEventIngestService)
	local var5 = useRoactService(roactAnalytics)
	local profilePlatform = appPage.ProfilePlatform
	local var6 = useProfileAnalyticsContextModule()
	
	return reactModule.useCallback(function(p5) --[[ line: 31 ]]
		-- upvalues: var6 (ref), eventNamesModule (copy), p4 (ref), sendItemImpressions (copy), var4 (ref), var5 (ref), p0 (ref), p1 (ref), profilePlatform (ref), p2 (ref), p3 (ref)
		var6.fireAnalyticsEvent(eventNamesModule.ProfileImpressionsSent, { component = p4 })
		
		if sendItemImpressions and sendItemImpressions.sendFromProfile then
			sendItemImpressions.sendFromProfile(var4, var5, p5, p0, p1, profilePlatform, p2, p3, p4)
		end
	end, {
		var5, p3, p4, p2, var4, profilePlatform, p0, p1, sendItemImpressions
	})
end