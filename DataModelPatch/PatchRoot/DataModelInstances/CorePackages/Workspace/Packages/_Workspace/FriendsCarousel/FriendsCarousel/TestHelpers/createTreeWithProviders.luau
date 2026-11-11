local FriendsCarousel = script:FindFirstAncestor("FriendsCarousel")
local Parent = FriendsCarousel.Parent
local ReactModule = require(Parent.React)
local TestHelpers = require(Parent.Dev.SocialTestHelpers).TestHelpers
local MockAnalyticsModule = require(script.Parent.mockAnalytics)
local AnalyticsModule = require(FriendsCarousel.Analytics)

return function(p1, p2)
	-- upvalues: MockAnalyticsModule (copy), ReactModule (copy), AnalyticsModule (copy), TestHelpers (copy)
	local MockAnalytics = p2.mockAnalytics or MockAnalyticsModule()
	
	return ReactModule.createElement(AnalyticsModule.Context.Provider, { value = MockAnalytics.value }, { TestHelpers.createTreeWithProviders(p1, p2) }), MockAnalytics
end