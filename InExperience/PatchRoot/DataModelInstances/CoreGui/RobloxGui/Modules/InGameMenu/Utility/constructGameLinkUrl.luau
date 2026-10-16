local UrlModule = require(script.Parent.Parent.Network.Url)

return function(p1): string --[[ Line: 4 | Named "constructGameLinkUrl" ]]
	-- upvalues: UrlModule (copy)
	return `{UrlModule.DOMAIN}games/{p1}`
end