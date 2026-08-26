local _ = require(script:FindFirstAncestor("GraphQLServer").graphql.generatedTypes)

return function(p1)
	local currentDateTime = DateTime.now()
	local dateTime = DateTime.fromUnixTimestamp(currentDateTime.UnixTimestamp + 86400)
	
	return {
		title = "Event Name",
		description = "Event description goes here...",
		universeId = "3531439676",
		eventStatus = "active",
		userRsvpStatus = "none",
		id = p1,
		host = {
			hostType = "user",
			hostId = "1",
			hostName = "Roblox",
			hasVerifiedBadge = true
		},
		eventTime = {
			startUtc = currentDateTime:ToIsoDate(),
			endUtc = dateTime:ToIsoDate(),
			startTime = currentDateTime,
			endTime = dateTime
		},
		createdTime = currentDateTime,
		updatedTime = currentDateTime,
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