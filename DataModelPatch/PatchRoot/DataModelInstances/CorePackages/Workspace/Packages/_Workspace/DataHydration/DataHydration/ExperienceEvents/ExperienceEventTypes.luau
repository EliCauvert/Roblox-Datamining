local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(DataHydration.Parent.Signals)

return {
	EventStatus = {
		Upcoming = "Upcoming",
		UpcomingImminent = "UpcomingImminent",
		Ongoing = "Ongoing",
		ElapsedImminent = "ElapsedImminent",
		Elapsed = "Elapsed"
	},
	EventRsvpTypes = { Going = "going", NotGoing = "notGoing", Maybe = "maybe" }
}