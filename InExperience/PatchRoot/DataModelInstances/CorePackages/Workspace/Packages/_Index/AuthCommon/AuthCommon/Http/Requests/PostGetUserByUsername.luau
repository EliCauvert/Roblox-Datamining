local parent = script:FindFirstAncestor("AuthCommon").Parent
local httpService = game:GetService("HttpService")
local _ = require(parent.Http)
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "usernames/users",
	base = require(parent.Http).Url.USERS_URL
})

return function(p0, p1, p2) --[[ line: 40 ]]
	-- upvalues: var1 (ref), httpService (ref)
	return p0(var1(), "POST", {
		postBody = httpService:JSONEncode({ usernames = { p1 }, excludeBannedUsers = p2 or false })
	})
end