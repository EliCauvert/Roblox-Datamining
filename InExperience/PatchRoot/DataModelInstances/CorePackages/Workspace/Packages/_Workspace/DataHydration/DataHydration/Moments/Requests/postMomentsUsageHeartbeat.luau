local DataHydration = script:FindFirstAncestor("DataHydration")
local HttpClientModule = require(DataHydration.Parent.HttpClient)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local DecodeMomentsUsageModule = require(DataHydration.Moments.Util.decodeMomentsUsage)

return function(Network)
	-- upvalues: ConstructApiUrlModule (copy), HttpClientModule (copy), DecodeMomentsUsageModule (copy)
	local Heartbeat, Heartbeat2 = ConstructApiUrlModule("content-captures-api/v2/moments/usage/heartbeat")
	
	return HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.post-moments-usage-heartbeat",
		retry = false,
		url = Heartbeat,
		headers = Heartbeat2,
		body = {},
		network = Network,
		decode = DecodeMomentsUsageModule
	})
end