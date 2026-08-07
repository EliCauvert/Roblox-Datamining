local httpModule = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http)

return function(p0) --[[ line: 12 ]]
	-- upvalues: httpModule (ref)
	return p0.GET(script.Name, function(p1, p2) --[[ line: 13 ]]
		-- upvalues: httpModule (copy)
		local active = p1(httpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):path("active")
		
		if p2 then
			active = active:queryArgs(p2)
		end
		return active
	end)
end