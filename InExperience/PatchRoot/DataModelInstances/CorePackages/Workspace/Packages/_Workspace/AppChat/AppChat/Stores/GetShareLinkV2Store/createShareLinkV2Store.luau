local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local httpClientModule = require(parent.HttpClient)
local classifyShareLinkV2Module = require(appChat.Components.ChatConversation.Utils.RobloxUrlUtils.classifyShareLinkV2)
local name = require(appChat.Logger):new(script.Name)
local fetchResolvedShareLinkModule = require(script.Parent.Requests.fetchResolvedShareLink)

return function(p0) --[[ line: 29 | named "createShareLinkV2Store" ]]
	-- upvalues: dataHydrationModule (ref), name (ref), httpClientModule (ref), fetchResolvedShareLinkModule (ref), classifyShareLinkV2Module (ref)
	p0 = p0 or {}
	local var7 = dataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		replaceItems = true,
		cache = dataHydrationModule.createDataCache(p0.ttlSeconds, p0.failedTtlSeconds),
		logError = function(p1) --[[ line: 37 ]]
			-- upvalues: name (copy)
			name:warning(`Error resolving share link v2: {tostring(p1)}`)
		end,
		fetchFn = function(p2) --[[ line: 40 ]]
			-- upvalues: httpClientModule (copy), fetchResolvedShareLinkModule (copy), p0 (ref), classifyShareLinkV2Module (copy)
			return httpClientModule.asPromise(fetchResolvedShareLinkModule(p2, p0.network)):andThen(classifyShareLinkV2Module)
		end
	})
	
	return {
		getCachedClassification = var7.getCachedItem,
		fetchClassification = var7.fetchItem,
		getAndFetchClassification = var7.getAndFetchItem,
		clear = var7.clear,
		dispose = var7.dispose
	}
end