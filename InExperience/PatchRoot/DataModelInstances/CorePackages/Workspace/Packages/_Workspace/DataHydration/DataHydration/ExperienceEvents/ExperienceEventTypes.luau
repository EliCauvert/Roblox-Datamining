local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(dataHydration.Parent.Signals)

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