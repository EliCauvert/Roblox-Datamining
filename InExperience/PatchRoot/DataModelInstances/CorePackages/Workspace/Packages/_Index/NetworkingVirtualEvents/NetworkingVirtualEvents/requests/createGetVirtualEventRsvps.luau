local httpModule = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http)

return function(p1)
	-- upvalues: httpModule (ref)
	return p1.GET(script.Name, function(p2, p3, p4)
		-- upvalues: httpModule (copy)
		local rsvps = p2(httpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(p3):path("rsvps")
		
		if p4 then
			rsvps = rsvps:queryArgs(p4)
		end
		return rsvps
	end)
end