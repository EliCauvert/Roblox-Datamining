local httpModule = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http)

return function(p0) --[[ line: 5 ]]
	-- upvalues: httpModule (ref)
	return p0.GET(script.Name, function(p1, p2) --[[ line: 6 ]]
		-- upvalues: httpModule (copy)
		return p1(httpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(p2):path("rsvps"):path("counters")
	end)
end