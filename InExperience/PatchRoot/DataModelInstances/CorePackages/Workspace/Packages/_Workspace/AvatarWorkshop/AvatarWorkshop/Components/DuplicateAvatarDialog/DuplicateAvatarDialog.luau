local ReactModule = require(script:FindFirstAncestor("AvatarWorkshop").Parent.React)
local DuplicateAvatarDialogViewModule = require(script.Parent.DuplicateAvatarDialogView)
local UseDuplicateAvatarDialogViewModelModule = require(script.Parent.useDuplicateAvatarDialogViewModel)

return function(p1)
	-- upvalues: UseDuplicateAvatarDialogViewModelModule (copy), ReactModule (copy), DuplicateAvatarDialogViewModule (copy)
	return ReactModule.createElement(DuplicateAvatarDialogViewModule, (UseDuplicateAvatarDialogViewModelModule(p1)))
end