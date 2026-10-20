local AppPage = require(script:FindFirstAncestor("DiscoveryUtils").Parent.RobloxAppEnums).AppPage
local OmniRecommendationsPageType = { PAGE_TYPE_HOME = "Home" }

return {
	toAppPage = function(PAGETYPEHOME)
		-- upvalues: OmniRecommendationsPageType (copy), AppPage (copy)
		return if PAGETYPEHOME == OmniRecommendationsPageType.PAGE_TYPE_HOME then AppPage.Home else nil
	end,
	fromAppPage = function(Home)
		-- upvalues: AppPage (copy), OmniRecommendationsPageType (copy)
		return if Home == AppPage.Home then OmniRecommendationsPageType.PAGE_TYPE_HOME else nil
	end,
	OmniRecommendationsPageType = OmniRecommendationsPageType
}