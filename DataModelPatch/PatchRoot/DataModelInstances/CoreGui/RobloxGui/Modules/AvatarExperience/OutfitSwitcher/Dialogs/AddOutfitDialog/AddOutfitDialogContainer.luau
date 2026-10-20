local ReactModule = require(game:GetService("CorePackages").Packages.React)
local BaseDialogWithTextboxModule = require(script.Parent.Parent.Shared.BaseDialogWithTextbox)
local UseAddOutfitDialogPropsModule = require(script.Parent.useAddOutfitDialogProps)

return function()
	-- upvalues: UseAddOutfitDialogPropsModule (copy), ReactModule (copy), BaseDialogWithTextboxModule (copy)
	return ReactModule.createElement(BaseDialogWithTextboxModule, (UseAddOutfitDialogPropsModule()))
end