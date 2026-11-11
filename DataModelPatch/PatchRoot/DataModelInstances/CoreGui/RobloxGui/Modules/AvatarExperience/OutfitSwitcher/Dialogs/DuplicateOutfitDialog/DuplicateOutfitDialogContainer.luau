local ReactModule = require(game:GetService("CorePackages").Packages.React)
local BaseDialogModule = require(script.Parent.Parent.Shared.BaseDialog)
local UseDuplicateOutfitDialogPropsModule = require(script.Parent.useDuplicateOutfitDialogProps)

return function()
	-- upvalues: UseDuplicateOutfitDialogPropsModule (copy), ReactModule (copy), BaseDialogModule (copy)
	return ReactModule.createElement(BaseDialogModule, (UseDuplicateOutfitDialogPropsModule()))
end