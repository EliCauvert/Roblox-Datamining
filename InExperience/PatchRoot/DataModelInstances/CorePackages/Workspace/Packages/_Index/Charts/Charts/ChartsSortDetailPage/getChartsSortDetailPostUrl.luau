local Parent = script:FindFirstAncestor("Charts").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "charts-api/v1/charts-sort-detail",
	base = require(Parent.Http).Url.APIS_URL
})

return function() --[[ Line: 15 | Named "getChartsSortDetailPostUrl" ]]
	-- upvalues: NewResult (copy)
	return NewResult()
end