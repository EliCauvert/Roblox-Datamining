local networkingVirtualEvents = script:FindFirstAncestor("NetworkingVirtualEvents")
local httpModule = require(networkingVirtualEvents.Parent.Http)
local _ = require(networkingVirtualEvents.types)

return function(p0) --[[ line: 6 ]]
	-- upvalues: httpModule (ref)
	return p0.POST(script.Name, function(p1, p2) --[[ line: 9 ]]
		-- upvalues: httpModule (copy)
		return p1(httpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):path("create"):body({
			title = p2.title,
			description = p2.description,
			eventTime = {
				startTime = p2.eventTime.startTime:ToIsoDate(),
				endTime = p2.eventTime.endTime:ToIsoDate()
			},
			universeId = p2.universeId
		})
	end)
end