local parent = script:FindFirstAncestor("Charts").Parent
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "charts-api/v1/charts-sort-detail",
	base = require(parent.Http).Url.APIS_URL
})

return function()
	-- upvalues: var1 (ref)
	return var1()
end