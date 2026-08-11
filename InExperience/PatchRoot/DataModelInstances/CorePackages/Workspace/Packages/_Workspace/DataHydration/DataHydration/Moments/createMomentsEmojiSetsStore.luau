local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local _ = require(parent.MomentsTypes)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local getEmojiSetsModule = require(script.Parent.Requests.getEmojiSets)
local decodeEmojiSetsModule = require(script.Parent.Util.decodeEmojiSets)
local hardcodedMomentsEmojisModule = require(script.Parent.Util.hardcodedMomentsEmojis)

local function shouldRefreshCachedEmojiSets(value) --[[ line: 24 ]]
	return value == nil
end

return function(value) --[[ line: 28 | named "createMomentsEmojiSetsStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), httpClientModule (ref), getEmojiSetsModule (ref), shouldRefreshCachedEmojiSets (ref), decodeEmojiSetsModule (ref), hardcodedMomentsEmojisModule (ref)
	local value_1 = value or {}
	local var9 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		logError = function(p0) --[[ line: 35 ]]
			warn(`[Moments] Failed to fetch emoji sets: {tostring(p0)}`)
		end,
		fetchFn = function(_, _) --[[ line: 38 ]]
			-- upvalues: httpClientModule (copy), getEmojiSetsModule (copy), value_1 (ref)
			return httpClientModule.asPromise(getEmojiSetsModule(value_1.network))
		end
	})
	
	return {
		getAndFetchEmojiSets = function() --[[ line: 46 ]]
			-- upvalues: var9 (ref), shouldRefreshCachedEmojiSets (copy)
			return var9.getAndFetchItem("emoji-sets", shouldRefreshCachedEmojiSets)
		end,
		getEmojis = function(p1) --[[ line: 52 ]]
			-- upvalues: var9 (ref), decodeEmojiSetsModule (copy), hardcodedMomentsEmojisModule (copy)
			local var10 = decodeEmojiSetsModule.flattenEmojis(var9.getCachedItem("emoji-sets").data(p1))
			
			return if #var10 > 0 then var10 else hardcodedMomentsEmojisModule
		end,
		dispose = function() --[[ line: 61 ]]
			-- upvalues: var9 (ref)
			var9.dispose()
		end
	}
end