local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("GamePlayButton").Parent.Http).Url

return function(p0, p1, p2)
	-- upvalues: url (ref), httpService (ref)
	return p0(string.format("%s/fiat-paid-access-service/v1/purchase", url.APIS_URL), "POST", {
		postBody = httpService:JSONEncode({ expected_base_price_id = p2, root_place_id = p1 })
	})
end