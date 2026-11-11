local Parent = script.Parent.Parent

return require(Parent.UrlBuilder).UrlBuilder.new({
	path = "assets/user-auth",
	base = require(Parent.UrlBuilder).UrlBase.APIS
})()