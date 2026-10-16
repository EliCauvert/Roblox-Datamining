local Parent = script:FindFirstAncestor("AuthSignup").Parent
local HttpService = game:GetService("HttpService")
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "gender",
	base = require(Parent.Http).Url.USERS_URL
})

return function(Callback, Gender) --[[ Line: 55 ]]
	-- upvalues: NewResult (copy), HttpService (copy)
	return Callback(NewResult(), "POST", { postBody = HttpService:JSONEncode({ gender = Gender }) })
end