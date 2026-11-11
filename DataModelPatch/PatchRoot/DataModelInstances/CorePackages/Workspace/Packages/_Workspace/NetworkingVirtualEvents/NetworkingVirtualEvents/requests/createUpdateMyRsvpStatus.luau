local NetworkingVirtualEvents = script:FindFirstAncestor("NetworkingVirtualEvents")
local HttpModule = require(NetworkingVirtualEvents.Parent.Http)
local _ = require(NetworkingVirtualEvents.types)

return function(p1)
	-- upvalues: HttpModule (copy)
	return (p1.POST(script.Name, function(Callback, p2, RsvpStatus)
		-- upvalues: HttpModule (upval)
		return (Callback(HttpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(p2):path("rsvps"):body({ rsvpStatus = RsvpStatus }))
	end))
end