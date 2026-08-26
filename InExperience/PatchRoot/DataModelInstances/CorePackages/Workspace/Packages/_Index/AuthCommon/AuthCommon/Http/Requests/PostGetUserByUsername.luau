local parent = script:FindFirstAncestor("AuthCommon").Parent
local httpService = game:GetService("HttpService")
local _ = require(parent.Http)
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "usernames/users",
	base = require(parent.Http).Url.USERS_URL
})

return function(p1, p2, p3)
	-- upvalues: var1 (ref), httpService (ref)
	return p1(var1(), "POST", {
		postBody = httpService:JSONEncode({ usernames = { p2 }, excludeBannedUsers = p3 or false })
	})
end