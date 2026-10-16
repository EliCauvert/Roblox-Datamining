local Parent = script:FindFirstAncestor("AuthCommon").Parent
local HttpService = game:GetService("HttpService")
local _ = require(Parent.Http)
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "usernames/users",
	base = require(Parent.Http).Url.USERS_URL
})

return function(Callback, p1, p2) --[[ Line: 40 ]]
	-- upvalues: NewResult (copy), HttpService (copy)
	return Callback(NewResult(), "POST", {
		postBody = HttpService:JSONEncode({ usernames = { p1 }, excludeBannedUsers = p2 or false })
	})
end