local Home = script:FindFirstAncestor("Home")
local Parent = Home.Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	base = require(Parent.Http).Url.APIS_URL,
	path = require(Home.HomeConstants).ApiName
})

return function() --[[ Line: 13 | Named "getHomePageUrl" ]]
	-- upvalues: NewResult (copy)
	return NewResult()
end