local parent = script.Parent.Parent
local parent_1 = parent.Parent
local luaSocialLibrariesDepsModule = require(parent_1.LuaSocialLibrariesDeps)
local lumberyakModule = require(parent_1.Lumberyak)
local contentSharingNetworkingModule = require(parent_1.ContentSharingNetworking)
local shareLinksNetworkingModule = require(parent_1.ShareLinksNetworking)
local shareLinksRoduxModule = require(parent_1.ShareLinksRodux)
local fFlagCreateMomentsToastModule = require(parent.Flags.FFlagCreateMomentsToast)
local httpRequest = luaSocialLibrariesDepsModule.httpRequest
local var1 = lumberyakModule.Logger.new(nil, require(parent.Constants).LoggerKey)
local var2 = luaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "NetworkStatus",
	networkImpl = httpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: var1 (ref), httpRequest (ref)
			var1:debug(`Request: [ requestMethod = {p2}, url = {p1} ]`)
			
			return httpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		maxRetryCount = game:DefineFastInt("CapturesMaxHttpRequestRetries", 2),
		maxWaitTime = game:DefineFastInt("CapturesMaxHttpRequestWaitTime", 8)
	})
})

return {
	RoduxNetworking = var2,
	ContentSharingNetworking = if fFlagCreateMomentsToastModule then contentSharingNetworkingModule.config({ roduxNetworking = var2 }) else nil,
	ShareLinksNetworking = shareLinksNetworkingModule.config({ roduxNetworking = var2 }),
	ShareLinksRodux = shareLinksRoduxModule.config({ keyPath = "ShareLinks" })
}