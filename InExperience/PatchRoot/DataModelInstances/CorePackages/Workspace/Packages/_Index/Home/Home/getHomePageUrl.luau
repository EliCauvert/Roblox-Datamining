local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	base = require(Parent.Http).Url.APIS_URL,
	path = require(Home.HomeConstants).ApiName
})

return function()
	-- upvalues: NewResult (copy)
	return NewResult()
end