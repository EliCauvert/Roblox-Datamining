local ChallengeDialog = script:FindFirstAncestor("ChallengeDialog")
local config = {
	DIALOG_TYPE_INVALID = 0,
	DIALOG_TYPE_APPROVAL_2SV_LOGIN = 1,
	DIALOG_TYPE_APPROVAL_2SV_GENERIC = 2
}
local v1 = require(ChallengeDialog.Parent.enumerate)(script.Name, config)
require(ChallengeDialog.Enum.addRawValueMethodToEnum)(v1, config)

return v1