local Parent = script:FindFirstAncestor("AuthCommon").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "phone-number-api/v1/phone-prefix-list",
	base = require(Parent.Http).Url.APIS_URL
})

return function(Callback)
	-- upvalues: NewResult (copy)
	return Callback(NewResult(), "GET")
end