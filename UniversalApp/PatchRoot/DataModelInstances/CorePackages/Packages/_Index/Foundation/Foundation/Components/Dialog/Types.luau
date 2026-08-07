local foundation = script:FindFirstAncestor("Foundation")
local constantsModule = require(foundation.Constants)
local _ = require(foundation.Enums.DialogSize)
local _ = require(foundation.Enums.OnCloseCallbackReason)

return {
	nonSelectable = constantsModule.MODAL.DISABLE_SELECTION,
	isolatedSelectionGroup = constantsModule.MODAL.TRAP_FOCUS
}