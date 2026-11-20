local ReactModule = require(script:FindFirstAncestor("AvatarWorkshop").Parent.React)
local CurrentAvatarPreviewViewModule = require(script.Parent.CurrentAvatarPreviewView)
local UseCurrentAvatarPreviewViewModelModule = require(script.Parent.useCurrentAvatarPreviewViewModel)

return function()
	-- upvalues: UseCurrentAvatarPreviewViewModelModule (copy), ReactModule (copy), CurrentAvatarPreviewViewModule (copy)
	return ReactModule.createElement(CurrentAvatarPreviewViewModule, (UseCurrentAvatarPreviewViewModelModule()))
end