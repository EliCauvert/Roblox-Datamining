local _ = require(script:FindFirstAncestor("DataHydration").DataHydrationTypes)

return {
	PreviewSpecStatus = {
		Current = "current",
		OlderCommit = "older_commit",
		Unverified = "unverified"
	},
	PreviewSpecPinned = { Pr = "pr", Hash = "hash" }
}