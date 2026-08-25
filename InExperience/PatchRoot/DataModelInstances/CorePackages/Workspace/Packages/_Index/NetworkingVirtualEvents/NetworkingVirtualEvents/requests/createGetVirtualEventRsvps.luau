local httpModule = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http)

return function(p0)
	-- upvalues: httpModule (ref)
	return p0.GET(script.Name, function(p1, p2, p3)
		-- upvalues: httpModule (copy)
		local rsvps = p1(httpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(p2):path("rsvps")
		
		if p3 then
			rsvps = rsvps:queryArgs(p3)
		end
		return rsvps
	end)
end