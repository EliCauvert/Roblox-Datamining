local HttpModule = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http)

return function(p1)
	-- upvalues: HttpModule (copy)
	return (p1.GET(script.Name, function(Callback, p2, p3)
		-- upvalues: HttpModule (upval)
		local Rsvps = Callback(HttpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(p2):path("rsvps")
		
		if p3 then
			Rsvps = Rsvps:queryArgs(p3)
		end
		return Rsvps
	end))
end