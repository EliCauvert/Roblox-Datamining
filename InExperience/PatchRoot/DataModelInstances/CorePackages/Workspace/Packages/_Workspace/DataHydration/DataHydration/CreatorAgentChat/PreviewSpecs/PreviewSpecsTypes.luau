local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(DataHydration.Parent.Signals)

return {
	PreviewSpecStatus = {
		Current = "current",
		OlderCommit = "older_commit",
		Unverified = "unverified"
	},
	PreviewSpecPinned = { Pr = "pr", Hash = "hash" }
}