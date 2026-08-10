local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local _ = require(parent.MomentsTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local reactToFeedItemModule = require(script.Parent.Requests.reactToFeedItem)
local reactToFeedItemV2Module = require(script.Parent.Requests.reactToFeedItemV2)
local createMomentsEmojiSetsStoreModule = require(script.Parent.createMomentsEmojiSetsStore)
local fFlagMomentsEmojiSetsApiModule = require(script.Parent.FFlagMomentsEmojiSetsApi)

return function(p0) --[[ line: 19 | named "createMomentsReactionsStore" ]]
	-- upvalues: httpClientModule (ref), reactToFeedItemModule (ref), reactToFeedItemV2Module (ref), promiseModule (ref), fFlagMomentsEmojiSetsApiModule (ref), createMomentsEmojiSetsStoreModule (ref)
	p0 = p0 or {}
	
	local function reactToFeedItem(p1) --[[ line: 22 ]]
		-- upvalues: httpClientModule (copy), reactToFeedItemModule (copy), p0 (ref)
		return httpClientModule.asPromise(reactToFeedItemModule(p1, p0.network))
	end
	
	local function reactToFeedItemV2(p2) --[[ line: 26 ]]
		-- upvalues: httpClientModule (copy), reactToFeedItemV2Module (copy), p0 (ref), promiseModule (copy)
		return httpClientModule.asPromise(reactToFeedItemV2Module(p2, p0.network)):catch(function(p3) --[[ line: 27 ]]
			-- upvalues: promiseModule (copy)
			warn(`[Moments] Failed to react to feed item (v2): {tostring(p3)}`)
			
			return promiseModule.reject(p3)
		end)
	end
	
	if fFlagMomentsEmojiSetsApiModule then
		local var9 = createMomentsEmojiSetsStoreModule(p0)
		
		return {
			reactToFeedItem = reactToFeedItem,
			reactToFeedItemV2 = reactToFeedItemV2,
			getAndFetchEmojiSets = var9.getAndFetchEmojiSets,
			getEmojis = var9.getEmojis
		}
	end
	return { reactToFeedItem = reactToFeedItem }
end