local httpModule = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http)

return function(p0)
	-- upvalues: httpModule (ref)
	return p0.GET(script.Name, function(p1)
		-- upvalues: httpModule (copy)
		return p1(httpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):path("my-events")
	end)
end