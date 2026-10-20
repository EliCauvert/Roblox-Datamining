local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local config = { Approve = 1, Deny = 2 }
local v1 = require(ChallengeDialog.Parent.enumerate)(script.Name, config)
require(ChallengeDialog.Enum.addRawValueMethodToEnum)(v1, config)

return v1