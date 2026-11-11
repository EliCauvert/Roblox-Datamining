local Parent = script.Parent.Parent
local HttpRequestModule = require(Parent.HttpRequest)

return {
	networkImpl = HttpRequestModule.config({
		requestFunction = HttpRequestModule.requestFunctions.HttpRbxApi,
		maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("FriendsMenuHttpRetryCount", 4) else nil
	}),
	sortFriendsByCorrectedPresenceAndRank = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).User.sortFriendsByCorrectedPresenceAndRank
}