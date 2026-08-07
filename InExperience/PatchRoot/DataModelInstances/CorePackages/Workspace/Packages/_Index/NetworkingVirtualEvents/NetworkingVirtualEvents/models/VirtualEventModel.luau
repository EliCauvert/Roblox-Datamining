local _ = require(script:FindFirstAncestor("NetworkingVirtualEvents").types)

return {
	mock = function(p0) --[[ line: 7 ]]
		local currentDateTime = DateTime.now()
		
		return {
			title = "Event Name",
			description = "Event description goes here...",
			universeId = 3531439676,
			placeId = 123456789,
			eventStatus = "active",
			userRsvpStatus = "none",
			id = p0,
			host = {
				hostType = "user",
				hostId = 1,
				hostName = "Roblox",
				hasVerifiedBadge = true
			},
			eventTime = {
				startTime = currentDateTime,
				endTime = DateTime.fromUnixTimestamp(currentDateTime.UnixTimestamp + 86400),
				startUtc = currentDateTime:ToIsoDate(),
				endUtc = currentDateTime:ToIsoDate()
			},
			createdTime = currentDateTime,
			updatedTime = currentDateTime
		}
	end,
	fromResponse = function(p1) --[[ line: 38 ]]
		local dateTime = DateTime.fromIsoDate(p1.eventTime.startUtc)
		local dateTime_1 = DateTime.fromIsoDate(p1.eventTime.endUtc)
		local dateTime_2 = DateTime.fromIsoDate(p1.createdUtc)
		local dateTime_3 = DateTime.fromIsoDate(p1.updatedUtc)
		
		return if dateTime and dateTime_1 and (dateTime_2 and dateTime_3) then {
			id = p1.id,
			title = p1.title,
			description = p1.description,
			host = p1.host,
			eventTime = {
				startTime = dateTime,
				endTime = dateTime_1,
				startUtc = p1.eventTime.startUtc,
				endUtc = p1.eventTime.endUtc
			},
			universeId = p1.universeId,
			placeId = p1.placeId,
			eventStatus = p1.eventStatus,
			createdTime = dateTime_2,
			updatedTime = dateTime_3,
			userRsvpStatus = p1.userRsvpStatus
		} else nil
	end
}