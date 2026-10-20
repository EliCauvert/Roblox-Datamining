local Parent = script:FindFirstAncestor("InviteLinkExpiredModal").Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local InviteLinkExpiredModalNetworking = require(Parent.Lumberyak).Logger.new(nil, "InviteLinkExpiredModal"):new("InviteLinkExpiredModal Networking")
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local ConfigResult = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "InviteLinkExpiredModal.NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: InviteLinkExpiredModalNetworking (copy), HttpRequest (copy)
			InviteLinkExpiredModalNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: InviteLinkExpiredModalNetworking (copy)
			InviteLinkExpiredModalNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("InviteLinkExpiredModalHttpRetryCount", 3)
	})
})

return {
	Dash = require(Parent.Dash),
	Roact = require(Parent.Roact),
	RoactRodux = require(Parent.RoactRodux),
	RoactNavigation = require(Parent.RoactNavigation),
	Rodux = require(Parent.Rodux),
	t = require(Parent.t),
	UIBlox = require(Parent.UIBlox),
	Foundation = require(Parent.Foundation),
	LocalizationProvider = require(Parent.Localization).LocalizationProvider,
	withLocalization = require(Parent.Localization).withLocalization,
	llama = LuaSocialLibrariesDepsModule.llama,
	SocialLibraries = LuaSocialLibrariesDepsModule.SocialLibraries.config({}),
	RoduxGames = LuaSocialLibrariesDepsModule.RoduxGames.config({ keyPath = "InviteLinkExpiredModal.Games" }),
	ShareLinksRodux = require(Parent.ShareLinksRodux).config({ keyPath = "InviteLinkExpiredModal.ShareLinks" }),
	RoduxNetworking = ConfigResult,
	NetworkingGames = LuaSocialLibrariesDepsModule.NetworkingGames.config({ roduxNetworking = ConfigResult })
}