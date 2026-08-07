local parent = script.Parent.Parent

return require(parent.UrlBuilder).UrlBuilder.new({
	path = "assets/user-auth",
	base = require(parent.UrlBuilder).UrlBase.APIS
})()