local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local _ = require(parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)

return function(p1, p2)
	-- upvalues: constructApiUrlModule (ref), httpClientModule (ref)
	local var1, var2 = constructApiUrlModule("content-captures-api/v2/moments/react-to-feed-item-v2")
	
	return httpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.react-to-feed-item-v2",
		url = var1,
		headers = var2,
		body = p1,
		network = p2,
		decode = function(p3)
			return p3 or {}
		end
	})
end