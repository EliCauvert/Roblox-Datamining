local Parent = script:FindFirstAncestor("Charts").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "charts-api/v1/charts-page",
	base = require(Parent.Http).Url.APIS_URL
})

return function()
	-- upvalues: NewResult (copy)
	return NewResult()
end