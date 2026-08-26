local httpModule = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http)

return function(p1)
	-- upvalues: httpModule (ref)
	return p1.GET(script.Name, function(p2, p3)
		-- upvalues: httpModule (copy)
		local active = p2(httpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):path("active")
		
		if p3 then
			active = active:queryArgs(p3)
		end
		return active
	end)
end