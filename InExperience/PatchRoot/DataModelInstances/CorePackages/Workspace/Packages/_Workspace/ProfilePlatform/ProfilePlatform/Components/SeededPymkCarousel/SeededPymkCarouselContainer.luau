local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseProfileScrollContextModule = require(ProfilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local SeededPymkCarouselModule = require(script.Parent.SeededPymkCarousel)
local AnalyticsSurface = {
	source = "ProfilePYMKCarousel",
	context = require(Parent.SocialLuaAnalytics).Analytics.Enums.Contexts.PlayerProfile
}

return ReactModule.memo(function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), UseProfileScrollContextModule (copy), ReactModule (copy), SeededPymkCarouselModule (copy), AppPage (copy), AnalyticsSurface (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseProfileScrollContextModuleResult = UseProfileScrollContextModule()
	local ProfileSessionId = UseProfileWrapperContextModuleResult.profileSessionId
	
	return if ProfileSessionId == nil then nil else ReactModule.createElement(SeededPymkCarouselModule, {
		profileSessionId = ProfileSessionId,
		seedUserId = UseProfileWrapperContextModuleResult.profileId,
		appPage = AppPage.ProfilePlatform,
		analyticsSurface = AnalyticsSurface,
		onRecommendationsShown = UseProfileScrollContextModuleResult.requestFullView,
		scrollViewPositionChangedSignal = UseProfileAnalyticsContextModuleResult.scrollViewPositionChangedSignal,
		layoutOrder = p1.layoutOrder
	})
end)