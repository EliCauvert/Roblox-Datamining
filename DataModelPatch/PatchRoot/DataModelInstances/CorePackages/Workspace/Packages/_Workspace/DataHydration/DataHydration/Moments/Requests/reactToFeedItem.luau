local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local _ = require(Parent.MomentsTypes)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)

return function(Body, Network)
	-- upvalues: ConstructApiUrlModule (copy), HttpClientModule (copy)
	local ReactToFeedItem, ReactToFeedItem2 = ConstructApiUrlModule("content-captures-api/v2/moments/react-to-feed-item")
	
	return HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.react-to-feed-item",
		url = ReactToFeedItem,
		headers = ReactToFeedItem2,
		body = Body,
		network = Network,
		decode = function(p1)
			return p1 or {}
		end
	})
end