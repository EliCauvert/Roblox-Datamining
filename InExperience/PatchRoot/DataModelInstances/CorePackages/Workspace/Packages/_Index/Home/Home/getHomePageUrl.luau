local home = script:FindFirstAncestor("Home")
local parent = home.Parent
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	base = require(parent.Http).Url.APIS_URL,
	path = require(home.HomeConstants).ApiName
})

return function()
	-- upvalues: var1 (ref)
	return var1()
end