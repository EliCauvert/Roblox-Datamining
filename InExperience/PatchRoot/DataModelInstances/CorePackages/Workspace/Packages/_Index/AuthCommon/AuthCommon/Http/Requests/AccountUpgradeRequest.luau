local Parent = script:FindFirstAncestor("AuthCommon").Parent
local HttpService = game:GetService("HttpService")
local _ = require(Parent.Http)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder

return function(Callback, p1) --[[ Line: 25 ]]
	-- upvalues: UrlBuilder (copy), HttpService (copy)
	return Callback(UrlBuilder.fromString("auth:v1/account/upgrade")(), "POST", {
		maxRetryCount = 0,
		postBody = HttpService:JSONEncode({
			upgradeType = p1.upgradeType,
			username = p1.username,
			password = if p1.password == "" then nil else p1.password,
			birthday = if p1.birthday == "" then nil else p1.birthday,
			email = if p1.email == "" then nil else p1.email,
			gender = p1.gender
		}),
		headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	})
end