local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.MomentsTypes)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local GetEmojiSetsModule = require(script.Parent.Requests.getEmojiSets)
local DecodeEmojiSetsModule = require(script.Parent.Util.decodeEmojiSets)
local ResolveMomentsEmojiCatalogModule = require(script.Parent.Util.resolveMomentsEmojiCatalog)
local ValidateMomentsEmojiCatalogModule = require(script.Parent.Util.validateMomentsEmojiCatalog)

local function shouldRefreshCachedEmojiSets(p1): boolean --[[ Line: 26 ]]
	return p1 == nil
end

return function(p1) --[[ Line: 30 | Named "createMomentsEmojiSetsStore" ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), HttpClientModule (copy), GetEmojiSetsModule (copy), ValidateMomentsEmojiCatalogModule (copy), PromiseModule (copy), shouldRefreshCachedEmojiSets (copy), ResolveMomentsEmojiCatalogModule (copy), DecodeEmojiSetsModule (copy)
	local P1 = p1 or {}
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		fetchFn = function(_, _) --[[ Line: 37 ]]
			-- upvalues: HttpClientModule (upval), GetEmojiSetsModule (upval), P1 (copy), ValidateMomentsEmojiCatalogModule (upval), PromiseModule (upval)
			return HttpClientModule.asPromise(GetEmojiSetsModule(P1.network)):andThen(function(Result) --[[ Line: 42 ]]
				-- upvalues: ValidateMomentsEmojiCatalogModule (upval), PromiseModule (upval)
				return if ValidateMomentsEmojiCatalogModule.isValidCachedGetEmojiSetsResponse(Result) then Result else PromiseModule.reject("Moments emoji-api returned an invalid or empty catalog")
			end)
		end
	})
	
	return {
		getAndFetchEmojiSets = function() --[[ Line: 51 ]]
			-- upvalues: DataResolverModule (copy), shouldRefreshCachedEmojiSets (upval)
			return DataResolverModule.getAndFetchItem("emoji-sets", shouldRefreshCachedEmojiSets)
		end,
		getEmojis = function(p2) --[[ Line: 57 ]]
			-- upvalues: DataResolverModule (copy), ResolveMomentsEmojiCatalogModule (upval)
			return ResolveMomentsEmojiCatalogModule.resolveMomentsEmojiCatalog((DataResolverModule.getCachedItem("emoji-sets").data(p2))).emojis
		end,
		getCachedEmojiCatalog = function(p2) --[[ Line: 62 ]]
			-- upvalues: DataResolverModule (copy), ValidateMomentsEmojiCatalogModule (upval), DecodeEmojiSetsModule (upval)
			local EmojiSetsCachedItem = DataResolverModule.getCachedItem("emoji-sets")
			local DataResult = EmojiSetsCachedItem.data(p2)
			
			return if ValidateMomentsEmojiCatalogModule.isValidCachedGetEmojiSetsResponse(DataResult) then {
				source = "cache",
				emojis = DecodeEmojiSetsModule.flattenEmojis(DataResult),
				status = EmojiSetsCachedItem.status(p2)
			} else {
				source = "unavailable",
				emojis = {},
				status = EmojiSetsCachedItem.status(p2)
			}
		end,
		dispose = function() --[[ Line: 79 ]]
			-- upvalues: DataResolverModule (copy)
			DataResolverModule.dispose()
		end
	}
end