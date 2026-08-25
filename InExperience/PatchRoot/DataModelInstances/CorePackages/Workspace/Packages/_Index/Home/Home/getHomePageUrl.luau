local parent = script:FindFirstAncestor("Home").Parent
local var0 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "discovery-api/v2/home-page",
	base = require(parent.Http).Url.APIS_URL
})

return function()
	-- upvalues: var0 (ref)
	return var0()
end