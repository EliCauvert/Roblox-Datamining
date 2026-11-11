local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local _ = require(Parent.MomentsTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local ReactToFeedItemModule = require(script.Parent.Requests.reactToFeedItem)

return function(p1)
	-- upvalues: HttpClientModule (copy), ReactToFeedItemModule (copy)
	local P0 = p1 or {}
	
	return {
		reactToFeedItem = function(p2)
			-- upvalues: HttpClientModule (upval), ReactToFeedItemModule (upval), P0 (copy)
			return HttpClientModule.asPromise(ReactToFeedItemModule(p2, P0.network))
		end
	}
end