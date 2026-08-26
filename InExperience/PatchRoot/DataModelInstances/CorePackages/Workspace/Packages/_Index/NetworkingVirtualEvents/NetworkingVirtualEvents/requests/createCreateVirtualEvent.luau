local networkingVirtualEvents = script:FindFirstAncestor("NetworkingVirtualEvents")
local httpModule = require(networkingVirtualEvents.Parent.Http)
local _ = require(networkingVirtualEvents.types)

return function(p1)
	-- upvalues: httpModule (ref)
	return p1.POST(script.Name, function(p2, p3)
		-- upvalues: httpModule (copy)
		return p2(httpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):path("create"):body({
			title = p3.title,
			description = p3.description,
			eventTime = {
				startTime = p3.eventTime.startTime:ToIsoDate(),
				endTime = p3.eventTime.endTime:ToIsoDate()
			},
			universeId = p3.universeId
		})
	end)
end