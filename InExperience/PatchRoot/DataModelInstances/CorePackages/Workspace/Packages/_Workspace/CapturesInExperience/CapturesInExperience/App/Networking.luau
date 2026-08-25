local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luaSocialLibrariesDepsModule = require(parent_1.LuaSocialLibrariesDeps)
local lumberyakModule = require(parent_1.Lumberyak)
local contentSharingNetworkingModule = require(parent_1.ContentSharingNetworking)
local shareLinksNetworkingModule = require(parent_1.ShareLinksNetworking)
local shareLinksRoduxModule = require(parent_1.ShareLinksRodux)
local fFlagCreateMomentsToastModule = require(parent.Flags.FFlagCreateMomentsToast)
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local var6 = lumberyakModule.Logger.new(nil, require(parent.Constants).LoggerKey)
local var7 = luaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p0, p1, p2)
			-- upvalues: var6 (ref), httpRequest (ref)
			var6:debug(`Request: [ requestMethod = {p1}, url = {p0} ]`)
			
			return httpRequest.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		maxRetryCount = game:DefineFastInt("CapturesMaxHttpRequestRetries", 2),
		maxWaitTime = game:DefineFastInt("CapturesMaxHttpRequestWaitTime", 8)
	})
})

return {
	RoduxNetworking = var7,
	ContentSharingNetworking = if fFlagCreateMomentsToastModule then contentSharingNetworkingModule.config({ roduxNetworking = var7 }) else nil,
	ShareLinksNetworking = shareLinksNetworkingModule.config({ roduxNetworking = var7 }),
	ShareLinksRodux = shareLinksRoduxModule.config({ keyPath = "ShareLinks" })
}