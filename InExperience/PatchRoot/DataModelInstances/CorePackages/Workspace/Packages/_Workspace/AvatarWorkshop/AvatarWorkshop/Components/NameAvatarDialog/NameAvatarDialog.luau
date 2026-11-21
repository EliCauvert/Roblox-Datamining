local ReactModule = require(script:FindFirstAncestor("AvatarWorkshop").Parent.React)
local NameAvatarDialogViewModule = require(script.Parent.NameAvatarDialogView)
local UseNameAvatarDialogViewModelModule = require(script.Parent.useNameAvatarDialogViewModel)

return function(p1)
	-- upvalues: UseNameAvatarDialogViewModelModule (copy), ReactModule (copy), NameAvatarDialogViewModule (copy)
	return ReactModule.createElement(NameAvatarDialogViewModule, (UseNameAvatarDialogViewModelModule(p1)))
end