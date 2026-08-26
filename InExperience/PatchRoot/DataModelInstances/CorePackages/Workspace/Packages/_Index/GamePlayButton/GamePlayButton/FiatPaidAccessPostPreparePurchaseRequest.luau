local httpService = game:GetService("HttpService")
local url = require(script:FindFirstAncestor("GamePlayButton").Parent.Http).Url

return function(p1, p2, p3)
	-- upvalues: url (ref), httpService (ref)
	return p1(string.format("%s/fiat-paid-access-service/v1/purchase", url.APIS_URL), "POST", {
		postBody = httpService:JSONEncode({ expected_base_price_id = p3, root_place_id = p2 })
	})
end