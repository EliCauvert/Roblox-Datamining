local _ = require(script:FindFirstAncestor("NetworkingVirtualEvents").types)

return function(p0) --[[ line: 5 | named "createMockVirtualEventResponse" ]]
	return {
		title = "Event Title",
		description = "Event description...",
		universeId = 1,
		placeId = 123456789,
		eventStatus = "active",
		userRsvpStatus = "none",
		id = p0,
		host = {
			hostType = "user",
			hostId = 1,
			hostName = "Roblox",
			hasVerifiedBadge = false
		},
		eventTime = {
			startUtc = DateTime.fromLocalTime(2022, 1, 1):ToIsoDate(),
			endUtc = DateTime.fromLocalTime(2022, 1, 7):ToIsoDate()
		},
		createdUtc = DateTime.fromLocalTime(2022, 1, 1):ToIsoDate(),
		updatedUtc = DateTime.fromLocalTime(2022, 1, 1):ToIsoDate()
	}
end