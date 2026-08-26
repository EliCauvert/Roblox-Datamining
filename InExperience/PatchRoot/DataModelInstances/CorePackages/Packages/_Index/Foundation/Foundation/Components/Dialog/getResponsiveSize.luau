local foundation = script:FindFirstAncestor("Foundation")
local dialogSizeModule = require(foundation.Enums.DialogSize)
local _ = require(foundation.Providers.Style.Tokens)
local DIALOG_SIZES = require(script.Parent.useDialogVariants).DIALOG_SIZES

return function(p1, p2, p3)
	-- upvalues: dialogSizeModule (ref), DIALOG_SIZES (ref)
	local var1 = ({
		[dialogSizeModule.Small] = p3.Padding.Large,
		[dialogSizeModule.Medium] = p3.Padding.XLarge,
		[dialogSizeModule.Large] = p3.Padding.XLarge
	})[p2] * 2
	local scale = p3.Config.UI.Scale
	
	return if p1 <= DIALOG_SIZES[dialogSizeModule.Medium] * scale + var1 and p2 ~= dialogSizeModule.Small then dialogSizeModule.Small elseif p1 <= DIALOG_SIZES[dialogSizeModule.Large] * scale + var1 and p2 == dialogSizeModule.Large then dialogSizeModule.Medium else p2
end