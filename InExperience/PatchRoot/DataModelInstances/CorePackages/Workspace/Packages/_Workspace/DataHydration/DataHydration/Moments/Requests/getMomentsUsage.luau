local DataHydration = script:FindFirstAncestor("DataHydration")
local HttpClientModule = require(DataHydration.Parent.HttpClient)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local DecodeMomentsUsageModule = require(DataHydration.Moments.Util.decodeMomentsUsage)

return function(Network)
	-- upvalues: ConstructApiUrlModule (copy), HttpClientModule (copy), DecodeMomentsUsageModule (copy)
	local Usage, Usage2 = ConstructApiUrlModule("content-captures-api/v2/moments/usage")
	
	return HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-moments-usage",
		url = Usage,
		headers = Usage2,
		network = Network,
		decode = DecodeMomentsUsageModule
	})
end