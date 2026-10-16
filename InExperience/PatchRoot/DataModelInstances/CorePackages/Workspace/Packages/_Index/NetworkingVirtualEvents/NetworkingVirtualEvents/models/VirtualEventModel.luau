local _ = require(script:FindFirstAncestor("NetworkingVirtualEvents").types)

return {
	mock = function(Id) --[[ Line: 7 ]]
		local _DateTime = DateTime.now()
		
		return {
			title = "Event Name",
			description = "Event description goes here...",
			universeId = 3531439676,
			placeId = 123456789,
			eventStatus = "active",
			userRsvpStatus = "none",
			id = Id,
			host = {
				hostType = "user",
				hostId = 1,
				hostName = "Roblox",
				hasVerifiedBadge = true
			},
			eventTime = {
				startTime = _DateTime,
				endTime = DateTime.fromUnixTimestamp(_DateTime.UnixTimestamp + 86400),
				startUtc = _DateTime:ToIsoDate(),
				endUtc = _DateTime:ToIsoDate()
			},
			createdTime = _DateTime,
			updatedTime = _DateTime
		}
	end,
	fromResponse = function(p1) --[[ Line: 38 ]]
		local _DateTime = DateTime.fromIsoDate(p1.eventTime.startUtc)
		local _DateTime1 = DateTime.fromIsoDate(p1.eventTime.endUtc)
		local _DateTime2 = DateTime.fromIsoDate(p1.createdUtc)
		local _DateTime3 = DateTime.fromIsoDate(p1.updatedUtc)
		
		return if _DateTime and _DateTime1 and _DateTime2 and _DateTime3 then {
			id = p1.id,
			title = p1.title,
			description = p1.description,
			host = p1.host,
			eventTime = {
				startTime = _DateTime,
				endTime = _DateTime1,
				startUtc = p1.eventTime.startUtc,
				endUtc = p1.eventTime.endUtc
			},
			universeId = p1.universeId,
			placeId = p1.placeId,
			eventStatus = p1.eventStatus,
			createdTime = _DateTime2,
			updatedTime = _DateTime3,
			userRsvpStatus = p1.userRsvpStatus
		} else nil
	end
}