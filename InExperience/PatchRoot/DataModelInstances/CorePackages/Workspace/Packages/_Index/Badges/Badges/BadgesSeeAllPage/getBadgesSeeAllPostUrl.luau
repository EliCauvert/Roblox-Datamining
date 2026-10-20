local Parent = script:FindFirstAncestor("Badges").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "landing-page-api/badges-see-all/v1beta1",
	base = require(Parent.Http).Url.APIS_URL
})

return function()
	-- upvalues: NewResult (copy)
	return NewResult()
end