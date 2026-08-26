local urlModule = require(script.Parent.Parent.Network.Url)

return function(p1)
	-- upvalues: urlModule (ref)
	return `{urlModule.DOMAIN}games/{p1}`
end