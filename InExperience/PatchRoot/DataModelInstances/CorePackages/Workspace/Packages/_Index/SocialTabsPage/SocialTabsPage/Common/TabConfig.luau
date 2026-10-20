local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local AppPage = require(SocialTabsPage.Parent.RobloxAppEnums).AppPage
local Friends = {
	tabLabelKey = "CommonUI.Features.Label.Friends",
	id = AppPage.SocialTabsFriends,
	getScreen = function()
		-- upvalues: SocialTabsPage (copy)
		return require(SocialTabsPage.Components.TabContent.FriendsTabContent)
	end
}
local Mutuals = {
	tabLabelKey = "Feature.Friends.Mutuals",
	id = AppPage.SocialTabsMutuals,
	getScreen = function()
		-- upvalues: SocialTabsPage (copy)
		return require(SocialTabsPage.Components.TabContent.MutualsTabContent)
	end
}

return {
	Friends = Friends,
	Mutuals = Mutuals,
	routeOrder = { Friends, Mutuals }
}