local NetworkingVirtualEvents = script:FindFirstAncestor("NetworkingVirtualEvents")
local HttpModule = require(NetworkingVirtualEvents.Parent.Http)
local _ = require(NetworkingVirtualEvents.types)

return function(p1) --[[ Line: 6 ]]
	-- upvalues: HttpModule (copy)
	return (p1.POST(script.Name, function(Callback, p2) --[[ Line: 9 ]]
		-- upvalues: HttpModule (upval)
		return Callback(HttpModule.Url.APIS_URL):path("virtual-events"):path("v1"):path("virtual-events"):path("create"):body({
			title = p2.title,
			description = p2.description,
			eventTime = {
				startTime = p2.eventTime.startTime:ToIsoDate(),
				endTime = p2.eventTime.endTime:ToIsoDate()
			},
			universeId = p2.universeId
		})
	end))
end