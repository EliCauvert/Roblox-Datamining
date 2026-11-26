local ReactModule = require(script:FindFirstAncestor("AvatarWorkshop").Parent.React)
local InGameAvatarPreviewViewModule = require(script.Parent.InGameAvatarPreviewView)
local UseInGameAvatarPreviewViewModelModule = require(script.Parent.useInGameAvatarPreviewViewModel)

return function(p1)
	-- upvalues: UseInGameAvatarPreviewViewModelModule (copy), ReactModule (copy), InGameAvatarPreviewViewModule (copy)
	return ReactModule.createElement(InGameAvatarPreviewViewModule, (UseInGameAvatarPreviewViewModelModule(p1)))
end