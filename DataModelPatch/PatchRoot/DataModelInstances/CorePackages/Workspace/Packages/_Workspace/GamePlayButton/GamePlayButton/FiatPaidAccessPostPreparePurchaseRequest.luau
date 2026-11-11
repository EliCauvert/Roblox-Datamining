local HttpService = game:GetService("HttpService")
local Url = require(script:FindFirstAncestor("GamePlayButton").Parent.Http).Url

return function(Callback, Root_place_id, Expected_base_price_id)
	-- upvalues: Url (copy), HttpService (copy)
	return Callback(string.format("%s/fiat-paid-access-service/v1/purchase", Url.APIS_URL), "POST", {
		postBody = HttpService:JSONEncode({
			expected_base_price_id = Expected_base_price_id,
			root_place_id = Root_place_id
		})
	})
end