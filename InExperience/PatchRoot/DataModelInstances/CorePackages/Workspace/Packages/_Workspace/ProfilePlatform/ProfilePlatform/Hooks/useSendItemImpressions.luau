local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactAnalytics = require(Parent.RoactServiceTags).RoactAnalytics
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local SendItemImpressions = require(Parent.UnifiedLogging).SendItemImpressions
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)

return function(p1, p2, p3, p4, Component) --[[ Line: 19 ]]
	-- upvalues: UseRoactServiceFunction (copy), AppEventIngestService (copy), RoactAnalytics (copy), AppPage (copy), UseProfileAnalyticsContextModule (copy), ReactModule (copy), EventNamesModule (copy), SendItemImpressions (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local ProfilePlatform = AppPage.ProfilePlatform
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	
	return ReactModule.useCallback(function(p5) --[[ Line: 31 ]]
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), Component (copy), SendItemImpressions (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), p1 (copy), p2 (copy), ProfilePlatform (copy), p3 (copy), p4 (copy)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfileImpressionsSent, { component = Component })
		
		if SendItemImpressions and SendItemImpressions.sendFromProfile then
			SendItemImpressions.sendFromProfile(UseRoactServiceResult, UseRoactServiceResult1, p5, p1, p2, ProfilePlatform, p3, p4, Component)
		end
	end, {
		UseRoactServiceResult1, p4, Component, p3, UseRoactServiceResult,
		ProfilePlatform, p1, p2, SendItemImpressions
	})
end