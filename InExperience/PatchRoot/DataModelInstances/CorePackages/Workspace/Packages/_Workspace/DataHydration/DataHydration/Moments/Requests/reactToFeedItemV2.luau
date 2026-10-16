local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local _ = require(Parent.MomentsTypes)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)

return function(Body, Network) --[[ Line: 20 | Named "reactToFeedItemV2" ]]
	-- upvalues: ConstructApiUrlModule (copy), HttpClientModule (copy)
	local ReactToFeedItemV2, ReactToFeedItemV22 = ConstructApiUrlModule("content-captures-api/v2/moments/react-to-feed-item-v2")
	
	return HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.react-to-feed-item-v2",
		url = ReactToFeedItemV2,
		headers = ReactToFeedItemV22,
		body = Body,
		network = Network,
		decode = function(p1) --[[ Line: 33 ]]
			return p1 or {}
		end
	})
end