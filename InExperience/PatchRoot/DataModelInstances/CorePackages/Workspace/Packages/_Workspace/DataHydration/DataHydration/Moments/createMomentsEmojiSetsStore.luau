local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local _ = require(parent.MomentsTypes)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local getEmojiSetsModule = require(script.Parent.Requests.getEmojiSets)
local resolveMomentsEmojiCatalogModule = require(script.Parent.Util.resolveMomentsEmojiCatalog)
local validateMomentsEmojiCatalogModule = require(script.Parent.Util.validateMomentsEmojiCatalog)

local function shouldRefreshCachedEmojiSets(value)
	return value == nil
end

return function(value)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), httpClientModule (ref), getEmojiSetsModule (ref), validateMomentsEmojiCatalogModule (ref), promiseModule (ref), shouldRefreshCachedEmojiSets (ref), resolveMomentsEmojiCatalogModule (ref)
	local value_1 = value or {}
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(_, _)
			-- upvalues: httpClientModule (copy), getEmojiSetsModule (copy), value_1 (ref), validateMomentsEmojiCatalogModule (copy), promiseModule (copy)
			return httpClientModule.asPromise(getEmojiSetsModule(value_1.network)):andThen(function(p1)
				-- upvalues: validateMomentsEmojiCatalogModule (copy), promiseModule (copy)
				return if validateMomentsEmojiCatalogModule.isValidCachedGetEmojiSetsResponse(p1) then p1 else promiseModule.reject("Moments emoji-api returned an invalid or empty catalog")
			end)
		end
	})
	
	return {
		getAndFetchEmojiSets = function()
			-- upvalues: var1 (ref), shouldRefreshCachedEmojiSets (copy)
			return var1.getAndFetchItem("emoji-sets", shouldRefreshCachedEmojiSets)
		end,
		getEmojis = function(p1)
			-- upvalues: var1 (ref), resolveMomentsEmojiCatalogModule (copy)
			return resolveMomentsEmojiCatalogModule.resolveMomentsEmojiCatalog(var1.getCachedItem("emoji-sets").data(p1)).emojis
		end,
		dispose = function()
			-- upvalues: var1 (ref)
			var1.dispose()
		end
	}
end