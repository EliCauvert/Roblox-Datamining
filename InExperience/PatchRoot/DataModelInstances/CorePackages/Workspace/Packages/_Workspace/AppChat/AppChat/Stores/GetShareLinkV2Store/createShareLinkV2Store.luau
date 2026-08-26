local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local dataHydrationModule = require(parent.DataHydration)
local httpClientModule = require(parent.HttpClient)
local classifyShareLinkV2Module = require(appChat.Components.ChatConversation.Utils.RobloxUrlUtils.classifyShareLinkV2)
local name = require(appChat.Logger):new(script.Name)
local fetchResolvedShareLinkModule = require(script.Parent.Requests.fetchResolvedShareLink)

return function(p1)
	-- upvalues: dataHydrationModule (ref), name (ref), httpClientModule (ref), fetchResolvedShareLinkModule (ref), classifyShareLinkV2Module (ref)
	p1 = p1 or {}
	local var1 = dataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		replaceItems = true,
		cache = dataHydrationModule.createDataCache(p1.ttlSeconds, p1.failedTtlSeconds),
		logError = function(p2)
			-- upvalues: name (copy)
			name:warning(`Error resolving share link v2: {tostring(p2)}`)
		end,
		fetchFn = function(p2)
			-- upvalues: httpClientModule (copy), fetchResolvedShareLinkModule (copy), p1 (ref), classifyShareLinkV2Module (copy)
			return httpClientModule.asPromise(fetchResolvedShareLinkModule(p2, p1.network)):andThen(classifyShareLinkV2Module)
		end
	})
	
	return {
		getCachedClassification = var1.getCachedItem,
		fetchClassification = var1.fetchItem,
		getAndFetchClassification = var1.getAndFetchItem,
		clear = var1.clear,
		dispose = var1.dispose
	}
end