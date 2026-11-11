local _ = require(script:FindFirstAncestor("GraphQLServer").graphql.generatedTypes)

return function(Id)
	local _DateTime = DateTime.now()
	local _DateTime1 = DateTime.fromUnixTimestamp(_DateTime.UnixTimestamp + 86400)
	
	return {
		title = "Event Name",
		description = "Event description goes here...",
		universeId = "3531439676",
		eventStatus = "active",
		userRsvpStatus = "none",
		id = Id,
		host = {
			hostType = "user",
			hostId = "1",
			hostName = "Roblox",
			hasVerifiedBadge = true
		},
		eventTime = {
			startUtc = _DateTime:ToIsoDate(),
			endUtc = _DateTime1:ToIsoDate(),
			startTime = _DateTime,
			endTime = _DateTime1
		},
		createdTime = _DateTime,
		updatedTime = _DateTime,
		eventCategories = {
			{ category = "challenge", rank = 0 },
			{ category = "newContent", rank = 1 }
		},
		experienceDetails = {
			id = "3531439676",
			name = "Experience Name",
			playing = 50000
		},
		rsvpCounters = { going = 2500, notGoing = 0, none = 0, maybeGoing = 0 },
		rsvps = {
			{ userId = "957765952", rsvpStatus = "going" },
			{ userId = "35392", rsvpStatus = "going" },
			{ userId = "4416634", rsvpStatus = "going" },
			{ userId = "1893522417", rsvpStatus = "going" },
			{ userId = "1343930", rsvpStatus = "going" },
			{ userId = "29819622", rsvpStatus = "notGoing" },
			{ userId = "1668748746", rsvpStatus = "notGoing" },
			{ userId = "308199922", rsvpStatus = "notGoing" }
		}
	}
end