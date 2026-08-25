local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local appPage = require(socialTabsPage.Parent.RobloxAppEnums).AppPage
local t = {
	tabLabelKey = "CommonUI.Features.Label.Friends",
	id = appPage.SocialTabsFriends,
	getScreen = function()
		-- upvalues: socialTabsPage (ref)
		return require(socialTabsPage.Components.TabContent.FriendsTabContent)
	end
}
local t_1 = {
	tabLabelKey = "Feature.Friends.Mutuals",
	id = appPage.SocialTabsMutuals,
	getScreen = function()
		-- upvalues: socialTabsPage (ref)
		return require(socialTabsPage.Components.TabContent.MutualsTabContent)
	end
}

return { Friends = t, Mutuals = t_1, routeOrder = { t, t_1 } }