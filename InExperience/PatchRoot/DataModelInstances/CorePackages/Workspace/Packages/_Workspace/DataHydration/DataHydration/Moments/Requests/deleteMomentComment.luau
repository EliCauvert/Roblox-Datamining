local dataHydration = script:FindFirstAncestor("DataHydration")
local httpClientModule = require(dataHydration.Parent.HttpClient)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)

local function _(p1, p2)
	return `moment-comments-api/v1/moments/{p1}/comments/{p2}`
end

return function(p1, p2, p3)
	-- upvalues: constructApiUrlModule (ref), httpClientModule (ref)
	local var1, var2 = constructApiUrlModule(`moment-comments-api/v1/moments/{p1}/comments/{p2}`)
	
	return httpClientModule.fetch({
		method = "DELETE",
		analyticsKey = "moments.delete-comment",
		url = var1,
		headers = var2,
		network = p3,
		decode = function(_)
			return nil
		end
	})
end