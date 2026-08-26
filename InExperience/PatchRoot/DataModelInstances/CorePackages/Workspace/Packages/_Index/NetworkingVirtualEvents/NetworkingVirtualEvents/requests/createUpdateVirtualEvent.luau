local networkingVirtualEvents = script:FindFirstAncestor("NetworkingVirtualEvents")
local httpModule = require(networkingVirtualEvents.Parent.Http)
local _ = require(networkingVirtualEvents.types)

return function(p1)
	-- upvalues: httpModule (ref)
	return p1.POST(script.Name, function(p2, p3, p4)
		-- upvalues: httpModule (copy)
		local eventTime = p4.eventTime
		
		return p2(httpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):id(p3):body({
			title = p4.title,
			description = p4.description,
			eventTime = if eventTime then {
				startTime = eventTime.startTime:ToIsoDate(),
				endTime = eventTime.endTime:ToIsoDate()
			} else nil,
			universeId = p4.universeId
		})
	end)
end