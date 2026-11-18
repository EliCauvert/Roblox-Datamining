local Parent = script:FindFirstAncestor("BuildExperience").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "landing-page-api/v1/build-page",
	base = require(Parent.Http).Url.APIS_URL
})

return function()
	-- upvalues: NewResult (copy)
	return NewResult()
end