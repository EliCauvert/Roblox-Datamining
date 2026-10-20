local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent1.LuaSocialLibrariesDeps)
local ContentSharingNetworkingModule = require(Parent1.ContentSharingNetworking)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local NewResult = require(Parent1.Lumberyak).Logger.new(nil, require(Parent.Constants).LoggerKey)
local ConfigResult = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: NewResult (copy), HttpRequest (copy)
			NewResult:debug(`Request: [ requestMethod = {p2}, url = {p1} ]`)
			
			return HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		maxRetryCount = game:DefineFastInt("CapturesMaxHttpRequestRetries", 2),
		maxWaitTime = game:DefineFastInt("CapturesMaxHttpRequestWaitTime", 8)
	})
})

return {
	RoduxNetworking = ConfigResult,
	ContentSharingNetworking = if require(Parent.Flags.FFlagCreateMomentsToast) then ContentSharingNetworkingModule.config({ roduxNetworking = ConfigResult }) else nil,
	ShareLinksNetworking = require(Parent1.ShareLinksNetworking).config({ roduxNetworking = ConfigResult }),
	ShareLinksRodux = require(Parent1.ShareLinksRodux).config({ keyPath = "ShareLinks" })
}