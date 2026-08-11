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

local function shouldRefreshCachedEmojiSets(value) --[[ line: 25 ]]
	return value == nil
end

return function(value) --[[ line: 29 | named "createMomentsEmojiSetsStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), httpClientModule (ref), getEmojiSetsModule (ref), validateMomentsEmojiCatalogModule (ref), promiseModule (ref), shouldRefreshCachedEmojiSets (ref), resolveMomentsEmojiCatalogModule (ref)
	local value_1 = value or {}
	local var10 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(_, _) --[[ line: 36 ]]
			-- upvalues: httpClientModule (copy), getEmojiSetsModule (copy), value_1 (ref), validateMomentsEmojiCatalogModule (copy), promiseModule (copy)
			return httpClientModule.asPromise(getEmojiSetsModule(value_1.network)):andThen(function(p0) --[[ line: 41 ]]
				-- upvalues: validateMomentsEmojiCatalogModule (copy), promiseModule (copy)
				return if validateMomentsEmojiCatalogModule.isValidCachedGetEmojiSetsResponse(p0) then p0 else promiseModule.reject("Moments emoji-api returned an invalid or empty catalog")
			end)
		end
	})
	
	return {
		getAndFetchEmojiSets = function() --[[ line: 50 ]]
			-- upvalues: var10 (ref), shouldRefreshCachedEmojiSets (copy)
			return var10.getAndFetchItem("emoji-sets", shouldRefreshCachedEmojiSets)
		end,
		getEmojis = function(p1) --[[ line: 56 ]]
			-- upvalues: var10 (ref), resolveMomentsEmojiCatalogModule (copy)
			return resolveMomentsEmojiCatalogModule.resolveMomentsEmojiCatalog(var10.getCachedItem("emoji-sets").data(p1)).emojis
		end,
		dispose = function() --[[ line: 61 ]]
			-- upvalues: var10 (ref)
			var10.dispose()
		end
	}
end