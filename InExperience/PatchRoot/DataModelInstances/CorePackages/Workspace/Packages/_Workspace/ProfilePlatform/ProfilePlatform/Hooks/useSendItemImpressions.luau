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

return function(p1, p2, p3, p4, p5)
	-- upvalues: useRoactService (ref), appEventIngestService (ref), roactAnalytics (ref), appPage (ref), useProfileAnalyticsContextModule (ref), reactModule (ref), eventNamesModule (ref), sendItemImpressions (ref)
	local var1 = useRoactService(appEventIngestService)
	local var2 = useRoactService(roactAnalytics)
	local profilePlatform = appPage.ProfilePlatform
	local var3 = useProfileAnalyticsContextModule()
	
	return reactModule.useCallback(function(p6)
		-- upvalues: var3 (ref), eventNamesModule (copy), p5 (ref), sendItemImpressions (copy), var1 (ref), var2 (ref), p1 (ref), p2 (ref), profilePlatform (ref), p3 (ref), p4 (ref)
		var3.fireAnalyticsEvent(eventNamesModule.ProfileImpressionsSent, { component = p5 })
		
		if sendItemImpressions and sendItemImpressions.sendFromProfile then
			sendItemImpressions.sendFromProfile(var1, var2, p6, p1, p2, profilePlatform, p3, p4, p5)
		end
	end, {
		var2, p4, p5, p3, var1, profilePlatform, p1, p2, sendItemImpressions
	})
end