local ReactModule = require(script:FindFirstAncestor("AvatarWorkshop").Parent.React)
local AddAvatarDialogViewModule = require(script.Parent.AddAvatarDialogView)
local UseAddAvatarDialogViewModelModule = require(script.Parent.useAddAvatarDialogViewModel)

return function(p1)
	-- upvalues: UseAddAvatarDialogViewModelModule (copy), ReactModule (copy), AddAvatarDialogViewModule (copy)
	return ReactModule.createElement(AddAvatarDialogViewModule, (UseAddAvatarDialogViewModelModule(p1)))
end