local httpModule = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http)

return function(p1)
	-- upvalues: httpModule (ref)
	return p1.POST(script.Name, function(p2, p3)
		-- upvalues: httpModule (copy)
		return p2(httpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(p3)
	end)
end