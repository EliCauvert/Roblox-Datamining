local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local _ = require(parent.MomentsTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local reactToFeedItemModule = require(script.Parent.Requests.reactToFeedItem)
local reactToFeedItemV2Module = require(script.Parent.Requests.reactToFeedItemV2)
local createMomentsEmojiSetsStoreModule = require(script.Parent.createMomentsEmojiSetsStore)
local fFlagMomentsEmojiSetsApiModule = require(script.Parent.FFlagMomentsEmojiSetsApi)
local fFlagMomentsComments = require(parent.SharedFlags).FFlagMomentsComments

return function(p1)
	-- upvalues: httpClientModule (ref), reactToFeedItemModule (ref), reactToFeedItemV2Module (ref), promiseModule (ref), fFlagMomentsEmojiSetsApiModule (ref), fFlagMomentsComments (ref), createMomentsEmojiSetsStoreModule (ref)
	p1 = p1 or {}
	
	local function reactToFeedItem(p2)
		-- upvalues: httpClientModule (copy), reactToFeedItemModule (copy), p1 (ref)
		return httpClientModule.asPromise(reactToFeedItemModule(p2, p1.network))
	end
	
	local function reactToFeedItemV2(p2)
		-- upvalues: httpClientModule (copy), reactToFeedItemV2Module (copy), p1 (ref), promiseModule (copy)
		return httpClientModule.asPromise(reactToFeedItemV2Module(p2, p1.network)):catch(function(p3)
			-- upvalues: promiseModule (copy)
			warn(`[Moments] Failed to react to feed item (v2): {tostring(p3)}`)
			
			return promiseModule.reject(p3)
		end)
	end
	
	if not fFlagMomentsEmojiSetsApiModule and not fFlagMomentsComments then
		return { reactToFeedItem = reactToFeedItem }
	end
	local var1 = createMomentsEmojiSetsStoreModule(p1)
	local t = {
		reactToFeedItem = reactToFeedItem,
		getAndFetchEmojiSets = var1.getAndFetchEmojiSets
	}
	
	if fFlagMomentsComments then
		t.getCachedEmojiCatalog = var1.getCachedEmojiCatalog
	end
	if fFlagMomentsEmojiSetsApiModule then
		t.reactToFeedItemV2 = reactToFeedItemV2
		t.getEmojis = var1.getEmojis
	end
	return t
end