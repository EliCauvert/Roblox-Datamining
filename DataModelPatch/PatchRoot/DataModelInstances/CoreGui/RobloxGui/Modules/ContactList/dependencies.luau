local CorePackages = game:GetService("CorePackages")
local LuaSocialLibrariesDepsModule = require(CorePackages.Packages.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local ContactListNetworking = require(CorePackages.Packages.Lumberyak).Logger.new(nil, "ContactList"):new("ContactList Networking")
local ConfigResult = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: ContactListNetworking (copy), HttpRequest (copy)
			ContactListNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: ContactListNetworking (copy)
			ContactListNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("ContactListHttpRetryCount", 3)
	})
})

return {
	Hooks = {
		dependencyArray = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.dependencyArray,
		useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch,
		useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector,
		usePrevious = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.usePrevious,
		useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
	},
	NetworkingCall = LuaSocialLibrariesDepsModule.NetworkingCall.config({ useMockedResponse = true, roduxNetworking = ConfigResult }),
	RoduxCall = LuaSocialLibrariesDepsModule.RoduxCall.config({ keyPath = "Call" }),
	RoduxFriends = require(CorePackages.Workspace.Packages.FriendsRodux).config({ keyPath = "Friends" }),
	RoduxPresence = LuaSocialLibrariesDepsModule.RoduxPresence.config({ keyPath = "Presence" }),
	RoduxUsers = LuaSocialLibrariesDepsModule.RoduxUsers.config({ keyPath = "Users" }),
	RoduxNetworking = ConfigResult,
	NetworkingPresence = LuaSocialLibrariesDepsModule.NetworkingPresence.config({ roduxNetworking = ConfigResult }),
	NetworkingFriends = require(CorePackages.Workspace.Packages.FriendsNetworking).config({ roduxNetworking = ConfigResult }),
	NetworkingUsers = LuaSocialLibrariesDepsModule.NetworkingUsers.config({ roduxNetworking = ConfigResult }),
	SocialLibraries = LuaSocialLibrariesDepsModule.SocialLibraries.config({}),
	UIBlox = require(CorePackages.Packages.UIBlox),
	Foundation = require(CorePackages.Packages.Foundation),
	enumerate = require(CorePackages.Packages.enumerate),
	getStandardSizeAvatarHeadShotRbxthumb = require(CorePackages.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb,
	teleportToRootPlace = require(script.Parent.teleportToRootPlace)
}