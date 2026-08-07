local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local parent = foundation.Parent
local constantsModule = require(foundation.Constants)
local _ = require(foundation.Enums.DialogSize)
local _ = require(parent.React)

return {
	nonSelectable = constantsModule.MODAL.DISABLE_SELECTION,
	isolatedSelectionGroup = constantsModule.MODAL.TRAP_FOCUS
}