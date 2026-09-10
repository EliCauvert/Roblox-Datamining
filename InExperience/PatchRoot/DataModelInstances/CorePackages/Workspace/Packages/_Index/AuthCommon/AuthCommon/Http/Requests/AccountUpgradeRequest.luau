local parent = script:FindFirstAncestor("AuthCommon").Parent
local httpService = game:GetService("HttpService")
local _ = require(parent.Http)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder

return function(p1, p2)
	-- upvalues: urlBuilder (ref), httpService (ref)
	return p1(urlBuilder.fromString("auth:v1/account/upgrade")(), "POST", {
		maxRetryCount = 0,
		postBody = httpService:JSONEncode({
			upgradeType = "Pioneer",
			username = p2.username,
			password = p2.password,
			birthday = p2.birthday,
			email = if p2.email == "" then nil else p2.email,
			gender = p2.gender
		}),
		headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	})
end