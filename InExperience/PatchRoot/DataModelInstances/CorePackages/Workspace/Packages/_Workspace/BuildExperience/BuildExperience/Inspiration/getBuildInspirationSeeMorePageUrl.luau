local Parent = script:FindFirstAncestor("BuildExperience").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "landing-page-api/spotlight-collection",
	base = require(Parent.Http).Url.APIS_URL
})

return function()
	-- upvalues: NewResult (copy)
	return NewResult()
end