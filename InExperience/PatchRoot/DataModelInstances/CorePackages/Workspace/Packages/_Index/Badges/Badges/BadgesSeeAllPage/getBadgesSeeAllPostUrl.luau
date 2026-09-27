local parent = script:FindFirstAncestor("Badges").Parent
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "landing-page-api/badges-see-all/v1beta1",
	base = require(parent.Http).Url.APIS_URL
})

return function()
	-- upvalues: var1 (ref)
	return var1()
end