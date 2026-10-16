local Foundation = script:FindFirstAncestor("Foundation")
local DialogSizeModule = require(Foundation.Enums.DialogSize)
local _ = require(Foundation.Providers.Style.Tokens)
local DIALOGSIZES = require(script.Parent.useDialogVariants).DIALOG_SIZES

return function(p1, Large, p2) --[[ Line: 11 | Named "getResponsiveSize" ]]
	-- upvalues: DialogSizeModule (copy), DIALOGSIZES (copy)
	local ScaledEntry = ({
		[DialogSizeModule.Small] = p2.Padding.Large,
		[DialogSizeModule.Medium] = p2.Padding.XLarge,
		[DialogSizeModule.Large] = p2.Padding.XLarge
	})[Large] * 2
	local Scale = p2.Config.UI.Scale
	
	return if p1 <= DIALOGSIZES[DialogSizeModule.Medium] * Scale + ScaledEntry and Large ~= DialogSizeModule.Small then DialogSizeModule.Small elseif p1 <= DIALOGSIZES[DialogSizeModule.Large] * Scale + ScaledEntry and Large == DialogSizeModule.Large then DialogSizeModule.Medium else Large
end