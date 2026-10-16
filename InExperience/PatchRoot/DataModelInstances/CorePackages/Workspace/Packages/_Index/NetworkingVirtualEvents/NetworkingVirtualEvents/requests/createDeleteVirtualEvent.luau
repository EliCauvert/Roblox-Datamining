local HttpModule = require(script:FindFirstAncestor("NetworkingVirtualEvents").Parent.Http)

return function(p1) --[[ Line: 5 ]]
	-- upvalues: HttpModule (copy)
	return (p1.POST(script.Name, function(Callback, p2) --[[ Line: 6 ]]
		-- upvalues: HttpModule (upval)
		return Callback(HttpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(p2)
	end))
end