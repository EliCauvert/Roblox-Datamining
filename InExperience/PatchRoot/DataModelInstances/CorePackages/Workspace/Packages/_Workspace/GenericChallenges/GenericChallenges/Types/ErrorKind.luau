local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local config = {
	Unknown = "Unknown",
	Invalidated = "Invalidated",
	Abandoned = "Abandoned",
	LoadFailed = "LoadFailed"
}
local v1 = require(GenericChallenges.Parent.enumerate)(script.Name, config)
require(GenericChallenges.Utils.addRawValueMethodToEnum)(v1, config)

return v1