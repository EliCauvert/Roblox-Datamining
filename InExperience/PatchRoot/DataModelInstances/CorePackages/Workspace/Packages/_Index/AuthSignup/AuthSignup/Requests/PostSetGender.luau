local parent = script:FindFirstAncestor("AuthSignup").Parent
local httpService = game:GetService("HttpService")
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "gender",
	base = require(parent.Http).Url.USERS_URL
})

return function(p1, p2)
	-- upvalues: var1 (ref), httpService (ref)
	return p1(var1(), "POST", { postBody = httpService:JSONEncode({ gender = p2 }) })
end