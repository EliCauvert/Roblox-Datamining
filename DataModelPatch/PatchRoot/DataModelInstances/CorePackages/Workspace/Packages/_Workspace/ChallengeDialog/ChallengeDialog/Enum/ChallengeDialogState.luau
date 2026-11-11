local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local config = {
	DIALOG_STATE_INVALID = 0,
	DIALOG_STATE_PENDING = 1,
	DIALOG_STATE_ACTIVE = 2,
	DIALOG_STATE_APPROVED = 3,
	DIALOG_STATE_DENIED = 4
}
local v1 = require(ChallengeDialog.Parent.enumerate)(script.Name, config)
require(ChallengeDialog.Enum.addRawValueMethodToEnum)(v1, config)

return v1