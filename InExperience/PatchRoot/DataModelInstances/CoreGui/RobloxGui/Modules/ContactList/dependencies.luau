local corePackagesService = game:GetService("CorePackages")
local luaSocialLibrariesDepsModule = require(corePackagesService.Packages.LuaSocialLibrariesDeps)
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local var2 = require(corePackagesService.Packages.Lumberyak).Logger.new(nil, "ContactList"):new("ContactList Networking")
local var3 = luaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p0, p1, p2) --[[ line: 10 ]]
			-- upvalues: var2 (ref), httpRequest (ref)
			var2:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
			
			return httpRequest.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		postRequestFunction = function(p3, p4) --[[ line: 14 ]]
			-- upvalues: var2 (ref)
			var2:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p4.requestMethod, p4.url, p3.StatusCode, p3.Body))
		end,
		maxRetryCount = game:DefineFastInt("ContactListHttpRetryCount", 3)
	})
})

return {
	Hooks = {
		dependencyArray = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.dependencyArray,
		useDispatch = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch,
		useSelector = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector,
		usePrevious = require(corePackagesService.Workspace.Packages.RoactUtils).Hooks.usePrevious,
		useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
	},
	NetworkingCall = luaSocialLibrariesDepsModule.NetworkingCall.config({ useMockedResponse = true, roduxNetworking = var3 }),
	RoduxCall = luaSocialLibrariesDepsModule.RoduxCall.config({ keyPath = "Call" }),
	RoduxFriends = require(corePackagesService.Workspace.Packages.FriendsRodux).config({ keyPath = "Friends" }),
	RoduxPresence = luaSocialLibrariesDepsModule.RoduxPresence.config({ keyPath = "Presence" }),
	RoduxUsers = luaSocialLibrariesDepsModule.RoduxUsers.config({ keyPath = "Users" }),
	RoduxNetworking = var3,
	NetworkingPresence = luaSocialLibrariesDepsModule.NetworkingPresence.config({ roduxNetworking = var3 }),
	NetworkingFriends = require(corePackagesService.Workspace.Packages.FriendsNetworking).config({ roduxNetworking = var3 }),
	NetworkingUsers = luaSocialLibrariesDepsModule.NetworkingUsers.config({ roduxNetworking = var3 }),
	SocialLibraries = luaSocialLibrariesDepsModule.SocialLibraries.config({}),
	UIBlox = require(corePackagesService.Packages.UIBlox),
	Foundation = require(corePackagesService.Packages.Foundation),
	enumerate = require(corePackagesService.Packages.enumerate),
	getStandardSizeAvatarHeadShotRbxthumb = require(corePackagesService.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb,
	teleportToRootPlace = require(script.Parent.teleportToRootPlace)
}