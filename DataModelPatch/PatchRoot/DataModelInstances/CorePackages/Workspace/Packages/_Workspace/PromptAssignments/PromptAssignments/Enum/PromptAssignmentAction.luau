local config = {
	DismissPrompt = "DISMISS_PROMPT",
	DisablePrompt = "DISABLE_PROMPT"
}
local v1 = require(script:FindFirstAncestor("PromptAssignments").Parent.enumerate)(script.Name, config)
require(script.Parent.addRawValueMethodToEnum)(v1, config)

return v1