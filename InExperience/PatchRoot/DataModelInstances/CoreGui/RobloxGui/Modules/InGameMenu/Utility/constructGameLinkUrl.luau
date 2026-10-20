local UrlModule = require(script.Parent.Parent.Network.Url)

return function(p1): string
	-- upvalues: UrlModule (copy)
	return `{UrlModule.DOMAIN}games/{p1}`
end