local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.MomentsTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local ReactToFeedItemModule = require(script.Parent.Requests.reactToFeedItem)
local ReactToFeedItemV2Module = require(script.Parent.Requests.reactToFeedItemV2)
local CreateMomentsEmojiSetsStoreModule = require(script.Parent.createMomentsEmojiSetsStore)
local FFlagMomentsEmojiSetsApiModule = require(script.Parent.FFlagMomentsEmojiSetsApi)
local FFlagMomentsComments = require(Parent.SharedFlags).FFlagMomentsComments

return function(p1) --[[ Line: 20 | Named "createMomentsReactionsStore" ]]
	-- upvalues: HttpClientModule (copy), ReactToFeedItemModule (copy), ReactToFeedItemV2Module (copy), PromiseModule (copy), FFlagMomentsEmojiSetsApiModule (copy), FFlagMomentsComments (copy), CreateMomentsEmojiSetsStoreModule (copy)
	local P0 = p1 or {}
	
	local function reactToFeedItem(p2) --[[ Line: 23 ]]
		-- upvalues: HttpClientModule (upval), ReactToFeedItemModule (upval), P0 (copy)
		return HttpClientModule.asPromise(ReactToFeedItemModule(p2, P0.network))
	end
	
	local function reactToFeedItemV2(p2) --[[ Line: 27 ]]
		-- upvalues: HttpClientModule (upval), ReactToFeedItemV2Module (upval), P0 (copy), PromiseModule (upval)
		return HttpClientModule.asPromise(ReactToFeedItemV2Module(p2, P0.network)):catch(function(Err) --[[ Line: 28 ]]
			-- upvalues: PromiseModule (upval)
			warn(`[Moments] Failed to react to feed item (v2): {tostring(Err)}`)
			
			return PromiseModule.reject(Err)
		end)
	end
	
	if not FFlagMomentsEmojiSetsApiModule and not FFlagMomentsComments then
		return { reactToFeedItem = reactToFeedItem }
	end
	local MomentsEmojiSetsStoreModule = CreateMomentsEmojiSetsStoreModule(P0)
	local config = {
		reactToFeedItem = reactToFeedItem,
		getAndFetchEmojiSets = MomentsEmojiSetsStoreModule.getAndFetchEmojiSets
	}
	
	if FFlagMomentsComments then
		config.getCachedEmojiCatalog = MomentsEmojiSetsStoreModule.getCachedEmojiCatalog
	end
	if FFlagMomentsEmojiSetsApiModule then
		config.reactToFeedItemV2 = reactToFeedItemV2
		config.getEmojis = MomentsEmojiSetsStoreModule.getEmojis
	end
	return config
end