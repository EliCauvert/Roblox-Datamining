local urlModule = require(script.Parent.Parent.Network.Url)

return function(p0) --[[ line: 4 | named "constructGameLinkUrl" ]]
	-- upvalues: urlModule (ref)
	return `{urlModule.DOMAIN}games/{p0}`
end