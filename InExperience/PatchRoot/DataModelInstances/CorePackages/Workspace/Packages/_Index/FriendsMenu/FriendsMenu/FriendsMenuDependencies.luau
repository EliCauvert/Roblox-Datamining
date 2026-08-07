local parent = script.Parent.Parent
local httpRequestModule = require(parent.HttpRequest)

return {
	networkImpl = httpRequestModule.config({
		requestFunction = httpRequestModule.requestFunctions.HttpRbxApi,
		maxRetryCount = if require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("FriendsMenuHttpRetryCount", 4) else nil
	}),
	sortFriendsByCorrectedPresenceAndRank = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).User.sortFriendsByCorrectedPresenceAndRank
}