local DataHydration = script:FindFirstAncestor("DataHydration")
local HttpClientModule = require(DataHydration.Parent.HttpClient)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)

local function _(p1, p2): string
	return `moment-comments-api/v1/moments/{p1}/comments/{p2}`
end

return function(p1, p2, Network)
	-- upvalues: ConstructApiUrlModule (copy), HttpClientModule (copy)
	local ConstructApiUrlModuleResult, ConstructApiUrlModuleResult2 = ConstructApiUrlModule(`moment-comments-api/v1/moments/{p1}/comments/{p2}`)
	
	return HttpClientModule.fetch({
		method = "DELETE",
		analyticsKey = "moments.delete-comment",
		url = ConstructApiUrlModuleResult,
		headers = ConstructApiUrlModuleResult2,
		network = Network,
		decode = function(_)
			return nil
		end
	})
end