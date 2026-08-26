local parent = script:FindFirstAncestor("Home").Parent
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "discovery-api/v2/home-page",
	base = require(parent.Http).Url.APIS_URL
})

return function()
	-- upvalues: var1 (ref)
	return var1()
end