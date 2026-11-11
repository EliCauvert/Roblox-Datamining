local FriendsActivityFeed = script:FindFirstAncestor("FriendsActivityFeed")
local AppPage = require(FriendsActivityFeed.Parent.RobloxAppEnums).AppPage

return function()
	-- upvalues: AppPage (copy), FriendsActivityFeed (copy)
	return {
		textKey = "Feature.Friends.Heading.Activities",
		id = AppPage.FriendsActivityFeed,
		getScreen = function()
			-- upvalues: FriendsActivityFeed (upval)
			return require(FriendsActivityFeed.Components.FriendsActivityFeed)
		end
	}
end