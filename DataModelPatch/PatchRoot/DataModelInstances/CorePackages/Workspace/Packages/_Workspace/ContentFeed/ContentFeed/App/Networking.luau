local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent1.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local NewResult = require(Parent1.Lumberyak).Logger.new(nil, require(Parent.Constants).LoggerKey)
local ConfigResult = HttpRequest.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: NewResult (copy), HttpRequest (copy)
		NewResult:debug(`Request: [ requestMethod = {p2}, url = {p1} ]`)
		
		return HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	postRequestFunction = function(p1, p2)
		-- upvalues: NewResult (copy)
		NewResult:debug(`Response: [ requestMethod = {p2.requestMethod}, url = {p2.url}, statusCode = {p1.StatusCode}, body = {p1.Body} ]`)
	end,
	maxRetryCount = game:DefineFastInt("ContentFeedMaxHttpRequestRetries", 2),
	maxWaitTime = game:DefineFastInt("ContentFeedMaxHttpRequestWaitTime", 8)
})
local ConfigResult1 = LuaSocialLibrariesDepsModule.RoduxNetworking.config({ keyPath = "NetworkStatus", networkImpl = ConfigResult })

return {
	ContentFeedNetworkImpl = ConfigResult,
	ContentSharingNetworking = require(Parent1.ContentSharingNetworking).config({ roduxNetworking = ConfigResult1 }),
	ContentSharingRodux = require(Parent1.ContentSharingRodux).config({ keyPath = "ContentSharing" }),
	NetworkingCurrentlyWearing = LuaSocialLibrariesDepsModule.NetworkingCurrentlyWearing.config({ roduxNetworking = ConfigResult1 }),
	NetworkingGames = require(Parent1.NetworkingGames).config({ roduxNetworking = ConfigResult1 }),
	NetworkingUsers = require(Parent1.NetworkingUsers).config({ roduxNetworking = ConfigResult1 }),
	RoduxGames = require(Parent1.RoduxGames).config({ keyPath = "Games" }),
	RoduxNetworking = ConfigResult1,
	RoduxUsers = require(Parent1.RoduxUsers).config({ keyPath = "Users" }),
	ShareLinksNetworking = require(Parent1.ShareLinksNetworking).config({ roduxNetworking = ConfigResult1 }),
	ShareLinksRodux = require(Parent1.ShareLinksRodux).config({ keyPath = "ShareLinks" })
}