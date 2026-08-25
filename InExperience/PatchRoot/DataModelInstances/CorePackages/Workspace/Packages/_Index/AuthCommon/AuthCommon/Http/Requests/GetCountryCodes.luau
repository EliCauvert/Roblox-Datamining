local parent = script:FindFirstAncestor("AuthCommon").Parent
local var0 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "phone-number-api/v1/phone-prefix-list",
	base = require(parent.Http).Url.APIS_URL
})

return function(p0)
	-- upvalues: var0 (ref)
	return p0(var0(), "GET")
end