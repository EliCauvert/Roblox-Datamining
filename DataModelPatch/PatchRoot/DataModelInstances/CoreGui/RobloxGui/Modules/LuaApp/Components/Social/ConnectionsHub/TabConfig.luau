local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local Packages = CorePackages.Workspace.Packages
local AppPage = require(Packages.RobloxAppEnums).AppPage
local TabConfig = {
	{
		textKey = "Feature.AddFriends.Heading.FindPeople",
		id = AppPage.CoHubAddConnections,
		getScreen = function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.AddFriends.AddFriendsUniversalAppWrapper)
		end
	},
	{
		textKey = "Feature.Friends.Heading.MyConnections",
		id = AppPage.CoHubMyConnections,
		getScreen = function()
			-- upvalues: Modules (copy)
			return require(Modules.LuaApp.Components.FriendsLanding.FriendsLandingUniversalAppWrapper.Container)
		end
	}
}

if require(Packages.SharedFlags).FFlagFriendsActivityFeedEnabled then
	table.insert(TabConfig, require(CorePackages.Workspace.Packages.FriendsActivityFeed).getActivitiesTabConfig())
end
return TabConfig