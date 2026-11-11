local ReactModule = require(game:GetService("CorePackages").Packages.React)
local BaseDialogModule = require(script.Parent.Parent.Shared.BaseDialog)
local UseDuplicateOutfitNameDialogPropsModule = require(script.Parent.useDuplicateOutfitNameDialogProps)

return function()
	-- upvalues: UseDuplicateOutfitNameDialogPropsModule (copy), ReactModule (copy), BaseDialogModule (copy)
	return ReactModule.createElement(BaseDialogModule, (UseDuplicateOutfitNameDialogPropsModule()))
end