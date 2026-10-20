local Parent = script.Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local SocialTabStateNetworking = require(Parent.Lumberyak).Logger.new(nil, "SocialTabState"):new("SocialTabState Networking")
local ConfigResult = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "SocialTab.NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: SocialTabStateNetworking (copy), HttpRequest (copy)
			SocialTabStateNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: SocialTabStateNetworking (copy)
			SocialTabStateNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("SocialTabStateHttpRetryCount", 3)
	})
})

return {
	Rodux = require(Parent.Rodux),
	RoduxNetworking = ConfigResult,
	ShowContactImporterParams = require(Parent.ContactImporter).ShowContactImporterParams,
	AppChatNetworking = require(Parent.AppChatNetworking),
	llama = LuaSocialLibrariesDepsModule.llama,
	NetworkingChat = require(Parent.SharedFlags).getFFlagSocialTabReplaceRefreshConversations() and LuaSocialLibrariesDepsModule.NetworkingChat.config({ roduxNetworking = ConfigResult }) or nil,
	RoduxUsers = LuaSocialLibrariesDepsModule.RoduxUsers.config({ keyPath = "SocialTab.Users" }),
	RoduxFriends = require(Parent.FriendsRodux).config({ keyPath = "SocialTab.Friends" }),
	RoduxPresence = LuaSocialLibrariesDepsModule.RoduxPresence.config({ keyPath = "SocialTab.Presence" })
}