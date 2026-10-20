local HttpModule = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http)

return function(p1)
	-- upvalues: HttpModule (copy)
	return (p1.GET(script.Name, function(Callback, p2)
		-- upvalues: HttpModule (upval)
		local Active = Callback(HttpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):path("active")
		
		if p2 then
			Active = Active:queryArgs(p2)
		end
		return Active
	end))
end