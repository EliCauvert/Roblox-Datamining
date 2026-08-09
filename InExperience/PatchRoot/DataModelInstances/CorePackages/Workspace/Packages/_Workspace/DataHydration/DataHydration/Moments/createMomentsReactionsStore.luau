local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local _ = require(parent.MomentsTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local reactToFeedItemModule = require(script.Parent.Requests.reactToFeedItem)

return function(p0) --[[ line: 14 | named "createMomentsReactionsStore" ]]
	-- upvalues: httpClientModule (ref), reactToFeedItemModule (ref)
	p0 = p0 or {}
	
	return {
		reactToFeedItem = function(p1) --[[ line: 17 ]]
			-- upvalues: httpClientModule (copy), reactToFeedItemModule (copy), p0 (ref)
			return httpClientModule.asPromise(reactToFeedItemModule(p1, p0.network))
		end
	}
end