local HttpModule = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http)

return function(p1)
	-- upvalues: HttpModule (copy)
	return (p1.GET(script.Name, function(Callback, p2)
		-- upvalues: HttpModule (upval)
		return Callback(HttpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(p2)
	end))
end