local appPage = require(script:FindFirstAncestor("DiscoveryUtils").Parent.RobloxAppEnums).AppPage
local t = { PAGE_TYPE_HOME = "Home" }

return {
	toAppPage = function(p0)
		-- upvalues: t (ref), appPage (ref)
		return if p0 == t.PAGE_TYPE_HOME then appPage.Home else nil
	end,
	fromAppPage = function(p1)
		-- upvalues: appPage (ref), t (ref)
		return if p1 == appPage.Home then t.PAGE_TYPE_HOME else nil
	end,
	OmniRecommendationsPageType = t
}