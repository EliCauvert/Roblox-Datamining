local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local ConstantsModule = require(Foundation.Constants)
local _ = require(Foundation.Enums.DialogSize)
local _ = require(Foundation.Parent.React)

return {
	nonSelectable = ConstantsModule.MODAL.DISABLE_SELECTION,
	isolatedSelectionGroup = ConstantsModule.MODAL.TRAP_FOCUS
}