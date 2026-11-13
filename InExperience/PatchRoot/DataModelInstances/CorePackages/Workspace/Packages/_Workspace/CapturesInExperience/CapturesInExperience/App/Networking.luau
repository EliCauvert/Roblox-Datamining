local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local LuaSocialLibrariesDepsModule = require(Parent1.LuaSocialLibrariesDeps)
local LumberyakModule = require(Parent1.Lumberyak)
local ContentSharingNetworkingModule = require(Parent1.ContentSharingNetworking)
local ShareLinksNetworkingModule = require(Parent1.ShareLinksNetworking)
local ShareLinksRoduxModule = require(Parent1.ShareLinksRodux)
local FFlagCreateMomentsToastModule = require(Parent.Flags.FFlagCreateMomentsToast)
local FFlagMomentsCaptureEndIxpEnabledModule = require(Parent.Flags.FFlagMomentsCaptureEndIxpEnabled)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local NewResult = LumberyakModule.Logger.new(nil, require(Parent.Constants).LoggerKey)
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
	ContentSharingNetworking = if FFlagCreateMomentsToastModule or FFlagMomentsCaptureEndIxpEnabledModule then ContentSharingNetworkingModule.config({ roduxNetworking = ConfigResult }) else nil,
	ShareLinksNetworking = ShareLinksNetworkingModule.config({ roduxNetworking = ConfigResult }),
	ShareLinksRodux = ShareLinksRoduxModule.config({ keyPath = "ShareLinks" })
}