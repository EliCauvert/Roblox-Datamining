local Foundation = script:FindFirstAncestor("Foundation")
local ConstantsModule = require(Foundation.Constants)
local _ = require(Foundation.Enums.DialogSize)
local _ = require(Foundation.Enums.OnCloseCallbackReason)

return {
	nonSelectable = ConstantsModule.MODAL.DISABLE_SELECTION,
	isolatedSelectionGroup = ConstantsModule.MODAL.TRAP_FOCUS
}