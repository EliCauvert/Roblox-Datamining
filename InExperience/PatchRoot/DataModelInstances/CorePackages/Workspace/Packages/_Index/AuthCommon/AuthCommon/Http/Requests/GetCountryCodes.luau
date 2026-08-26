local parent = script:FindFirstAncestor("AuthCommon").Parent
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "phone-number-api/v1/phone-prefix-list",
	base = require(parent.Http).Url.APIS_URL
})

return function(p1)
	-- upvalues: var1 (ref)
	return p1(var1(), "GET")
end