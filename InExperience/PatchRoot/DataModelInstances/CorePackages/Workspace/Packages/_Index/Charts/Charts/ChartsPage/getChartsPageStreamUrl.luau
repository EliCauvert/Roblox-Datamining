local parent = script:FindFirstAncestor("Charts").Parent
local var0 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "charts-api/v1/charts-page-stream",
	base = require(parent.Http).Url.APIS_URL
})

return function() --[[ line: 15 | named "getChartsPageStreamUrl" ]]
	-- upvalues: var0 (ref)
	return var0()
end