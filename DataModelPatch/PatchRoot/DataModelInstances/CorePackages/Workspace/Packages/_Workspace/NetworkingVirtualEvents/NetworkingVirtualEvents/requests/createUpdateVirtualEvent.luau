local NetworkingVirtualEvents = script:FindFirstAncestor("NetworkingVirtualEvents")
local HttpModule = require(NetworkingVirtualEvents.Parent.Http)
local _ = require(NetworkingVirtualEvents.types)

return function(p1)
	-- upvalues: HttpModule (copy)
	return (p1.POST(script.Name, function(Callback, p2, p3)
		-- upvalues: HttpModule (upval)
		local EventTime = p3.eventTime
		
		return Callback(HttpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(p2):body({
			title = p3.title,
			description = p3.description,
			eventTime = if EventTime then {
				startTime = EventTime.startTime:ToIsoDate(),
				endTime = EventTime.endTime:ToIsoDate()
			} else nil,
			universeId = p3.universeId
		})
	end))
end