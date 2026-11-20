local ReactModule = require(script:FindFirstAncestor("AvatarWorkshop").Parent.React)
local AvatarPreviewViewModule = require(script.Parent.AvatarPreviewView)
local UseAvatarPreviewViewModelModule = require(script.Parent.useAvatarPreviewViewModel)

return function(p1)
	-- upvalues: UseAvatarPreviewViewModelModule (copy), ReactModule (copy), AvatarPreviewViewModule (copy)
	return ReactModule.createElement(AvatarPreviewViewModule, (UseAvatarPreviewViewModelModule(p1)))
end