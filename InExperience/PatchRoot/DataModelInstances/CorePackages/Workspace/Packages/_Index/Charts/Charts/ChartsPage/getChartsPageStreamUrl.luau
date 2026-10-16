local Parent = script:FindFirstAncestor("Charts").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "charts-api/v1/charts-page-stream",
	base = require(Parent.Http).Url.APIS_URL
})

return function() --[[ Line: 15 | Named "getChartsPageStreamUrl" ]]
	-- upvalues: NewResult (copy)
	return NewResult()
end