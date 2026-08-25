local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local _ = require(parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)

return function(p0, p1)
	-- upvalues: constructApiUrlModule (ref), httpClientModule (ref)
	local var3, var4 = constructApiUrlModule("content-captures-api/v2/moments/react-to-feed-item")
	
	return httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.react-to-feed-item",
		url = var3,
		headers = var4,
		body = p0,
		network = p1,
		decode = function(p2)
			return p2 or {}
		end
	})
end